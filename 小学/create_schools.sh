#!/bin/bash
# 批量创建广东省（除广州外）20个城市代表性小学文件

BASE_DIR="G:/Workspaces/plain-project/guangdong-schools/小学"

create_school_file() {
    local city="$1"
    local district="$2"
    local school="$3"
    local filename="${city}-${district}-${school}.md"

    cat > "${BASE_DIR}/${filename}" << 'TEMPLATE_EOF'
# SCHOOL_NAME_PLACEHOLDER

## 基本信息

| 项目 | 内容 |
|------|------|
| 学校名称 | SCHOOL_NAME_PLACEHOLDER |
| 所在城市 | CITY_PLACEHOLDER |
| 所在区域 | DISTRICT_PLACEHOLDER |
| 学校性质 | 公办 |
| 学校等级 | （待补充） |
| 官网 | （待补充） |

## 学校简介

（待补充，100-300字简介）

## 特色亮点

（待补充）

## 录取信息

### 小学适用

| 项目 | 内容 |
|------|------|
| 学校等级 | （待补充） |
| 对口中学 | （待补充） |
| 划片范围 | （待补充） |
| 学位预警 | （待补充） |
| 办学规模 | （待补充） |

## 数据来源

参考整理，待校正。建议查阅各市教育局官网及学校官方网站获取最新信息。

---

> 最后更新时间：2026-06-20
TEMPLATE_EOF

    # 替换占位符
    sed -i "s/SCHOOL_NAME_PLACEHOLDER/${school}/g" "${BASE_DIR}/${filename}"
    sed -i "s/CITY_PLACEHOLDER/${city}/g" "${BASE_DIR}/${filename}"
    sed -i "s/DISTRICT_PLACEHOLDER/${district}/g" "${BASE_DIR}/${filename}"

    echo "Created: ${filename}"
}

# ===== 深圳市（10所）=====
create_school_file "深圳市" "福田区" "荔园小学"
create_school_file "深圳市" "福田区" "园岭小学"
create_school_file "深圳市" "福田区" "福田小学"
create_school_file "深圳市" "福田区" "百花小学"
create_school_file "深圳市" "南山区" "南头小学"
create_school_file "深圳市" "南山区" "蛇口小学"
create_school_file "深圳市" "罗湖区" "深圳小学"
create_school_file "深圳市" "罗湖区" "翠竹小学"
create_school_file "深圳市" "宝安区" "宝安小学"
create_school_file "深圳市" "龙岗区" "龙岗小学"

# ===== 珠海市（5所）=====
create_school_file "珠海市" "香洲区" "香洲区第一小学"
create_school_file "珠海市" "香洲区" "香洲区第二小学"
create_school_file "珠海市" "香洲区" "拱北小学"
create_school_file "珠海市" "斗门区" "斗门区实验小学"
create_school_file "珠海市" "金湾区" "金湾区第一小学"

# ===== 汕头市（5所）=====
create_school_file "汕头市" "金平区" "外马路第二小学"
create_school_file "汕头市" "金平区" "金珠小学"
create_school_file "汕头市" "龙湖区" "龙湖小学"
create_school_file "汕头市" "龙湖区" "金阳小学"
create_school_file "汕头市" "濠江区" "濠江小学"

# ===== 佛山市（8所）=====
create_school_file "佛山市" "禅城区" "佛山市第九小学"
create_school_file "佛山市" "禅城区" "同济小学"
create_school_file "佛山市" "南海区" "南海实验小学"
create_school_file "佛山市" "南海区" "桂城小学"
create_school_file "佛山市" "顺德区" "顺德区本原小学"
create_school_file "佛山市" "顺德区" "大良实验小学"
create_school_file "佛山市" "三水区" "三水区实验小学"
create_school_file "佛山市" "高明区" "高明区沧江中学附属小学"

# ===== 韶关市（3所）=====
create_school_file "韶关市" "浈江区" "和平路小学"
create_school_file "韶关市" "武江区" "武江区金福园小学"
create_school_file "韶关市" "曲江区" "曲江区实验小学"

