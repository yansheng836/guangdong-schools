export const meta = {
  name: 'batch-school-addresses',
  description: 'Search for middle school addresses in parallel',
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
  return `You are processing ${cityName} middle schools. Follow these steps:

STEP 1: Run this bash command to find all files needing addresses:
cd "F:\\workspace\\plain-project\\guangdong-schools" && find 初中/ -name "*.md" -not -name "README.md" -exec grep -L "学校地址" {} \\; | grep -E "${cityFilter}"

STEP 2: For each file found, do:
a) Read the file to get the school name
b) If you know the address, use Edit to add it immediately
c) If not, use Playwright browser:
   - browser_tabs: create new tab
   - Navigate to Baidu search for "SchoolName 地址 CityName"
   - browser_evaluate to extract address text from page
   - Edit the file to add the address line AFTER "| 所在区域 |" line
   - browser_tabs: close tab
d) Mark result (ok/skipped)

CRITICAL: Edit each file AS SOON AS you find the address. Do NOT batch the edits.`;
}

phase('Find & Fill');
const results = await parallel([
  () => agent(makePrompt('梅州市', '梅州'), { label: '梅州(63)', phase: 'Find & Fill', schema: BATCH_RESULT, model: 'sonnet' }),
  () => agent(makePrompt('佛山市|东莞市|中山市', '佛山/东莞/中山'), { label: '佛莞中(25)', phase: 'Find & Fill', schema: BATCH_RESULT, model: 'sonnet' }),
  () => agent(makePrompt('汕头市|湛江市|茂名市|惠州市', '汕头/湛江/茂名/惠州'), { label: '汕湛茂惠(29)', phase: 'Find & Fill', schema: BATCH_RESULT, model: 'sonnet' }),
  () => agent(makePrompt('肇庆市|韶关市|江门市|阳江市|汕尾市|河源市', '肇庆/韶关/江门/阳江/汕尾/河源'), { label: '其他城市(21)', phase: 'Find & Fill', schema: BATCH_RESULT, model: 'sonnet' }),
]);

return results;