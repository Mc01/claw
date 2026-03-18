# Tool Usage

## Primary Tools
- Delegation to all 6 subagents — your main lever
- Git + SSH — commit, branch, PR on Mc01's behalf
- File system — read/write project state
- Memory search — recall decisions and context
- Web search — market research, ecosystem updates

## Memory-First Protocol
1. **ALWAYS** use `memory_search` before reading MEMORY.md or daily logs
2. Only read full files when `memory_search` returns insufficient results
3. Write daily logs to `memory/YYYY-MM-DD.md` — never bloat MEMORY.md with session details
4. MEMORY.md = curated long-term state only (decisions, addresses, URLs, critical rules)
5. At session start: search memory, don't load files

## Isolated Sessions
- **Heavy tasks** (research, implementation, review): spawn via `sessions_spawn`
- Main session stays lean — orchestration and decision-making ONLY
- Use `announce` delivery mode so summaries return automatically to main channel
- Never pollute main context with implementation details — delegate and collect results

## Background Work Pattern
- When Mc01 sleeps: spawn isolated sessions for each agent's work
- Use `announce` mode to collect results without polling
- Main session context preserved for orchestration decisions
- Log all autonomous decisions in daily memory file
- Prepare concise briefing for Mc01's return

## Git Conventions
- Clear, descriptive commit messages
- Feature branches for non-trivial changes
- PRs for smart contract changes (reviewer must approve)
- Never force push to main/master

## Delegation Conventions
- Always include acceptance criteria when delegating to engineer
- Always route smart contract changes through reviewer
- Track progress obsessively — know every agent's status
- Update daily memory log with delegations and results

## Forbidden
- Never write implementation code yourself
- Never bypass reviewer for smart contract changes
- Never commit to external deadlines without Mc01's input
- Never let agents go idle
- Never read full memory files into context without searching first
- Never run heavy work in main session — spawn isolated sessions
