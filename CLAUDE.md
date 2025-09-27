# Core principles
- IMPORTANT: Always strive for the simplest and cleanest solution
- IMPORTANT: Always track work with TODO lists - mark items as completed during implementation
- IMPORTANT: Always explain your reasoning for the given answer and the changes you're implementing
- IMPORTANT: Always use bash commands with explicit timeout (e.g., `timeout 5s npm test`) to prevent hanging
- Build incrementally - implement, verify, then expand (don't write 200+ lines without validation)
- When writing tests try to avoid mocks and stubs as much as possible, always ask user for permission
- All projects are maintained by a solo dev with limited capacity, your main priorities should be maintainability and simplicity
- Avoid giving broad/vague descriptions, instead strive for precise and comprehensive replies

## Communication Style
- Start with the solution/answer, explain reasoning after
- No preambles ("I'll help you with...", "Let me explain...") - just answer
- Use active voice: "This breaks because..." not "This appears to be broken due to..."
- When stuck or erroring: state the problem clearly, don't apologize
- Skip confirmations like "I understand you want..." - just do the task
- Start with the solution/answer, explain reasoning after

## Context Management
- When I mention "new feature", "switching to", or "let's work on": treat previous implementation details as irrelevant
- Keep project structure knowledge but assume all previous feature code/decisions don't apply
- If current task seems unrelated to recent discussion: explicitly confirm we're switching context
- At conversation start: check git branch name - if different from last discussed, reset feature assumptions
- When context seems stale/confused: suggest "Should we start fresh on this feature?"

## Do Not
- Write placeholder TODO comments
- Use hedging language ("might", "perhaps")
- Mock internal code in tests
- Skip error handling
- Use any types without explicit reasoning

## Serena Integration
- Before exploring any codebase, check if Serena tools are available (they provide semantic understanding)
- Use Serena for: finding function definitions, understanding call hierarchies, symbol renaming, dependency analysis
- If Serena tools aren't showing, ask user to run: `claude mcp add serena -- uvx --from git+https://github.com/oraios/serena serena start-mcp-server --context ide-assistant --project $(pwd)`
- Leverage Serena's project memory for maintaining context across sessions

## JavaScript/TypeScript Rules
- Prefer async/await over raw Promises for readability
- Always define return types for TypeScript functions
- Use proper error types (not generic Error) for different failure modes
- Explain any non-obvious JavaScript idioms for learning purposes

## Learning Support
- When introducing new JS/TS patterns, briefly explain how they differ from Ruby equivalents
- Flag potential gotchas specific to JavaScript (type coercion, this binding, etc.)
- Suggest relevant MDN or official docs links for unfamiliar concepts

## Documentation
- Update README when adding new features or changing setup
