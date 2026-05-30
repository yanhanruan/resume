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
# 编译 versions 目录下的版本
tectonic ./versions/base_resume.tex
tectonic ./versions/xxx_resume.tex
```

#### 自动重新编译

配合 [watchexec](https://github.com/watchexec/watchexec) 可实现文件变更时自动重新编译：

```bash
watchexec -e tex -w common -w experiences -w versions tectonic ./versions/base_resume.tex
```

### 如何定制简历

本项目采用高度模块化的设计：

1. **版本控制**：在 `versions/` 目录下自定义不同版本
2. **修改个人信息**：编辑 `common/header.tex`
3. **调整模块组合**：在版本 tex 文件中通过 `\resumeInput{}` 控制包含哪些模块
4. **添加经历**：在 `experiences/` 目录下新建 `.tex` 文件
5. **修改样式**：编辑 `style/resume.cls`

### 用真实内容覆盖模板（隐私保护）

仓库里 `common/`、`experiences/` 下提交的都是**通用占位模板**，可直接编译出一份示例简历。你的**真实简历内容放在 `private/` 目录**，该目录已被 `.gitignore` 忽略，永远不会提交到 git。

编译时，`style/resume.cls` 中的 `\resumeInput{path}` 会**优先读取 `private/path`，找不到才回退到提交的模板**。例如：

```
private/
├── common/
│   ├── header.tex          # 覆盖 common/header.tex
│   └── education.tex
└── experiences/
    └── your_project.tex
```

- 把你想覆盖的文件，按相同相对路径放进 `private/` 即可自动生效，无需改动版本 tex 文件。
- 编译出的 PDF（`*.pdf`、`dist/`）也已被忽略，不会泄露个人信息。
- 别人 clone 本仓库时没有 `private/`，会直接编译出占位模板；你本地有 `private/` 则自动使用真实内容。



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
# compile specific versions
tectonic ./versions/base_resume.tex
tectonic ./versions/xxx_resume.tex
```

#### Auto-rebuild on file changes

Use [watchexec](https://github.com/watchexec/watchexec) to automatically recompile when files change:

```bash
watchexec -e tex -w common -w experiences -w versions tectonic ./versions/base_resume.tex
```

### How to Customize the Résumé

The project follows a highly modular design:

1. **Version control**: Customize different versions under `versions/`
2. **Personal info**: Edit `common/header.tex`
3. **Module composition**: Use `\resumeInput{}` in version `.tex` files to control which modules are included
4. **Add experiences**: Create new `.tex` files under `experiences/`
5. **Modify styles**: Edit `style/resume.cls`

### Overriding the Template with Real Content (Privacy)

The `common/` and `experiences/` files committed to this repo are **generic placeholder templates** that compile into a sample résumé out of the box. Put your **real content in the `private/` directory**, which is listed in `.gitignore` and is never committed.

At compile time, `\resumeInput{path}` (defined in `style/resume.cls`) **prefers `private/path` and falls back to the committed template** when it is absent. For example:

```
private/
├── common/
│   ├── header.tex          # overrides common/header.tex
│   └── education.tex
└── experiences/
    └── your_project.tex
```

- Drop a file into `private/` under the same relative path to override it automatically — no need to touch the version `.tex` files.
- Compiled PDFs (`*.pdf`, `dist/`) are ignored too, so they cannot leak personal data.
- Anyone cloning the repo has no `private/` and compiles the placeholder template; your local `private/` makes your build use the real content.

------

### License

The MIT License (MIT). Copyrighted fonts are not subjected to this License.
