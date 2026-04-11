---
name: Type Check
phase: 1
---

## Steps

1. Run `npx tsc --noEmit` and capture output
2. Count type errors
3. Group errors by file and error code (e.g., TS2345, TS7006)
4. Report:
   - **✓** if zero type errors
   - **⚠** if errors exist only in test files or generated files
   - **✗** if errors exist in source files, listing affected files and error counts
