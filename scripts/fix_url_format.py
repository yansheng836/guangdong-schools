import os
import re

def fix_url_format(content):
    """Fix URL format where text is inside angle brackets"""
    # Pattern 1: <https://xxx，text> -> <https://xxx>，text
    pattern1 = r'<(https?://[^，]+)，([^>]+)>'
    replacement1 = r'<\1>，\2'
    content = re.sub(pattern1, replacement1, content)

    # Pattern 2: <https://xxx，text -> <https://xxx>，text (missing closing bracket)
    pattern2 = r'<(https?://[^，]+)，([^\n]+)'
    replacement2 = r'<\1>，\2'
    content = re.sub(pattern2, replacement2, content)

    return content

def fix_file(filepath):
    """Fix URL format in a file"""
    with open(filepath, 'r', encoding='utf-8') as f:
        content = f.read()

    original = content
    content = fix_url_format(content)

    if content != original:
        with open(filepath, 'w', encoding='utf-8') as f:
            f.write(content)
        return True
    return False

def main():
    base_dir = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
    fixed_count = 0

    for root, dirs, files in os.walk(base_dir):
        if 'node_modules' in root or '.git' in root:
            continue

        for file in files:
            if file.endswith('.md'):
                filepath = os.path.join(root, file)
                if fix_file(filepath):
                    fixed_count += 1
                    print(f"Fixed: {os.path.relpath(filepath, base_dir)}")

    print(f"\nTotal files fixed: {fixed_count}")

if __name__ == '__main__':
    main()
