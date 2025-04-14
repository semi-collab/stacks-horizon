;; Title: 
;; Stacks Horizon: Bitcoin-Aligned Proof of Attendance Protocol
;; Summary:
;; Enterprise-grade attendance verification system with multi-event support, offering Bitcoin-native compliance
;; and scalable STX rewards through Stacks Layer 2 infrastructure.

;; Description:
;; A next-generation POA system combining Stacks' Layer 2 efficiency with Bitcoin's 
;; security model. Features include:
;;
;; - Bitcoin-Compliant Architecture: Immutable audit trails anchored to Bitcoin blocks
;; - Multi-Event Engine: Parallel event management with configurable reward tiers
;; - Trustless Verification: Decentralized authority model with KYC-compatible checks
;; - STX Reward System: Non-custodial reward distribution with bonus
;; - Compliance Framework: On-chain verification logs for regulatory transparency
;;
;; Key Innovations:
;; 1. Hybrid Duration Tracking: Precision attendance measurement in Bitcoin blocks
;; 2. Tiered Reward System: Base + bonus rewards with minimum participation thresholds
;; 3. Verifier DAO: Decentralized authority management with revocable privileges
;; 4. Treasury Management: Secure STX handling with owner-controlled vault
;;
;; Designed for: 
;; - Web3 Event Platforms - DAO Governance Systems - Educational Institutions
;; - Corporate Training Programs - NFT Gated Experiences

;; Error codes
(define-constant ERR-NOT-AUTHORIZED (err u100))
(define-constant ERR-ALREADY-CLAIMED (err u101))
(define-constant ERR-EVENT-NOT-ENDED (err u102))
(define-constant ERR-EVENT-ENDED (err u103))
(define-constant ERR-NO-REWARD (err u104))
(define-constant ERR-EVENT-NOT-FOUND (err u105))
(define-constant ERR-INSUFFICIENT-FUNDS (err u106))
(define-constant ERR-INVALID-DURATION (err u107))
(define-constant ERR-ALREADY-REGISTERED (err u108))
(define-constant ERR-EVENT-NOT-ACTIVE (err u120))
(define-constant ERR-NO-CHECKIN-RECORD (err u121))
(define-constant ERR-ALREADY-VERIFIED (err u122))
(define-constant ERR-INVALID-ATTENDEE (err u123))

;; Constants for string validation
(define-constant MIN-NAME-LENGTH u3)
(define-constant MAX-NAME-LENGTH u50)
(define-constant MIN-DESC-LENGTH u10)
(define-constant MAX-DESC-LENGTH u200)
(define-constant ERR-INVALID-NAME (err u2000))
(define-constant ERR-INVALID-DESCRIPTION (err u2001))
(define-constant ERR-CONTAINS-INVALID-CHARS (err u2002))


;; Constants for validation
(define-constant MAX-DURATION u52560) ;; Example: max duration of ~1 year in blocks (assuming 10-min blocks)
(define-constant MIN-DURATION u144)   ;; Example: min duration of 1 day in blocks
(define-constant MAX-REWARD u1000000000000) ;; Example: 1000 STX maximum reward
(define-constant ERR-INVALID-START-HEIGHT (err u110))
(define-constant ERR-INVALID-REWARD (err u111))
(define-constant ERR-INVALID-MIN-ATTENDANCE (err u112))


;; Data variables
(define-data-var contract-owner principal tx-sender)
(define-data-var event-counter uint u0)
(define-data-var treasury-balance uint u0)

;; Event struct
(define-map events 
    uint 
    {
        name: (string-ascii 50),
        description: (string-ascii 200),
        start-height: uint,
        end-height: uint,
        base-reward: uint,
        bonus-reward: uint,
        min-attendance-duration: uint,
        organizer: principal,
        is-active: bool
    }
)
