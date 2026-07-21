# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is a structured Markdown data repository — not a code project. It catalogs all schools in Guangdong Province, China across multiple education levels: 幼儿园 (kindergarten), 小学 (primary), 初中 (middle), 初中-初职 (middle vocational), 高中 (high school), 高中-中职 (vocational/technical school), 大学 (university/undergraduate), 大学-大专 (college/vocational college), 党校 (party school). There is no build system, no tests, and no runtime code.

## Repository Structure

School data files live directly under `<教育阶段>/` as flat files — no city subdirectories. Each education level directory has its own `README.md` serving as an index/navigation page for that level.

Covered regions: all 21 prefecture-level cities in Guangdong (广州市, 深圳市, 珠海市, 汕头市, 佛山市, 韶关市, 河源市, 梅州市, 惠州市, 汕尾市, 东莞市, 中山市, 江门市, 阳江市, 湛江市, 茂名市, 肇庆市, 清远市, 潮州市, 揭阳市, 云浮市).

## File Naming Convention

School files: `{城市}-{区县}-{学校名}.md` — e.g. `广州市-白云区-黄边小学.md`

## Creating a New School Entry

1. Use `TEMPLATE.md` as the starting point
2. Place the file under the correct `<阶段>/<城市>/` directory
3. Only include the relevant section for that school's level (幼儿园适用 / 小学适用 / 初中适用 / 高中适用 / 大学适用) — remove the other level-specific sections
4. Fill all required fields (学校名称, 所在城市, 所在区域, 学校地址, 学校性质, 学校简介)
5. Add the school to the parent directory's `README.md` index
6. Update the progress table in the root `README.md`

## Key Conventions

- All content is in Chinese (Simplified)
- School properties use fixed values: 公办/民办/其他 for 学校性质; 省一级/市一级/区一级 for school ratings
- Each school file must include a 数据来源 section citing where the information came from
- Each school file ends with a 最后更新时间 timestamp
- **文件名和学校名称中统一使用英文括号 `()`，禁止使用中文括号 `（）`。** 例如 `珠海市-北京师范大学(珠海校区).md` 而非 `珠海市-北京师范大学（珠海校区）.md`
- License: CC BY-NC-SA 4.0

## 大学/大专校区信息规范

对于有多个校区/分校的大学或大专院校，必须在"特色亮点"之后添加"校区信息"表格，格式如下：

```markdown
## 校区信息

| 校区名称 | 所在城市 | 地址 | 备注 |
|----------|---------|------|------|
| XX校区 | XX市XX区 | XX路XX号 | 校本部 |
| XX校区 | XX市XX区 | XX路XX号 | 分校区 |
```

- 校区名称：使用学校官方名称（如"广州校区"、"顺德校区"）
- 所在城市：填写"城市+区"（如"广州市白云区"）
- 地址：填写具体街道门牌号
- 备注：标注"校本部"、"新校区"、"分校区"等

## 数据来源参考

高校数据以教育部公布的《全国高等学校名单》为基准：

- 2026年6月17日发布的普通高等学校名单：<http://www.moe.gov.cn/jyb_xxgk/s5743/s5744/202606/t20260618_1441074.html>
- 全国高等学校名单互动查询：<https://hudong.moe.gov.cn/qggxmd/>
- 成人高等学校名单源自同一文件附件

高中数据参考：

- 广东省国家级、广州市示范性普通高中名单：<https://jyj.gz.gov.cn/gk/sjtj/content/post_9644153.html>
- 广州高中查询（本地宝，含地址电话）：<https://m.gz.bendibao.com/edu/gaozhonglist/>
- 广州市普通高中列表（百度百科）：<https://baike.baidu.com/starmap/view?fromModule=starMap_recommend&lemmaId=171913&lemmaTitle=%E5%B9%BF%E5%B7%9E%E5%B8%82%E7%AC%AC%E5%8D%81%E4%B8%83%E4%B8%AD%E5%AD%A6&nodeId=9167c87c221be7c2f5d1c13e&starMapFrom=lemma_starMap>
- 广州市示范性普通高中名单（百度百科）：<https://baike.baidu.com/starmap/view?fromModule=starMap_recommend&lemmaId=171913&lemmaTitle=%E5%B9%BF%E5%B7%9E%E5%B8%82%E7%AC%AC%E5%8D%81%E4%B8%83%E4%B8%AD%E5%AD%A6&nodeId=ca302112675a6541444629af&starMapFrom=lemma_starMap>
- 广东省一级中学（百度百科）：<https://baike.baidu.com/starmap/view?fromModule=starMap_recommend&lemmaId=171913&lemmaTitle=%E5%B9%BF%E5%B7%9E%E5%B8%82%E7%AC%AC%E5%8D%81%E4%B8%83%E4%B8%AD%E5%AD%A6&nodeId=e0a309bf66441a7890c7b89c&starMapFrom=lemma_starMap>

补充学校时应优先参照教育部名单核对学校名称、办学层次、所在地等信息。

## 数据真实性要求

### 1. 学校必须真实存在

- 所有收录的学校必须是在教育部或各地市教育局官方登记注册的学校
- 优先以教育部公布的《全国高等学校名单》、各地市教育局官方公布的学校名录为基准
- 禁止收录未经官方确认的学校、虚构学校或计划中尚未正式设立的学校
- 对于名称有争议的学校，以官方文件中的名称为准

### 2. 数据来源必须为有效超链接

- 每个学校文件中的 `## 数据来源` 部分必须包含真实有效的超链接（格式为 `[链接文字](URL)` 或直接URL）
- 超链接必须满足以下条件：
  - **真实有效**：链接指向的页面必须返回 HTTP 200，不能是死链或404
  - **内容紧密相关**：链接内容必须与该校直接相关（如学校官网、百度百科词条、教育局官方名单等）
  - 禁止放置与学校无关的通用链接、无关的第三方聚合页链接
  - 如果找不到合适的来源链接，**直接置空**该字段，不要放不相关的链接充数
- 推荐的数据来源（按优先级排序）：
  1. 学校官方网站（如 `https://www.example.edu.cn`）
  2. 学校百度百科词条（如 `https://baike.baidu.com/item/学校名称`）
  3. 各地市教育局官方发布的学校名录或招生计划文件
  4. 教育部官方公布的学校名单
