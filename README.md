# Stacks Horizon: Bitcoin-Aligned Proof of Attendance Protocol

[![Clarity Version](https://img.shields.io/badge/Clarity-2.0+-blue)](https://clarity-lang.org)

Enterprise-grade attendance verification system combining Bitcoin's security with Stacks Layer 2 efficiency. Designed for Web3 events, DAO governance, and educational institutions.

## Overview

A smart contract implementation for:

- Multi-event attendance tracking with Bitcoin-block precision
- Decentralized verification authorities (DAO model)
- STX reward distribution with bonus
- Regulatory-compliant audit trails
- Non-custodial treasury management

## Key Features

### Multi-Event Management

- Parallel event creation with configurable parameters
- Time-bound participation windows (Bitcoin block height-based)
- Dynamic reward structures (base + bonus tiers)

### Bitcoin-Block Time Tracking

- Event duration measured in Bitcoin blocks
- Check-in/check-out system with block height stamps
- Minimum attendance requirements enforcement

### Tiered Reward System

- Base rewards for participation
- Bonus rewards for exceeding minimum durations
- Anti-sybil mechanisms through verified claims

### Verification DAO

- Accredited verifier registry
- Decentralized attendance validation
- On-chain verification logs

### Compliance Framework

- Immutable attendance records
- Regulator-friendly event audit trails
- KYC-ready participant tracking

## Technical Specifications

### Contract Architecture

| Component       | Description                                 |
| --------------- | ------------------------------------------- |
| Blockchain      | Stacks (Bitcoin Layer 2)                    |
| Smart Contract  | Clarity 2.0                                 |
| Data Structures | Events, Attendance Records, Rewards Claimed |
| Error Handling  | 15+ specific error codes                    |
| Validation      | Input sanitization & boundary checks        |

### Core Functions

```clarity
;; Event Management
create-event         ;; Initialize new POA event
deactivate-event     ;; Disable inactive events

;; Participant Actions
check-in            ;; Start attendance tracking
check-out           ;; Finalize participation

;; Verification Flow
verify-attendance   ;; Authorized confirmation

;; Reward System
claim-reward        ;; STX distribution trigger

;; Admin Controls
add-verifier        ;; DAO member management
deposit-funds       ;; Treasury replenishment
```

## Usage Scenarios

### Event Organizers

```clarity
;; Create conference event
(create-event
  "Stacks Summit 2024"
  "Annual developer conference"
  u202400  ;; Start block
  u1440    ;; 10-day duration
  u500000  ;; Base reward 0.5 STX
  u200000  ;; Bonus reward
  u720     ;; Min 5-day attendance
)
```

### Participants

```clarity
;; Check-in at block 202401
(check-in u1)

;; Check-out at block 202865
(check-out u1)
```

### Verifiers

```clarity
;; Verify participant eligibility
(verify-attendance u1 'ST1234...)
```

## Compliance & Security

### Bitcoin Anchoring

- All event timelines reference Bitcoin block heights
- Attendance records include BTC block hashes

### Access Control

- Owner-restricted admin functions
- Verifier DAO with revocable privileges

### Fund Safety

- Separate treasury contract
- Withdrawal approval workflows
- STX escrow for active events

## Roadmap

- [ ] NFT Attendance Badges
- [ ] Mobile SDK Integration
- [ ] DAO Governance Module
- [ ] Cross-chain Verification

## Contributing

1. Fork repository
2. Create feature branch (`feat/your-feature`)
3. Submit PR with test coverage
4. Code review by core maintainers

**Stacks Foundation**: [https://www.stacks.org](https://www.stacks.org)
