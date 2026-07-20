# 广东高校数据审计实施计划

> **For agentic workers:** REQUIRED SUB-SKILL: Use
> superpowers:executing-plans to implement this plan task-by-task. Steps use
> checkbox (`- [ ]`) syntax for tracking.

**Goal:** 依据教育部截至 2026 年 6 月 17 日的全国高等学校名单，补齐并修正广东省本科、专科和成人高校数据。

**Architecture:** 以教育部 XLS 名单作为独立院校基准，保留仓库中确有其事但教育部不单列的异地校区，并明确区分校区与独立学校。学校文件、阶段索引和根目录统计同步更新，以集合比对和链接检查验证一致性。

**Tech Stack:** Markdown、PowerShell、Python 3.12、xlrd、markdownlint-cli

## Global Constraints

- 遵守根目录 `CLAUDE.md` 的文件命名、字段、数据来源和更新时间要求。
- 普通高校与成人高校名称、办学层次和所在地以教育部 2026 年名单为基准。
- 多校区院校在“特色亮点”后提供“校区信息”表格。
- 所有新增和修改内容使用简体中文。

---

### Task 1: 修正现有错误与过时记录

**Files:**

- Rename: `大学/中山市-电子科技大学（中山学院）.md`
- Rename: `大学/珠海市-北京师范大学-香港浸会大学联合国际学院.md`
- Rename: `大学-大专/云浮市-广东云安中医药职业学院.md`
- Delete: 已升本、已更名或不在官方名单中的过时学校文件

- [ ] **Step 1: 按教育部名称修正文件名和正文名称**
- [ ] **Step 2: 删除五所已升本专科、已更名艺术院校和错误职业本科条目**
- [ ] **Step 3: 检查所有保留文件的城市、性质、层次和来源字段**

### Task 2: 补齐官方名单缺失学校

**Files:**

- Create: `大学/珠海市-北京师范大学珠海分校.md`
- Create: `大学/江门市-广东江门南粤学院.md`
- Create: `大学/佛山市-顺德职业技术大学.md`
- Create: `大学/深圳市-深圳信息职业技术大学.md`
- Create: `大学/东莞市-大湾区大学.md`
- Create: `大学-大专/广州市-广东青年职业学院.md`
- Create: `大学-大专/潮州市-广东潮州卫生健康职业学院.md`
- Create: `大学-大专/珠海市-珠海格力职业学院.md`

- [ ] **Step 1: 按模板建立五所本科院校档案**
- [ ] **Step 2: 按模板建立三所专科院校档案**
- [ ] **Step 3: 为新增记录填写官方数据来源和 2026-07-15 更新时间**

### Task 3: 重建索引与统计

**Files:**

- Modify: `大学/README.md`
- Modify: `大学-大专/README.md`
- Verify: `大学-成人高校/README.md`
- Modify: `README.md`

- [ ] **Step 1: 按城市和学校名称重建本科索引及统计**
- [ ] **Step 2: 按城市和学校名称重建专科索引及统计**
- [ ] **Step 3: 保持成人高校 14 所索引不变并更新根目录计数和日志**

### Task 4: 完整性验证

**Files:**

- Test: 三个目标目录中的全部 Markdown 文件

- [ ] **Step 1: 运行教育部名单集合比对，预期本科和专科无遗漏**
- [ ] **Step 2: 检查文件名、标题、必填字段、数据来源和更新时间**
- [ ] **Step 3: 检查 README 链接目标与目录文件集合完全一致**
- [ ] **Step 4: 运行 `npx markdownlint-cli`，预期本次变更文件无错误**
- [ ] **Step 5: 检查 `git diff --check` 和最终差异**
