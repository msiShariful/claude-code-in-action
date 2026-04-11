---
name: preview-debug
description: Debugs preview iframe rendering issues by tracing the transpilation pipeline. Use when the user reports that component previews are broken or not rendering.
---

When debugging preview issues:

1. Read `src/lib/transform/jsx-transformer.ts` to understand the current transpilation pipeline
2. Read `src/components/preview/PreviewFrame.tsx` to understand how the iframe is constructed
3. Check the entry point resolution order: `/App.jsx`, `/App.tsx`, `/index.jsx`, `/index.tsx`, `/src/App.jsx`, `/src/App.tsx`, then first `.jsx`/`.tsx` found
4. Common issues to check:
   - Babel transpilation errors in `createImportMap`
   - Missing or incorrect import map entries (third-party packages should resolve to `https://esm.sh/<package>`)
   - Blob URL creation/cleanup issues
   - Tailwind CDN loading in the iframe HTML
   - Error boundary catching silent failures
5. If the user describes a specific issue, trace the data flow from VirtualFileSystem → transpilation → import map → iframe injection
6. Run relevant tests: `npx vitest run src/lib/transform/__tests__/jsx-transformer.test.ts`
