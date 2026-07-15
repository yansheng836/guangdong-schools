# 广东高中与中职数据审计实施计划

> **For agentic workers:** REQUIRED SUB-SKILL: Use
> superpowers:executing-plans to implement this plan task-by-task. Steps use
> checkbox (`- [ ]`) syntax for tracking.

**Goal:** 按 `CLAUDE.md` 和广东省、各地市教育主管部门公开资料，检查并修正高中与中职目录的遗漏、错误和结构问题。

**Architecture:** 普通高中按各市招生及示范性高中名单核验，中职按具备招生资质的学校名单核验。先修复现有档案的确定性错误，再补录能由官方名单确认的遗漏学校；学校文件、阶段索引和根目录统计保持一致。

**Tech Stack:** Markdown、PowerShell、Python 3.12、markdownlint-cli

## Global Constraints

- 文件名使用 `{城市}-{区县}-{学校名}.md`。
- 学校性质只使用 `公办`、`民办`、`其他`。
- 必填学校名称、城市、区域、地址、性质、简介、数据来源和更新时间。
- 地址或办学状态无法从可靠来源确认时，不编造信息。

---

### Task 1: 核验官方收录口径

- [ ] **Step 1: 核对广州普通高中官方名单与现有 72 所记录**
- [ ] **Step 2: 查找省、市中职招生资质名单并与现有 73 所记录比对**
- [ ] **Step 3: 记录可确认的遗漏、停办、更名和合并学校**

### Task 2: 修正现有档案

- [ ] **Step 1: 修复中职文件名中的区县段**
- [ ] **Step 2: 补齐高中和中职的必填地址、区域、性质字段**
- [ ] **Step 3: 删除占位值并更新数据来源与时间**

### Task 3: 补录官方确认的遗漏学校

- [ ] **Step 1: 为确认遗漏的高中建立档案**
- [ ] **Step 2: 为确认遗漏的中职建立档案**
- [ ] **Step 3: 检查新增文件名称、层次和城市区县**

### Task 4: 重建索引与验证

- [ ] **Step 1: 重建高中和中职索引及城市统计**
- [ ] **Step 2: 更新根 README 计数和更新记录**
- [ ] **Step 3: 验证必填字段、文件名、链接和统计一致性**
- [ ] **Step 4: 运行 Markdown 校验和 `git diff --check`**
