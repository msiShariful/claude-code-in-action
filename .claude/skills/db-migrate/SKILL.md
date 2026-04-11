---
name: db-migrate
description: Creates and applies a Prisma database migration. Use when the user wants to change the database schema or add a migration.
---

When creating a database migration:

1. Read the current schema at `prisma/schema.prisma`
2. Ask the user what schema changes they want (if not already specified)
3. Make the requested changes to `prisma/schema.prisma`
4. Run `npx prisma migrate dev --name $ARGUMENTS` to create and apply the migration
5. Run `npx prisma generate` to regenerate the Prisma client in `src/generated/prisma`
6. If there are any migration errors, diagnose and report them
7. Check if any source files in `src/` need updating to match the schema change
