# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Commands

```bash
# First-time setup (install deps + Prisma generate + migrate)
npm run setup

# Development server (uses Turbopack)
npm run dev

# Background dev server (logs to logs.txt)
npm run dev:daemon

# Build for production
npm run build

# Run all tests
npm test

# Run a single test file
npx vitest run src/components/chat/__tests__/ChatInterface.test.tsx

# Lint
npm run lint

# Reset database (destructive)
npm run db:reset
```

## Architecture Overview

UIGen is a Next.js 15 App Router app where users chat with Claude to generate React components that are previewed live in an iframe — no files are written to disk.

### Data Flow

1. User sends a message → `POST /api/chat` (`src/app/api/chat/route.ts`)
2. The API serializes the current `VirtualFileSystem` state and sends it with the messages to Claude via Vercel AI SDK's `streamText`
3. Claude responds with tool calls (`str_replace_editor`, `file_manager`) to create/modify virtual files
4. Tool calls stream back to the client → `ChatContext` intercepts them via `onToolCall` → `FileSystemContext.handleToolCall` applies the changes to the in-memory `VirtualFileSystem`
5. `PreviewFrame` watches `refreshTrigger` from `FileSystemContext`, transpiles all virtual files with Babel (client-side via `@babel/standalone`), generates an import map with blob URLs, and injects it into a sandboxed `<iframe>`

### Key Abstractions

**`VirtualFileSystem`** (`src/lib/file-system.ts`) — In-memory tree of `FileNode` objects. Serialized to `Record<string, FileNode>` for API requests and for persisting to the `Project.data` column (JSON string in SQLite).

**`FileSystemContext`** (`src/lib/contexts/file-system-context.tsx`) — React context wrapping `VirtualFileSystem` with state for selected file and a `refreshTrigger` counter. `handleToolCall` is the bridge between streamed AI tool calls and actual file mutations.

**`ChatContext`** (`src/lib/contexts/chat-context.tsx`) — Wraps Vercel AI SDK's `useChat`, wires `onToolCall` to `FileSystemContext.handleToolCall`, and passes serialized file state in every request body.

**JSX Transformer** (`src/lib/transform/jsx-transformer.ts`) — `createImportMap` iterates all virtual files, transpiles `.jsx`/`.tsx` to JS via Babel, creates blob URLs, and builds a browser import map. Third-party packages are resolved to `https://esm.sh/<package>`. `createPreviewHTML` generates the full iframe HTML including Tailwind CDN, the import map, and an error boundary.

**AI Tools** (`src/lib/tools/`) — `str_replace_editor` (create/str_replace/insert/view commands) and `file_manager` (rename/delete). Both operate on a `VirtualFileSystem` instance passed at construction time on the server.

**Provider** (`src/lib/provider.ts`) — Returns a real `anthropic(MODEL)` if `ANTHROPIC_API_KEY` is set, otherwise returns `MockLanguageModel` which generates static counter/form/card components for offline development.

### Auth

JWT-based session stored in an httpOnly cookie (`auth-token`). `src/lib/auth.ts` handles sign/verify using `jose`. Middleware (`src/middleware.ts`) runs `verifySession` on protected routes. Projects are only persisted to DB when a user is authenticated; anonymous sessions track work in localStorage via `src/lib/anon-work-tracker.ts`.

### Database

SQLite via Prisma. Two models: `User` (email + bcrypt password) and `Project` (chat `messages` and file system `data` stored as JSON strings). The Prisma client is generated to `src/generated/prisma`.

### Preview Entry Point Resolution

`PreviewFrame` looks for entry files in this order: `/App.jsx`, `/App.tsx`, `/index.jsx`, `/index.tsx`, `/src/App.jsx`, `/src/App.tsx`, then falls back to the first `.jsx`/`.tsx` file found.

## Environment Variables

Copy `.env.example` to `.env`:
- `ANTHROPIC_API_KEY` — optional; omit to use the mock provider
- `JWT_SECRET` — defaults to `"development-secret-key"` if unset

## Testing

Tests use Vitest + jsdom + React Testing Library. Test files live alongside source in `__tests__/` subdirectories.
