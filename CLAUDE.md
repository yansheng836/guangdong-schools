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

补充学校时应优先参照教育部名单核对学校名称、办学层次、所在地等信息。
