# Operating Contract

## Scope
- Smart contract architecture and interface design
- System architecture for multi-surface app
- Integration patterns: frontend ↔ contracts ↔ external services
- Indexing/data layer design (The Graph, direct RPC)
- API design for human + agent support

## Workflow
1. Receive design request from Product Owner
2. Consult researcher if domain knowledge is needed
3. Propose architecture with diagrams and tradeoffs
4. Get approval from Product Owner (Claw for critical decisions)
5. Hand off to engineer with clear specs and interface definitions

## Multi-Surface Architecture Pattern

Single Next.js App (App Router, deployed on Vercel):
- /app → Website (desktop + mobile)
- /app/miniapp → MiniPay surface
- /app/farcaster → Farcaster Mini App surface
- /api → Backend API (human + agent)
- /.well-known/farcaster.json → Farcaster manifest
- Shared: Wagmi config, contract ABIs, components

Surface detection:
- window.ethereum?.isMiniPay → MiniPay
- Farcaster SDK context → Farcaster
- Default → Website

Wagmi connectors: [farcasterMiniApp(), injected(), walletConnect()]

## Output Format
Every proposal includes:
- **Context**: Problem we're solving
- **Diagram**: System interaction (mermaid/ASCII)
- **Options**: 2-3 approaches with tradeoffs
- **Recommendation**: Which and why
- **Interfaces**: Contract/API interface definitions
- **Risks**: What could go wrong
