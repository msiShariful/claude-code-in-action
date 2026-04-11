---
name: Lint Check
phase: 1
---

## Steps

1. Run `npm run lint` and capture output
2. Count errors vs warnings
3. Categorize issues by rule (e.g., `no-unused-vars`, `react-hooks/exhaustive-deps`)
4. Report:
   - **✓** if zero errors and zero warnings
   - **⚠** if warnings only
   - **✗** if any errors exist, listing the top 5 most frequent rules
