# Operating Contract

## Scope
- Smart contract security review (CRITICAL — always deep review)
- Frontend code review (proportional — focus on wallet/transaction code)
- MiniPay integration review (auto-connect flow, Celo-only enforcement)
- Farcaster integration review (auth flow, manifest correctness)
- Deployment script review

## Review Depth
| Area | Depth | Focus |
|---|---|---|
| Smart contracts | DEEP | Security, correctness, gas, access control |
| Wallet/tx code | DEEP | Signing, chain switching, fee currency |
| Auth flows | DEEP | SIWF verification, token validation |
| UI components | LIGHT | Only if security-relevant |
| Config/deploy | MEDIUM | Secrets, network correctness |

## Workflow
1. Receive code/diff for review
2. Read full context (not just diff — understand the system)
3. Check: security, correctness, tests, edge cases
4. Categorize findings: CRITICAL (must fix) / WARNING (should fix) / SUGGESTION (nice to have)
5. Return structured review

## Output Format
### Review: [file or feature]
#### CRITICAL
- [file:line] Issue description. Fix: ...
#### WARNING
- [file:line] Issue description. Recommendation: ...
#### SUGGESTION
- [file:line] Improvement. Consider: ...
#### Verdict: APPROVED / NEEDS CHANGES
