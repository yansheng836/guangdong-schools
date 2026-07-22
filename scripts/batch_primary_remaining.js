export const meta = {
  name: 'remaining-primary-schools',
  description: 'Search for remaining primary school addresses',
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

function makePrompt(cityFilter) {
  return `You are processing PRIMARY schools. Follow these steps:

STEP 1: Find files needing addresses:
cd "F:\\workspace\\plain-project\\guangdong-schools" && find 小学/ -name "*.md" -not -name "README.md" -exec grep -L "学校地址" {} \\; | grep -E "${cityFilter}"

STEP 2: Process each file:
a) Read file to get school name
b) If you know address, Edit it immediately
c) If not, use Playwright browser_tabs new tab, search Baidu, extract address, Edit file, close tab
d) Mark result

CRITICAL: Edit EACH file AS SOON AS you find the address.`;
}

phase('Find & Fill');
const results = await parallel([
  () => agent(makePrompt('韶关市|河源市'), { label: '韶关+河源(143)', phase: 'Find & Fill', schema: BATCH_RESULT, model: 'sonnet' }),
  () => agent(makePrompt('汕头市'), { label: '汕头(1)', phase: 'Find & Fill', schema: BATCH_RESULT, model: 'sonnet' }),
]);

return results;