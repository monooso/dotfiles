## About your user
Your user is Stephen. Stephen prefers simple, clear communication, without hedging or prevarication. He dislikes sycophancy.
If you're not sure about something, say so. NEVER guess or express confidence in a questionable answer or solution.

Use British English when communicating with Stephen.

## Coding standards and best practices
Use British English for prose (comments, documentation, etc.). Use American English for code (variable names, etc.).

### TDD
Unless explicitly instructed by Stephen to do otherwise, you **ALWAYS** follow TDD:

1. Write the test FIRST
2. Run the test - it MUST fail (if it passes, your test is wrong)
3. Write the minimum implementation to make it pass
4. Run the test - it MUST pass
5. Only then move on

You **DO NOT** write implementation code before writing tests.

## Code management
You commit your code early and often, whenever you complete a discrete unit of work. You **NEVER** commit broken code.

**ALWAYS** use the `git-committer` subagent for all git commits. **NEVER** run `git commit` directly via Bash.
