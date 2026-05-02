# Starter App

This is the Flutter project you'll be working on. See `../ASSIGNMENT.md` for what to do.

## Run

```bash
flutter pub get
flutter run
```

Works on Android, iOS, and web (Chrome).

## Tested credentials

The login flow hits ReqRes, a public mock API. To log in successfully:

- **Phone:** any 10 digits (the UI uses a phone field, but we pass it to ReqRes as an email underneath)
- **OTP:** `1234`

See `lib/services/auth_service.dart` for what actually happens on submit.

## What's deliberately broken

Read `../ASSIGNMENT.md`. Don't fix anything else before Task 1 is submitted.

## Project layout

```
lib/
├── main.dart               App entry, routing
├── models/                 Data models
├── services/               API clients, local storage
├── state/                  Controllers / app state
├── screens/                Top-level screens
├── widgets/                Reusable widgets
└── utils/                  Constants, colors, helpers
```

## Mock data

`assets/mocks/` contains local JSON that the app loads as if it came from an API. Treat these as real backend responses.
