# yOHO's Résumé Template

[中文](#中文指南) | [English](#english-guide)

## 中文指南

### 项目简介

本项目是一个模块化的 LaTeX 简历模板，把简历拆成可复用的小模块，方便管理和维护**多个版本**（例如针对不同岗位的简历）。LaTeX 模板参考自 [Tiankui Zhang](https://tiankuizhang.github.io/files/00CV_CN/)。

### 目录结构

```
resume/
├── Makefile
├── common/        # 通用模块：header（个人信息）、education、skills、languages、summary
├── experiences/   # 各段工作 / 项目经历，一个经历一个 .tex
├── versions/      # 每个 .tex 是一份可独立编译的简历版本
├── style/         # resume.cls 文档类与字体符号
└── fonts/         # 字体文件
```

### 编译方式（推荐）

使用 [Tectonic](https://tectonic-typesetting.github.io/) 本地轻量化编译，自动下载缺失宏包，无需安装完整 TeX 发行版。[点击查看安装教程](https://tectonic-typesetting.github.io/en-US/install.html)

在**项目根目录**下运行（文件里用的是相对路径，请勿进入 `versions/` 再编译）：

```bash
tectonic ./versions/base_resume.tex
```

PDF 会生成在该版本 `.tex` 同目录下（如 `versions/base_resume.pdf`）。

#### 自动重新编译

配合 [watchexec](https://github.com/watchexec/watchexec) 可在文件变更时自动重编：

```bash
watchexec -e tex -w common -w experiences -w versions tectonic ./versions/base_resume.tex
```

### 如何修改内容

按模块编辑对应文件即可：

- **个人信息**（姓名、邮箱、电话、GitHub、地点）：`common/header.tex`
- **教育 / 技能 / 语言 / 简介**：`common/` 下对应文件
- **经历与项目正文**：`experiences/` 下对应文件
- **整体样式**（页边距、字体、配色、章节标题等）：`style/resume.cls`

### 版本管理（多份简历）

`versions/` 下每个 `.tex` 就是一份独立简历。版本文件本身不写正文，只用 `\resumeInput{相对路径}` **挑选并组合模块**——按需增删、调整顺序，或用 `%` 注释掉暂时不要的模块：

```latex
\resumeInput{common/header.tex}

\section{Experience \& Projects}
\resumeInput{experiences/project_a.tex}
\resumeInput{experiences/project_b.tex}
% \resumeInput{experiences/project_c.tex}   % 这版暂不包含

\resumeInput{common/skills_base.tex}
```

> `\resumeInput{path}` 中的路径相对于**项目根目录**（即 `common/...`、`experiences/...`）。

**新建一份版本**：复制 `versions/base_resume.tex` 并改名，例如 `versions/frontend_resume.tex`，再调整里面的 `\resumeInput` 组合即可。编译：`tectonic ./versions/frontend_resume.tex`。

### 新增一段经历 / 项目

1. 在 `experiences/` 下新建文件，例如 `experiences/my_project.tex`。
2. 在需要它的版本文件里加一行：`\resumeInput{experiences/my_project.tex}`。

### 重命名文件

模板自带的文件名（如 `project_a.tex`、`skills_base.tex`）只是占位，建议改成对你有意义的名字：

1. 重命名文件，例如 `experiences/project_a.tex` → `experiences/data_platform.tex`。
2. 在**所有引用它的版本文件**里，把对应的 `\resumeInput{experiences/project_a.tex}` 改成新路径 `\resumeInput{experiences/data_platform.tex}`。

`common/` 下的文件同理（重命名后记得同步更新引用路径）。

---

## English Guide

### Introduction

A modular LaTeX résumé template that splits a résumé into small, reusable modules, making it easy to maintain **multiple versions** (e.g. tailored to different roles). LaTeX template inspired by [Tiankui Zhang](https://tiankuizhang.github.io/files/00CV_CN/).

### Directory Structure

```
resume/
├── Makefile
├── common/        # shared modules: header (contact), education, skills, languages, summary
├── experiences/   # work / project experiences, one .tex per item
├── versions/      # each .tex is a self-contained, compilable résumé version
├── style/         # the resume.cls document class and font symbols
└── fonts/         # font files
```

### Compilation (Recommended)

Use [Tectonic](https://tectonic-typesetting.github.io/) for lightweight local compilation — it auto-downloads missing packages, no full TeX distribution required. [Install guide](https://tectonic-typesetting.github.io/en-US/install.html)

Run from the **project root** (the files use relative paths, so don't `cd` into `versions/` first):

```bash
tectonic ./versions/base_resume.tex
```

The PDF is written next to the version's `.tex` (e.g. `versions/base_resume.pdf`).

#### Auto-rebuild on file changes

Use [watchexec](https://github.com/watchexec/watchexec) to recompile automatically when files change:

```bash
watchexec -e tex -w common -w experiences -w versions tectonic ./versions/base_resume.tex
```

### How to Edit Content

Edit the relevant module file:

- **Contact info** (name, email, phone, GitHub, location): `common/header.tex`
- **Education / skills / languages / summary**: the matching file under `common/`
- **Experience & project body text**: the matching file under `experiences/`
- **Overall styling** (margins, fonts, colors, section headings): `style/resume.cls`

### Version Management (Multiple Résumés)

Each `.tex` under `versions/` is a standalone résumé. A version file holds no body text — it only uses `\resumeInput{path}` to **select and compose modules**. Add, remove, reorder, or comment out (`%`) modules as needed:

```latex
\resumeInput{common/header.tex}

\section{Experience \& Projects}
\resumeInput{experiences/project_a.tex}
\resumeInput{experiences/project_b.tex}
% \resumeInput{experiences/project_c.tex}   % excluded from this version

\resumeInput{common/skills_base.tex}
```

> The path in `\resumeInput{path}` is relative to the **project root** (i.e. `common/...`, `experiences/...`).

**Create a new version**: copy `versions/base_resume.tex`, rename it (e.g. `versions/frontend_resume.tex`), and adjust the `\resumeInput` list. Compile with `tectonic ./versions/frontend_resume.tex`.

### Adding an Experience / Project

1. Create a file under `experiences/`, e.g. `experiences/my_project.tex`.
2. Add one line to each version that should include it: `\resumeInput{experiences/my_project.tex}`.

### Renaming Files

The default file names (e.g. `project_a.tex`, `skills_base.tex`) are just placeholders — rename them to something meaningful:

1. Rename the file, e.g. `experiences/project_a.tex` → `experiences/data_platform.tex`.
2. In **every version file that references it**, update the matching `\resumeInput{experiences/project_a.tex}` to the new path `\resumeInput{experiences/data_platform.tex}`.

Files under `common/` work the same way — update the references after renaming.

---

### License

The MIT License (MIT). Copyrighted fonts are not subjected to this License.
