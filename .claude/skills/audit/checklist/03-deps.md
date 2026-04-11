---
name: Dependency Health
phase: 1
---

## Steps

1. Run `npm audit` and capture output — note severity counts (low/moderate/high/critical)
2. Run `npx depcheck --ignores="@types/*,prisma,tailwindcss,postcss"` to find unused dependencies
3. Check `package.json` for pinned vs range versions
4. Report:
   - **✓** if no high/critical vulnerabilities and no unused deps
   - **⚠** if only low/moderate vulnerabilities or minor unused deps
   - **✗** if high/critical vulnerabilities or many unused deps, listing specifics
