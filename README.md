# yOHO's Résumé Template

[中文](#中文指南) | [English](#english-guide)

## 中文指南

### 项目简介

本项目是个人简历的 LaTeX 源码仓库，采用模块化结构组织，方便管理和定制不同版本的简历。LaTeX 模板参考自 [Tiankui Zhang](https://tiankuizhang.github.io/files/00CV_CN/)

### 目录结构

```
resume/
├── resume.tex
├── Makefile
├── common/
├── experiences/
├── versions/
├── style/
└── fonts/
```

### 编译方式（推荐）

使用 [Tectonic](https://tectonic-typesetting.github.io/) 本地轻量化编译，自动下载缺失宏包，无需安装完整 TeX 发行版。

[点击查看安装教程](https://tectonic-typesetting.github.io/en-US/install.html)

```bash
# 编译主入口 resume.tex
tectonic --outdir dist resume.tex

# 或编译 versions 目录下的版本
tectonic --outdir dist versions/base_resume.tex
tectonic --outdir dist versions/Lunaris_resume.tex
```

### 如何定制简历

本项目采用高度模块化的设计：

1. **版本控制**：在 `versions/` 目录下自定义不同版本
2. **修改个人信息**：编辑 `common/header.tex`
3. **调整模块组合**：在版本 tex 文件中通过 `\input{}` 控制包含哪些模块
4. **添加经历**：在 `experiences/` 目录下新建 `.tex` 文件
5. **修改样式**：编辑 `style/resume.cls`



## English Guide

### Introduction

This repository contains the LaTeX source code for a personal résumé, organized in a modular structure for easy management and customization. LaTeX template inspired by [Tiankui Zhang](https://tiankuizhang.github.io/files/00CV_CN/)

### Directory Structure

```
resume/
├── resume.tex
├── Makefile
├── common/
├── experiences/
├── versions/
├── style/
└── fonts/
```

### Compilation (Recommended)

Use [Tectonic](https://tectonic-typesetting.github.io/) for lightweight local compilation — it automatically downloads missing packages, no full TeX distribution required.

[Click to install](https://tectonic-typesetting.github.io/en-US/install.html)

```bash
# Compile the main entry point
tectonic --outdir dist resume.tex

# Or compile specific versions
tectonic --outdir dist versions/base_resume.tex
tectonic --outdir dist versions/Lunaris_resume.tex
```

### How to Customize the Résumé

The project follows a highly modular design:

1. **Version control**: Customize different versions under `versions/`
2. **Personal info**: Edit `common/header.tex`
3. **Module composition**: Use `\input{}` in version `.tex` files to control which modules are included
4. **Add experiences**: Create new `.tex` files under `experiences/`
5. **Modify styles**: Edit `style/resume.cls`

------

### License

The MIT License (MIT). Copyrighted fonts are not subjected to this License.