# ===== 河源市（3所）=====
create_school_file "河源市" "源城区" "河源市第一小学"
create_school_file "河源市" "源城区" "河源市第二小学"
create_school_file "河源市" "源城区" "河源市第三小学"

# ===== 梅州市（3所）=====
create_school_file "梅州市" "梅江区" "梅江区实验小学"
create_school_file "梅州市" "梅江区" "梅州师范附属小学"
create_school_file "梅州市" "梅江区" "梅江区鸿都小学"

# ===== 惠州市（5所）=====
create_school_file "惠州市" "惠城区" "惠州市下埔小学"
create_school_file "惠州市" "惠城区" "惠州市南坛小学"
create_school_file "惠州市" "惠城区" "惠州市东平小学"
create_school_file "惠州市" "惠阳区" "惠阳区实验小学"
create_school_file "惠州市" "惠阳区" "惠阳区淡水中心小学"

# ===== 汕尾市（2所）=====
create_school_file "汕尾市" "城区" "汕尾市小学"
create_school_file "汕尾市" "城区" "汕尾市城区凤山小学"

# ===== 东莞市（5所）=====
create_school_file "东莞市" "东莞市" "东莞师范学校附属小学"
create_school_file "东莞市" "东莞市" "莞城中心小学"
create_school_file "东莞市" "东莞市" "东城小学"
create_school_file "东莞市" "东莞市" "南城阳光中心小学"
create_school_file "东莞市" "东莞市" "东莞外国语学校小学部"

# ===== 中山市（5所）=====
create_school_file "中山市" "中山市" "中山市实验小学"
create_school_file "中山市" "中山市" "石岐中心小学"
create_school_file "中山市" "中山市" "杨仙逸小学"
create_school_file "中山市" "中山市" "中山市小榄镇中心小学"
create_school_file "中山市" "中山市" "中山市东区朗晴小学"

# ===== 江门市（3所）=====
create_school_file "江门市" "蓬江区" "范罗冈小学"
create_school_file "江门市" "蓬江区" "紫茶小学"
create_school_file "江门市" "新会区" "新会实验小学"

# ===== 阳江市（2所）=====
create_school_file "阳江市" "江城区" "阳江市实验小学"
create_school_file "阳江市" "江城区" "阳江市江城第一小学"

# ===== 湛江市（5所）=====
create_school_file "湛江市" "赤坎区" "湛江市第八小学"
create_school_file "湛江市" "霞山区" "湛江市第十二小学"
create_school_file "湛江市" "赤坎区" "湛江市第一小学"
create_school_file "湛江市" "霞山区" "湛江市第四小学"
create_school_file "湛江市" "廉江市" "廉江市第一小学"

# ===== 茂名市（3所）=====
create_school_file "茂名市" "茂南区" "茂名市第十一小学"
create_school_file "茂名市" "茂南区" "茂名市第一小学"
create_school_file "茂名市" "高州市" "高州市第一小学"

# ===== 肇庆市（3所）=====
create_school_file "肇庆市" "端州区" "肇庆市实验小学"
create_school_file "肇庆市" "端州区" "肇庆市第十五小学"
create_school_file "肇庆市" "端州区" "肇庆市第一小学"

# ===== 清远市（2所）=====
create_school_file "清远市" "清城区" "清远市新北江小学"
create_school_file "清远市" "清城区" "清远市清城区凤翔小学"

# ===== 潮州市（2所）=====
create_school_file "潮州市" "湘桥区" "潮州市实验小学"
create_school_file "潮州市" "湘桥区" "潮州市湘桥区城南小学"

# ===== 揭阳市（2所）=====
create_school_file "揭阳市" "榕城区" "揭阳市实验小学"
create_school_file "揭阳市" "榕城区" "揭阳市榕城区红旗小学"

# ===== 云浮市（2所）=====
create_school_file "云浮市" "云城区" "云浮市第一小学"
create_school_file "云浮市" "云城区" "云浮市云城区邓发小学"

echo ""
echo "=========================================="
echo "所有文件创建完成！"
echo "=========================================="
