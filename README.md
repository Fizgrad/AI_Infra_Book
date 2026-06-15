# 从基础到深渊：AI Infrastructure 全栈指南

> **注意**：本书内容由 AI（大语言模型）辅助生成，经过人工审阅和调整。书中可能存在错误或不准确之处，欢迎提交 Issue 或 PR 进行修正。

一本系统性地讲解 AI Infrastructure 的入门书，从数学基础、CUDA 编程、深度学习原理，到分布式训练架构、推理优化和集群硬件调度，帮助读者建立从数学公式到硬件成本的完整心智模型。

## 全书结构

| 篇章 | 主题 | 章节 |
|------|------|------|
| 第一篇 | 基石：从数学、CUDA 到深度学习 | 第 1--3 章 |
| 第二篇 | 演进：Transformer 与大语言模型架构 | 第 4--6 章 |
| 第三篇 | 分布式训练架构：从单卡到千卡集群 | 第 7--11 章 |
| 第四篇 | 推理架构优化：让大模型高吞吐、低延迟地服务 | 第 12--16 章 |
| 第五篇 | 集群网络与硬件调度：AI Infra 的物理世界 | 第 17--20 章 |
| 附录 | 符号表、CUDA 环境配置、集群 Checklist、参考文献 | 附录 A--D |

## 目录结构

```
main.tex                          # 主文件
frontmatter/
  preface.tex                     # 前言
  reading_guide.tex               # 阅读路线
chapters/
  part1/                          # 第一篇：基石
    chapter01_math_foundations.tex
    chapter02_cuda_cpp.tex
    chapter03_deep_learning_basics.tex
  part2/                          # 第二篇：演进
    chapter04_transformer.tex
    chapter05_llm_history.tex
    chapter06_gpt_llama_arch.tex
  part3/                          # 第三篇：分布式训练
    chapter07_data_parallelism.tex
    chapter08_tensor_parallelism.tex
    chapter09_pipeline_parallelism.tex
    chapter10_3d_parallelism.tex
    chapter11_zero_deepspeed.tex
  part4/                          # 第四篇：推理优化
    chapter12_kv_cache.tex
    chapter13_paged_attention_vllm.tex
    chapter14_flash_attention.tex
    chapter15_quantization.tex
    chapter16_continuous_batching.tex
  part5/                          # 第五篇：硬件与调度
    chapter17_gpu_architecture.tex
    chapter18_nvlink_nvswitch.tex
    chapter19_rdma_roce.tex
    chapter20_k8s_ai_scheduling.tex
figures/                          # 插图
tikz/                             # TikZ 绘图源文件
appendices/                       # 附录
```

## 编译方法

需要安装 TeX Live 2026 或更新版本。Windows 下推荐直接用提供的脚本：

```powershell
powershell -ExecutionPolicy Bypass -File compile.ps1
```

脚本会自动完成三遍编译并生成带目录的 PDF。

或手动编译：

```bash
xelatex -interaction=nonstopmode main.tex   # 第一遍
xelatex -interaction=nonstopmode main.tex   # 第二遍生成目录
xelatex -interaction=nonstopmode main.tex   # 第三遍稳定页码
```

## 写作进度

- [x] 第一篇：基石（第 1--3 章）
- [x] 第二篇：演进（第 4--6 章）
- [x] 第三篇：分布式训练（第 7--11 章）
- [x] 第四篇：推理优化（第 12--16 章）
- [x] 第五篇：硬件与调度（第 17--20 章）
- [x] 附录

## 许可证

保留所有权利。