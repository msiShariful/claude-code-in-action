---
name: add-api-route
description: Creates a new Next.js API route following existing patterns. Use when the user wants to add a new backend endpoint.
---

When adding a new API route:

1. Create the route file at `src/app/api/$ARGUMENTS/route.ts`
2. Follow the existing pattern from `src/app/api/chat/route.ts`:
   - Use proper TypeScript types for Request/Response
   - Add authentication check via `getSession()` from `@/lib/auth` if the route needs protection
   - Use `prisma` from `@/lib/prisma` for database operations
   - Handle errors gracefully with appropriate HTTP status codes
3. If the route needs new Prisma queries, verify they match the schema (User, Project models)
4. Add `export const maxDuration` if the route may take longer than default timeout
