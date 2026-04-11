---
name: audit
description: "Performs a comprehensive codebase maintenance audit — checks lint, tests, type safety, dependency health, dead code, and missing test coverage. Use when the user wants a health check or maintenance pass."
---

Perform a full codebase maintenance audit by running each checklist file in order. Report findings as a categorized summary with actionable items.

## Audit Checklist

Run these checks sequentially. For each section, report: ✓ passing, ⚠ warning, ✗ failing.

### Phase 1 — Static Analysis (run in parallel)
Follow the steps in:
- `checklist/01-lint.md` — ESLint and formatting
- `checklist/02-types.md` — TypeScript type checking
- `checklist/03-deps.md` — Dependency health

### Phase 2 — Tests
Follow the steps in:
- `checklist/04-tests.md` — Test suite and coverage

### Phase 3 — Code Quality
Follow the steps in:
- `checklist/05-dead-code.md` — Unused exports and dead code
- `checklist/06-coverage-gaps.md` — Files missing test coverage

### Output Format

```
## Audit Report

### Static Analysis
- Lint: ✓/⚠/✗ — summary
- Types: ✓/⚠/✗ — summary
- Dependencies: ✓/⚠/✗ — summary

### Tests
- Suite: ✓/⚠/✗ — X passed, Y failed, Z skipped
- Coverage gaps: list of untested files

### Code Quality
- Dead code: list of unused exports
- Missing tests: list of source files without corresponding test files

### Recommended Actions
1. (highest priority first)
```
