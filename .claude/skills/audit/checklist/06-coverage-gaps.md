---
name: Test Coverage Gaps
phase: 3
---

## Steps

1. List all source files under `src/` (excluding `src/generated/`, `src/app/**/page.tsx`, `src/app/**/layout.tsx`)
2. List all test files under `src/**/__tests__/`
3. Map test files to their source files by naming convention (e.g., `Foo.test.tsx` tests `Foo.tsx`)
4. Identify source files with logic (not just type definitions or re-exports) that have no corresponding test file
5. Prioritize gaps by file complexity — files with more lines or more exported functions rank higher
6. Report:
   - **✓** if all significant source files have test coverage
   - **⚠** if 1-3 files lack tests
   - **✗** if 4+ files lack tests, listing them ordered by priority
