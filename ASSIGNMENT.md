# The Assignment

Three tasks, each testing something different. Read all three before starting — they connect, and Task 3's write-up will be stronger if you've done Tasks 1 and 2 first.

---

## Task 1 — Debug & Fix

**What this tests:** Your ability to read unfamiliar code and find what's broken. This is day-one-on-the-job work for v1 stabilization.

The starter app has **five planted bugs**. Some will crash the app, some will silently return wrong data, some will cause subtle UX issues. They're drawn from real production bugs we've dealt with.

### Your job

1. Find and fix all five bugs.
2. For each bug, document it in `BUGS.md` using the template in `SUBMISSION_TEMPLATE.md`:
   - **What's wrong** — the symptom a user would see
   - **Root cause** — why it happens, technically
   - **Your fix** — what you changed and why
   - **File and line** — where the bug lived
3. If you find more than five bugs, document those too. If you can't fix one, explain where you'd start.

### Hints to save you time

- Not all bugs are crashes. One is a silent data issue. One is a UX trap.
- Read the `assets/mocks/` JSON files alongside the code — bug-hunting is easier when you know what the data actually looks like.
- `flutter analyze` and running the tests (`flutter test`) will surface some issues but not all.
- The commit history of the starter-app is a single commit. Don't go looking there for clues.

---

## Task 2 — Integration Against a Flawed API

**What this tests:** How you handle real-world API messiness. Our real API has inconsistent field names, slow endpoints, and missing routes. Your future job includes dealing with that gracefully.

The app talks to two kinds of backends:

1. **Public free APIs** (ReqRes and JSONPlaceholder) — used for the login and profile screens. These are real HTTPS endpoints you can hit from anywhere, no key required.
2. **Local mock JSON files** (in `assets/mocks/`) — used for the home screen content. The app loads these as if they came from an API.

### Your job

Complete the following. The current app does some of this badly or not at all.

#### 2a. The login flow

- Sends the phone number to `POST https://reqres.in/api/login` with `{ "email": "eve.holt@reqres.in", "password": "cityslicka" }` (ReqRes requires these specific credentials; treat the `phone` field in our UI as a stand-in).
- On success, stores the returned token in-memory and navigates to Home.
- On failure, shows a clear error message. Not a red Flutter error screen.

#### 2b. The home screen

- Loads `assets/mocks/home_today.json` as if it came from an API (simulate a 300ms delay).
- One of the fields in that JSON will be **missing from some responses** — the app should handle that without crashing.
- Shows today's mantra, prayer, and course — see the mock file for the shape.

#### 2c. The profile screen — **this is the important one**

- Calls `GET https://jsonplaceholder.typicode.com/users/1` and displays the returned user.
- **Deliberately missing from our mock backend**: the endpoint `GET /home/insights/:userId` which the UI expects for a "this week's insights" section on the profile. You'll see a TODO in the code for it.
- Handle this gracefully. Don't let the screen crash or white-out. Pick a sensible pattern — an empty state, a "coming soon" placeholder, a retry button, feature-flagged hidden section. Document your choice in a code comment.
- **This mirrors our actual v1 situation**: our Flutter app calls endpoints the backend doesn't have. How you handle it matters more than what specifically you do.

#### 2d. Field normalization

- The login API returns `{ "token": "..." }`. Our UI expects a `User` object with fields like `id`, `name`, `email`.
- The profile API returns a user with `{ "name": "...", "username": "...", "email": "..." }`.
- Write a normalization layer (mapper/adapter) so screens work with a clean `User` model regardless of which API returned the data.

### Constraints

- Use `package:http` or `package:dio` — your choice. One is already in `pubspec.yaml`.
- **Do not** add any hosting, proxy, or paid service.
- Network code goes in `lib/services/`, not in widgets. This is non-negotiable.

---

## Task 3 — Architectural Write-up

**What this tests:** Your judgment. This is the most important task for a mid-level role. We can teach Flutter APIs. We can't easily teach architectural taste.

The starter app has **deliberate bad patterns** — things that work but would become nightmares at scale. They mirror what we actually dealt with in v1: 200+ poorly named color constants, API calls scattered across widgets, enums duplicated in three places with slightly different values, a god-class controller, no error boundary.

### Your job

Write `ARCHITECTURE_NOTES.md` — **maximum 2 pages**, using the template provided. Answer four questions:

1. **What are the three biggest architectural problems in this codebase?** Not bugs (Task 1 covers those) — patterns. Which three would you fix first, and why *those* three?

2. **How would you structure this project if you were starting fresh?** Show the folder structure you'd use. Keep it to what you'd actually use, not every possible folder from a tutorial.

3. **If this app needed to scale to a team of 4 Flutter developers, what's the single biggest risk in how it's currently built?** One specific thing. Explain why.

4. **Pick one pattern from the codebase and refactor it.** Not everything — one thing. Commit the refactor, and in your write-up explain what you changed and why you chose that one. This is where we see how you translate architectural judgment into code.

### What we're looking for

- **Specifics, not generics.** "Separate concerns" is not an answer. "The `HomeController` currently handles auth state, navigation, and API calls — I'd split these into an AuthBloc, a Router, and a HomeRepository because…" is an answer.
- **Evidence you've read the code.** Reference actual file names, actual bad patterns you saw. Don't describe a generic Flutter project.
- **Tradeoffs.** Any architectural decision trades something off. If you recommend BLoC, what are you giving up versus Riverpod? Showing you've thought about the other side is more convincing than advocacy.
- **Honesty about scope.** If you think a pattern is fine as-is, say so. We're not looking for change for its own sake.

### What we are not looking for

- A rewrite of the whole app.
- A comparison of state management libraries in the abstract.
- A design system proposal (we have one already).
- Opinions on what framework we should use instead of Flutter (we're staying on Flutter).

---

## Submission checklist

Before you submit, verify:

- [ ] The app runs with `flutter run` on at least one platform
- [ ] `flutter analyze` produces no errors (warnings acceptable if explained)
- [ ] `flutter test` passes
- [ ] `BUGS.md` is complete (Task 1)
- [ ] `ARCHITECTURE_NOTES.md` is under 2 pages (Task 3)
- [ ] Your commit history is readable — small commits, clear messages
- [ ] Your repo `README.md` explains how to run your submission

Reach out if anything is unclear.
