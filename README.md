# eSIMgram — Premium Flutter eSIM App

A structured Flutter starter for a premium, futuristic eSIM marketplace and management app.

## Stack
- Flutter / Dart
- GetX (routing, reactive controllers, dependency injection)
- Dio (centralized HTTP client)
- Drift + SQLite dependency included for local persistence expansion
- Clean Architecture / feature-oriented structure
- SharedPreferences for non-sensitive appearance/onboarding preferences
- Flutter Secure Storage dependency included for auth tokens

## Run
1. Install Flutter stable and Android Studio/VS Code.
2. Extract this folder.
3. From the project root run:
   ```bash
   flutter create .
   flutter pub get
   flutter run
   ```
4. Replace `https://api.example.com/` in `lib/core/network/api_client.dart` with your backend URL.

## Current implementation
The starter includes a responsive premium shell, dynamic light/dark theme, 32 app-wide palettes, persistent appearance preferences, onboarding, home dashboard, destination explorer, plans, eSIM wallet, profile/settings, reusable components, GetX routes, and centralized Dio setup.

## Important production integrations
The app uses demo/local sample data for presentation. To enable real purchases and connectivity, connect:
- Authentication and catalog API
- eSIM provider API for provisioning/activation
- Payment gateway SDK and server-side payment verification
- Push notification service
- Real usage/validity API
Never treat client-side demo payment success as a real transaction. Do not store card details or auth tokens in plain preferences.

## Architecture
`lib/core` contains shared infrastructure. Each feature has `presentation` and can add `domain`/`data` layers as real APIs are integrated. Purely visual onboarding stays lightweight. Do not put API calls or business rules in widgets.
