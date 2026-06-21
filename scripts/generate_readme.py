import os
import re
from collections import defaultdict

base_dir = os.path.join(os.path.dirname(os.path.dirname(os.path.abspath(__file__))), "初中")

# Read all school files
schools = []
for f in os.listdir(base_dir):
    if f.endswith('.md') and f != 'README.md':
        schools.append(f.replace('.md', ''))

# Parse city and district from filename
school_data = []
for s in schools:
    parts = s.split('-', 2)
    if len(parts) == 3:
        city, district, name = parts
        school_data.append((city, district, name, s))

# Group by city, then by district
city_district = defaultdict(lambda: defaultdict(list))
for city, district, name, filename in school_data:
    city_district[city][district].append((name, filename))

# City order
city_order = [
    "广州市", "深圳市", "珠海市", "汕头市", "佛山市", "韶关市",
    "河源市", "梅州市", "惠州市", "汕尾市", "东莞市", "中山市",
    "江门市", "阳江市", "湛江市", "茂名市", "肇庆市", "清远市",
    "潮州市", "揭阳市", "云浮市"
]

# Generate README
lines = []
lines.append("# 广东省初中学校索引\n")
lines.append("本目录收录广东省各地级市的初中学校信息。\n")
lines.append("## 目录\n")
lines.append("| 城市 | 学校数量 |")
lines.append("|------|----------|")

total = 0
for city in city_order:
    if city in city_district:
        count = sum(len(v) for v in city_district[city].values())
        total += count
        lines.append(f"| [{city}](#{city}) | {count} |")

# Handle any cities not in city_order
for city in sorted(city_district.keys()):
    if city not in city_order:
        count = sum(len(v) for v in city_district[city].values())
        total += count
        lines.append(f"| [{city}](#{city}) | {count} |")

lines.append(f"\n**共计：{total}所初中学校**\n")
lines.append("---\n")

# Generate each city section
for city in city_order:
    if city not in city_district:
        continue
    lines.append(f"## {city}\n")
    districts = city_district[city]
    for district in sorted(districts.keys()):
        school_list = sorted(districts[district], key=lambda x: x[0])
        lines.append(f"### {district}\n")
        lines.append("| 序号 | 学校名称 | 链接 |")
        lines.append("|------|----------|------|")
        for idx, (name, filename) in enumerate(school_list, 1):
            lines.append(f"| {idx} | {name} | [{filename}.md](初中/{filename}.md) |")
        lines.append("")

# Handle cities not in city_order
for city in sorted(city_district.keys()):
    if city in city_order:
        continue
    lines.append(f"## {city}\n")
    districts = city_district[city]
    for district in sorted(districts.keys()):
        school_list = sorted(districts[district], key=lambda x: x[0])
        lines.append(f"### {district}\n")
        lines.append("| 序号 | 学校名称 | 链接 |")
        lines.append("|------|----------|------|")
        for idx, (name, filename) in enumerate(school_list, 1):
            lines.append(f"| {idx} | {name} | [{filename}.md](初中/{filename}.md) |")
        lines.append("")

lines.append("## 数据来源\n")
lines.append("本数据为参考整理，待校正。建议查阅各市教育局官网及学校官方网站获取最新信息。\n")
lines.append("---\n")
lines.append("> 最后更新时间：2026-06-21\n")

readme_path = os.path.join(base_dir, 'README.md')
with open(readme_path, 'w', encoding='utf-8') as f:
    f.write('\n'.join(lines))

print(f"README generated with {total} schools")
