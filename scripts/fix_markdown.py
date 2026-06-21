import os
import re

def fix_bare_urls(content):
    """Fix bare URLs by wrapping them in angle brackets"""
    # Match URLs that are not already wrapped in angle brackets or markdown links
    url_pattern = r'(?<!\()(?<!<)(https?://[^\s\)\]>]+)(?!\))'
    return re.sub(url_pattern, r'<\1>', content)

def fix_multiple_blank_lines(content):
    """Replace multiple blank lines with a single blank line"""
    return re.sub(r'\n{3,}', '\n\n', content)

def fix_file(filepath):
    """Fix markdown issues in a file"""
    with open(filepath, 'r', encoding='utf-8') as f:
        content = f.read()

    original = content
    content = fix_bare_urls(content)
    content = fix_multiple_blank_lines(content)

    if content != original:
        with open(filepath, 'w', encoding='utf-8') as f:
            f.write(content)
        return True
    return False

def main():
    base_dir = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
    fixed_count = 0

    for root, dirs, files in os.walk(base_dir):
        # Skip node_modules and .git
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
