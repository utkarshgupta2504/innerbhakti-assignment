# InnerBhakti Assignment — Submission

## How to run

1. Open [starter-app](starter-app)
2. Run `flutter pub get`
3. Run `flutter run`

## Validation

- `flutter analyze` → no issues
- `flutter test` → all passing

## What's in this repo

- [BUGS.md](BUGS.md) — Task 1: bugs found, root causes, and fixes
- [ARCHITECTURE_NOTES.md](ARCHITECTURE_NOTES.md) — Task 3 architectural write-up
- [starter-app](starter-app) — updated Flutter app (Tasks 1 & 2)

## Key implementation highlights

- Fixed six issues including startup crash risk, paid-status mismatch, alternate payload handling, missing profile endpoint handling, session timeout UX trap, and ReqRes API key mismatch.
- Added a `UserMapper` normalization layer for API shape differences.
- Added regression test coverage for inconsistent home payload shape.

## Time spent

Roughly 8–10 hours total:
- Task 1: ~4h
- Task 2: ~3h
- Task 3: ~1–2h

## Use of AI tools

Used GitHub Copilot as a coding assistant for exploration, refactoring support, and drafting. Final changes and decisions were reviewed and curated manually.

## What I'd do with more time

1. Add typed API result/error wrappers and better UI state modeling.
2. Split `HomeController` into smaller feature-focused units with isolated tests.
3. Add widget/integration tests for login/profile degraded states.
