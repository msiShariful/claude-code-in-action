---
name: Dead Code Detection
phase: 3
---

## Steps

1. Search for exported functions/components across `src/` using grep for `export (const|function|class|default)`
2. For each export, check if it is imported anywhere else in the codebase
3. Exclude from analysis:
   - Page components (`page.tsx`, `layout.tsx`) — used by Next.js routing
   - API route handlers (`route.ts`) — used by Next.js routing
   - `src/generated/` — auto-generated code
   - Components used in `middleware.ts`
4. Report:
   - **✓** if no dead exports found
   - **⚠** if 1-3 potentially unused exports found (may be false positives)
   - **✗** if 4+ unused exports found, listing each with file path and export name
