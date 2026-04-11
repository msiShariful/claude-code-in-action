---
name: Test Suite
phase: 2
---

## Steps

1. Run `npx vitest run --reporter=verbose` and capture output
2. Parse results: total, passed, failed, skipped
3. If any tests fail:
   - List failing test names and file paths
   - Read the failing test to identify if the failure is a code bug or stale test
4. Report:
   - **✓** if all tests pass
   - **⚠** if tests pass but some are skipped
   - **✗** if any tests fail, listing failure details
