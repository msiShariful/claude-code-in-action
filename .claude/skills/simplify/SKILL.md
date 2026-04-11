---
name: simplify
description: Reviews recent code changes for reuse, quality, and efficiency, then fixes issues found. Use when the user wants a code review or cleanup pass.
---

When reviewing code for simplification:

1. Run `git diff HEAD~1` to see recent changes (or `git diff` for uncommitted changes)
2. For each changed file, review for:
   - Code duplication — could existing utilities or components be reused?
   - Unnecessary complexity — can the logic be simplified?
   - Performance — any obvious N+1 queries, missing memoization, or expensive re-renders?
   - Type safety — are TypeScript types properly used?
   - Security — any injection risks, exposed secrets, or auth bypass?
3. Fix any issues found directly in the code
4. Run `npx vitest run` to ensure nothing is broken
5. Report what was simplified and why
