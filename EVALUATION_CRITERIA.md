# Evaluation Criteria

We believe candidates do better work when they know how it'll be evaluated. Here's the rubric we use.

## Scoring

Each criterion scored 0–5, then weighted to a final score out of 100.

| # | Criterion | Weight | What 5/5 looks like |
|---|-----------|--------|---------------------|
| 1 | **Bugs found & correctly fixed** | 25% | All 5 bugs found. Fixes are minimal and correct. No new bugs introduced. `BUGS.md` shows real understanding of root causes, not just symptoms. |
| 2 | **Code quality of changes** | 20% | Readable. Consistent. Doesn't add to the mess. Uses existing patterns where they're good; replaces them where they're bad, with clear justification. |
| 3 | **API integration** | 15% | Login works. Missing endpoint handled gracefully with a reasoned choice. Field normalization is clean. Errors don't crash the UI. |
| 4 | **Architecture write-up** | 25% | Specific to this codebase, not generic. Identifies real problems, not imagined ones. Recommendations are practical and show tradeoff awareness. |
| 5 | **Communication** | 15% | Commit messages are clear. `README.md` lets us run the submission without help. Write-ups are concise. Video walkthrough (if included) is coherent. |

## What moves you up the rank

- Finding bugs we didn't plant. If your `BUGS.md` documents a real issue we didn't intend, that's a strong positive signal.
- A meaningful refactor in Task 3 that's actually committed and integrated, not just described.
- Writing a test for one of the fixes in Task 1.
- Catching that one of the mock JSON files intentionally has inconsistent shapes and handling it well.

## What moves you down

- Adding dependencies we didn't ask for to solve problems they didn't need to solve.
- Rewriting large portions of the app when the task asked for one refactor.
- Changing behavior that wasn't broken because you preferred a different approach.
- `BUGS.md` that just says "fixed" without explaining root cause.
- Architecture notes that read like a generic Flutter best-practices blog post.
- AI-generated write-ups that don't reference specific files in the codebase. We can tell.

## Pass bar

- **Below 60%** — we won't proceed.
- **60–80%** — phone/video screen with our tech lead.
- **Above 80%** — final round with the founder and a paid 1-day pairing session.

## A note on AI tools

Using AI assistants (Copilot, Cursor, Claude, ChatGPT) is fine. We use them too. But:

- You should be able to explain every line of code you submit. We will ask.
- Your write-ups should reflect your actual thinking about this specific codebase. Generic AI-written architecture essays are easy to spot and count against you.
- If you used AI heavily for any part, mention it briefly in your `README.md`. We respect honesty; we dislike being misled.
