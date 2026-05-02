# Architecture Notes

> Maximum 2 pages. Specific to this codebase.

## 1. The three biggest architectural problems

### Problem 1: God-controller and UI-coupled orchestration
**What's wrong:** `HomeController` owns content loading, user loading, analytics dispatch, timeout policy, and navigation-trigger semantics in one class (`starter-app/lib/state/home_controller.dart`).

**Why it matters:** This creates high change-collision risk. Any feature touching home data, auth/session, or analytics lands in the same file and increases regression probability.

**How I'd fix it:**
1. Keep `HomeController` focused on view state.
2. Move data access to repositories (`HomeRepository`, `UserRepository`).
3. Move timeout policy to a dedicated `SessionService`.
4. Emit callback/intents for navigation instead of coupling logic and routing.

---

### Problem 2: Inconsistent API shape handling mixed across layers
**What's wrong:** Different APIs return different user shapes (`reqres` vs `jsonplaceholder`) but normalization was not a dedicated layer.

**Why it matters:** As APIs evolve, backend-specific conditions leak into state/UI and create subtle mapping bugs.

**How I'd fix it:**
- Keep one app-facing model (`User`).
- Use explicit adapter/mapper layer for each backend DTO.
- Ensure services normalize before data crosses into controllers/screens.

This submission introduces `starter-app/lib/services/user_mapper.dart` and uses it in auth/profile service paths.

---

### Problem 3: Optional data is treated like critical data
**What's wrong:** The profile insights section relied on a missing endpoint, and failure behavior previously impacted full-screen usability.

**Why it matters:** In production, optional dependencies should degrade gracefully while critical dependencies gate the screen.

**How I'd fix it:**
- Mark dependencies explicitly as `critical` vs `optional`.
- Use typed service results for loading/error/unsupported states.
- Render section-level fallback UI for optional sections.

In this submission, insights are optional and rendered with a non-blocking placeholder state.

---

## 2. Clean folder structure

If I were starting this project fresh, I'd structure it like this:

```text
lib/
├── app/
│   ├── app.dart
│   ├── router.dart
│   └── theme/
├── core/
│   ├── analytics/
│   ├── errors/
│   ├── network/
│   └── utils/
├── features/
│   ├── auth/
│   │   ├── data/
│   │   ├── domain/
│   │   └── presentation/
│   ├── home/
│   └── profile/
└── shared/
    ├── models/
    └── widgets/
```

Why this structure:
- `app/`: bootstrap, routing, and theme only.
- `core/`: cross-cutting infrastructure with no feature business logic.
- `features/`: vertical ownership for team parallelism and clearer boundaries.
- `shared/`: reusable primitives only.

---

## 3. Biggest risk at 4-developer scale

**Single biggest risk:** unclear ownership boundaries around state and data orchestration.

Mechanism:
- Multiple developers edit shared central classes for unrelated work.
- PRs mix concerns (network + UI + analytics + navigation).
- Merge conflicts increase, reviews get noisier, regression risk rises.

At team scale, this becomes the primary delivery bottleneck.

---

## 4. The refactor I committed

**What I refactored:** Added `UserMapper` as a normalization layer and routed auth/profile mapping through it.

**Why this one:** It directly addresses a real requirement in this assignment: inconsistent backend field shapes.

**Files changed:**
- `starter-app/lib/services/user_mapper.dart`
- `starter-app/lib/services/auth_service.dart`
- `starter-app/lib/services/user_service.dart`

**What I'd do next with another day:**
1. Introduce typed result wrappers for API outcomes.
2. Extract timeout/session policy into `SessionService`.
3. Add widget tests for degraded profile and alternate home payload.
