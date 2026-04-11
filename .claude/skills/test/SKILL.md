---
name: test
description: Runs the Vitest test suite, analyzes failures, and fixes broken code. Use when the user wants to run tests or check for regressions.
---

When running tests:

1. Run `npx vitest run` to execute all tests
2. If any tests fail, read the failing test file and the source file it tests
3. Diagnose the root cause of failures
4. Fix the failing code (not the tests, unless the tests themselves are wrong)
5. Re-run the failing tests to confirm the fix: `npx vitest run <path-to-test-file>`
6. Report a summary of results to the user
