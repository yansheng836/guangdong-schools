export const meta = {
  name: 'primary-school-addresses',
  description: 'Search for primary school addresses in parallel',
  phases: [{ title: 'Find & Fill' }],
};

const BATCH_RESULT = {
  type: 'object',
  properties: {
    batchName: { type: 'string' },
    total: { type: 'number' },
    succeeded: { type: 'number' },
    failed: { type: 'number' },
    results: { type: 'array', items: { type: 'object', properties: { school: { type: 'string' }, address: { type: 'string' }, status: { type: 'string' } }, required: ['school', 'status'] } },
  },
  required: ['batchName', 'total', 'succeeded', 'failed'],
};

function makePrompt(cityFilter, cityName) {
  return `You are processing PRIMARY schools in ${cityName}. Follow these steps:

STEP 1: Run this bash command to find all files needing addresses:
cd "F:\\workspace\\plain-project\\guangdong-schools" && find 小学/ -name "*.md" -not -name "README.md" -exec grep -L "学校地址" {} \\; | grep -E "${cityFilter}"

STEP 2: For each file found, do:
a) Read the file to get the school name
b) If you know the address, use Edit to add it immediately
c) If not, use Playwright browser:
   - browser_tabs: create new tab
   - Navigate to Baidu search for "SchoolName 地址 CityName"
   - browser_evaluate to extract address text from page
   - Edit the file to add "| 学校地址 | 广东省XX市... |" AFTER "| 所在区域 |" line
   - browser_tabs: close tab
d) Mark result (ok/skipped)

CRITICAL: Edit each file AS SOON AS you find the address. Do NOT batch the edits.
The address format should be: | 学校地址 | 广东省XX市XX区/镇... |
Insert it right after the | 所在区域 | line.`;
}

phase('Find & Fill');
const results = await parallel([
  () => agent(makePrompt('梅州市', '梅州'), { label: '梅州(139)', phase: 'Find & Fill', schema: BATCH_RESULT, model: 'sonnet' }),
  () => agent(makePrompt('湛江市|茂名市', '湛江/茂名'), { label: '湛江+茂名(167)', phase: 'Find & Fill', schema: BATCH_RESULT, model: 'sonnet' }),
  () => agent(makePrompt('韶关市|河源市', '韶关/河源'), { label: '韶关+河源(144)', phase: 'Find & Fill', schema: BATCH_RESULT, model: 'sonnet' }),
  () => agent(makePrompt('阳江市|深圳市|广州市', '阳江/深圳/广州'), { label: '阳江+深圳+广州(78)', phase: 'Find & Fill', schema: BATCH_RESULT, model: 'sonnet' }),
  () => agent(makePrompt('佛山市|东莞市|中山市|珠海市|汕头市|惠州市', '佛山/东莞/中山/珠海/汕头/惠州'), { label: '佛莞中珠汕惠(53)', phase: 'Find & Fill', schema: BATCH_RESULT, model: 'sonnet' }),
  () => agent(makePrompt('肇庆市|江门市|云浮市|汕尾市|清远市|揭阳市|潮州市', '肇庆/江门/云浮/汕尾/清远/揭阳/潮州'), { label: '其他城市(23)', phase: 'Find & Fill', schema: BATCH_RESULT, model: 'sonnet' }),
]);

return results;