# compile.ps1 - AI Infrastructure Book Compilation Script
# Usage: .\compile.ps1

$TexLive = "C:\texlive\2026\bin\windows"
$env:Path = "$TexLive;" + [System.Environment]::GetEnvironmentVariable("Path", "Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path", "User")

Set-Location $PSScriptRoot

function Rebuild-TOC {
    Write-Host "Rebuilding .toc from .aux files..." -ForegroundColor Cyan
    python -c @"
import re, glob

all_entries = []
for aux_file in glob.glob('**/*.aux', recursive=True):
    try:
        with open(aux_file, 'r', encoding='utf-8', errors='replace') as f:
            for line in f:
                line = line.strip()
                if 'writefile{toc}' not in line:
                    continue
                idx = line.find('{toc}')
                if idx < 0: continue
                start = line.find('{', idx + 5)
                if start < 0: continue
                depth = 0
                end = -1
                for i in range(start, len(line)):
                    if line[i] == '{': depth += 1
                    elif line[i] == '}':
                        depth -= 1
                        if depth == 0:
                            end = i
                            break
                if end > start:
                    entry = line[start+1:end]
                    all_entries.append(entry)
    except: pass

toc = '\n'.join(all_entries)
with open('main.toc', 'w', encoding='utf-8') as f:
    f.write(toc)
print(f'{len(all_entries)} entries, {len(toc)} bytes written to main.toc')
"@
    if ($LASTEXITCODE -ne 0) {
        Write-Host "TOC rebuild failed!" -ForegroundColor Red
    }
}

# Step 1: Initial compilation
Write-Host "=== Pass 1/3 ===" -ForegroundColor Yellow
xelatex -interaction=nonstopmode main.tex
Rebuild-TOC

# Step 2: Second pass (now TOC is populated)
Write-Host "=== Pass 2/3 ===" -ForegroundColor Yellow
xelatex -interaction=nonstopmode main.tex
Rebuild-TOC

# Step 3: Final pass for stable page numbers
Write-Host "=== Pass 3/3 ===" -ForegroundColor Yellow
xelatex -interaction=nonstopmode main.tex
Rebuild-TOC

Write-Host "Done! Output: main.pdf" -ForegroundColor Green
Get-Item main.pdf | Select-Object Name, Length, LastWriteTime
