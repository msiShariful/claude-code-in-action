---
name: add-component
description: Scaffolds a new React component following project conventions. Use when the user wants to create a new UI component.
---

When adding a new component:

1. Determine the component category based on its purpose:
   - UI primitives → `src/components/ui/`
   - Auth related → `src/components/auth/`
   - Chat related → `src/components/chat/`
   - Editor related → `src/components/editor/`
   - Preview related → `src/components/preview/`
2. Check existing components in that directory for patterns and conventions
3. Create the component using project conventions:
   - React 19 with TypeScript
   - Tailwind CSS 4 for styling
   - Use `cn()` from `src/lib/utils.ts` for conditional classes
   - Use Radix UI primitives for accessible interactive elements when appropriate
   - Use `lucide-react` for icons
4. Export the component appropriately
5. If the component needs tests, create them in a `__tests__/` subdirectory using Vitest + React Testing Library
