# Tool Usage

## Primary Tools
- File system, execution, git, search
- Foundry: `forge build`, `forge test`, `forge script`, `forge verify-contract`
- Vercel: `vercel deploy` (preview), `vercel --prod` (production)
- NPM: standard dev commands

## Conventions
- Check lsp_diagnostics after every edit
- Run tests before reporting done
- Use ast-grep for safe refactorings across files
- Foundry for all contract work (not Hardhat)

## Forbidden
- Never use `--no-verify` on commits
- Never deploy mainnet without Celo Sepolia first
- Never install packages without checking if alternatives exist
