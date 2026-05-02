# Submission Templates

Copy these into `BUGS.md` and `ARCHITECTURE_NOTES.md` in your submission repo.

---

## Template: `BUGS.md`

```markdown
# Bugs Found & Fixed

## Bug 1: [Short descriptive title]

**Symptom:** What would a user see? (e.g., "App crashes with null check error when opening profile after login")

**Root cause:** Why does this happen, technically? Get into the actual mechanism. (e.g., "The API response for /users/1 may omit the `phone` field, but the UserModel constructor does a non-null assertion on it")

**Fix:** What did you change? Reference the file and line number.
- File: `lib/models/user.dart`, line 23
- Change: Made `phone` nullable and updated consumers.

**Why this fix:** Brief justification — why this approach over alternatives.

---

## Bug 2: ...

(Repeat for each bug)

---

## Bugs I found but couldn't fix

If any. Explain where you'd start if you had more time.
```

---

## Template: `ARCHITECTURE_NOTES.md`

```markdown
# Architecture Notes

> Maximum 2 pages. Be specific to this codebase.

## 1. The three biggest architectural problems

### Problem 1: [Title]
**What's wrong:** Be specific. Reference files.
**Why it matters:** What does this cost the team over time?
**How I'd fix it:** Concrete approach. If it's a big change, how would you stage it?

### Problem 2: [Title]
...

### Problem 3: [Title]
...

## 2. Clean folder structure

If I were starting this project fresh, I'd structure it like this:

```
lib/
├── ...
```

Why this structure: [1-2 sentences per top-level folder on what belongs there]

## 3. Biggest risk at 4-developer scale

[One specific thing. Explain the mechanism — how exactly would this hurt the team?]

## 4. The refactor I committed

**What I refactored:** [e.g., "Extracted API calls from HomeScreen into a HomeRepository class"]

**Why this one:** Why this refactor vs. the others I could have picked?

**Commits:** [Link to the specific commits in your repo]

**What I'd do next if I had another day:** [1-2 items]
```

---

## Template for your repo `README.md`

```markdown
# InnerBhakti Assignment — [Your Name]

## How to run

1. `flutter pub get`
2. `flutter run`

Tested on: [e.g., Android 14 emulator, Flutter 3.24.3]

## What's in this repo

- `BUGS.md` — Task 1 submission
- `ARCHITECTURE_NOTES.md` — Task 3 submission
- `lib/` — the fixed and partially-refactored code

## Time spent

Roughly [X] hours total, split approximately:
- Task 1: [X]h
- Task 2: [X]h
- Task 3: [X]h

## Use of AI tools

[Brief honest note — e.g., "Used Copilot for boilerplate. Wrote all architecture notes myself." Or "Used Claude to rubber-duck my refactor approach. Final code and decisions are mine."]

## What I'd do with more time

1. ...
2. ...

## Video walkthrough

[Optional Loom/Drive link]
```
