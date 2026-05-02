# InnerBhakti — Flutter Engineering Assignment

Hello, and thanks for taking the time to work through this assignment.

We're a spiritual wellness app currently going through a rebuild. The role you're applying for has two sides: **stabilizing our existing Flutter app (v1)** which is in production and has accumulated bugs, and **helping architect its successor (v2)** which we're planning from scratch. This assignment mirrors that exact situation in miniature.

You'll be working with a small Flutter project that resembles a slice of our real app. It has bugs. It has bad patterns. It has an API endpoint that doesn't exist. Your job is to make it work, make it better, and tell us what you'd change if this were a real production app.

---

## Time expectation

**Please don't spend more than ~15 hours total on this.**

We mean that. Spending 40 hours on a take-home does not impress us — it worries us. We evaluate on quality of thought, not hours invested. A thoughtful partial submission beats a rushed complete one.

Submit within **5 days** of receiving this. If you need more time, just let us know — we'd rather know than wonder.

---

## What's in this package

```
innerbhakti-assignment/
├── README.md                   ← you are here
├── ASSIGNMENT.md               ← the three tasks, detailed
├── EVALUATION_CRITERIA.md      ← how we'll evaluate your submission
├── SUBMISSION_TEMPLATE.md      ← template for your write-ups
└── starter-app/                ← the Flutter project you'll work on
    ├── pubspec.yaml
    ├── lib/                    ← the code
    ├── assets/mocks/           ← local mock JSON responses
    └── test/                   ← existing tests (some are broken)
```

**No setup required beyond a working Flutter environment.** The app uses a combination of public free APIs (ReqRes, JSONPlaceholder) and bundled local JSON files. You don't need to run a server, get an API key, sign up for anything, or contact us for access.

---

## Getting started

1. Install Flutter (stable channel, ≥ 3.19). Verify with `flutter doctor`.
2. `cd starter-app`
3. `flutter pub get`
4. `flutter run` — launch on Android emulator, iOS simulator, or Chrome.
5. Read through `ASSIGNMENT.md` for the three tasks.

The app should launch and show an OTP login screen. **It will not work correctly out of the box. That is intentional.** Finding and fixing what's broken is part of Task 1.

---

## Submission

When you're done, submit by:

1. Creating a **private GitHub repository** with your solution.
2. Adding these users as collaborators: *(replace with your team's GitHub handles before sending)*
3. Replying to our email with the repo link.

Your submitted repo must contain:

- Your fixed code (the starter-app directory)
- `BUGS.md` — what you found in Task 1 and how you fixed it
- `ARCHITECTURE_NOTES.md` — your write-up for Task 3
- A working `README.md` with setup instructions so we can actually run what you built

**Optional but strongly encouraged:** a 2–3 minute Loom/screen recording walking us through your solution. Even a rough recording from your phone helps us understand how you think. Link it in your email.

---

## A few notes on what we care about

- **Readability beats cleverness.** If a senior dev joins the team tomorrow, can they understand your code?
- **Small, thoughtful commits beat one giant "final" commit.** We'll read your commit history.
- **We'd rather see you finish Tasks 1 and 3 well than rush through all three poorly.** If you run out of time, skip Task 2's optional extras — not the write-up.
- **Be honest about what you couldn't do.** A `BUGS.md` entry that says "I found this bug but ran out of time to fix it, here's where I'd start" is valuable.

---

## Questions?

If anything in the assignment is unclear or broken in a way you think is unintentional, email us before spending hours on it. We'll respond within one working day.

Good luck. We're looking forward to seeing what you build.

— The InnerBhakti team
