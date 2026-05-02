# Bugs Found & Fixed

## Bug 1: App could crash on startup due to analytics null assertion

**Symptom:** App could crash before login with a null-check runtime error during analytics logging.

**Root cause:** `AnalyticsService.logSessionStart()` used `_userId!` and `substring()` before user identity was guaranteed.

**Fix:** Added safe masking logic with `anonymous` fallback when `_userId` is null/short.
- File: `starter-app/lib/services/analytics_service.dart`
- Change: Replaced unsafe null assertion with guarded `maskedUser` computation.

**Why this fix:** Removes crash risk while keeping existing logging behavior.

---

## Bug 2: Subscribed users incorrectly evaluated as free users

**Symptom:** Paid-gated behavior did not activate; `isPaid` evaluated false for subscribed users.

**Root cause:** Backend value was lowercase (`subscribed`) while constants were uppercase (`SUBSCRIBED`).

**Fix:** Aligned constants to lowercase and normalized comparison in `isPaid`.
- File: `starter-app/lib/models/user.dart`
- Change: `isPaid` now compares `paidStatus.toLowerCase()`.

**Why this fix:** Handles case variance safely and keeps logic minimal.

---

## Bug 3: Home screen parsing failed on alternate payload shape

**Symptom:** Home could fail/crash when `prayer` was null and `streak` missing in alternate mock response.

**Root cause:** `HomeToday.fromJson` assumed both fields were always present and non-null.

**Fix:** Made `prayer` nullable and `streak` default to `0` when absent; added UI fallback copy.
- Files: `starter-app/lib/models/home_today.dart`, `starter-app/lib/screens/home_screen.dart`

**Why this fix:** Preserves app usability against inconsistent backend payloads.

---

## Bug 4: Profile became unusable when insights endpoint was unavailable

**Symptom:** Profile flow degraded into error state because insights endpoint is intentionally missing.

**Root cause:** `fetchInsights()` threw `UnimplementedError`, and the profile load treated it as fatal.

**Fix:** Treated insights as optional by returning `null` and rendering a non-blocking “coming soon” placeholder.
- Files: `starter-app/lib/services/user_service.dart`, `starter-app/lib/screens/profile_screen.dart`

**Why this fix:** Matches real-world partial-backend scenarios and avoids full-screen failure.

---

## Bug 5: Session timeout UX trap + async navigation safety issue

**Symptom:** User was logged out after ~3 seconds on Home; also analyzer flagged async `BuildContext` usage risk.

**Root cause:** Timeout constant too low (`3000ms`) and timer callback relied on context captured across async gaps.

**Fix:** Increased timeout to 30 minutes and switched to callback-based session-expiry navigation.
- Files: `starter-app/lib/utils/constants.dart`, `starter-app/lib/state/home_controller.dart`, `starter-app/lib/screens/home_screen.dart`

**Why this fix:** Prevents accidental rapid logout and removes context-lifecycle hazard.

---

## Bug 6: Invalid ReqRes API key caused login API failures

**Symptom:** Login failed with API error despite valid OTP and credentials.

**Root cause:** ReqRes key in request headers was invalid for current API access.

**Fix:** Updated `x-api-key` to a valid key.
- File: `starter-app/lib/services/auth_service.dart`

**Why this fix:** Restores successful login behavior for the required ReqRes integration flow.

---

## Additional quality checks

- `flutter analyze`: no issues
- `flutter test`: all tests passing
