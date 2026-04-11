---
name: dev
description: Starts the Next.js development server in the background and confirms it's running. Use when the user wants to start the dev server.
---

When starting the development server:

1. Run `npm run dev:daemon` to start the Next.js dev server in the background with Turbopack
2. Wait a few seconds, then read `logs.txt` to confirm the server started successfully
3. If there are errors in the logs, diagnose and fix them
4. Report the local URL (typically http://localhost:3000) to the user
