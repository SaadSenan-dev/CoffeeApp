# ☕ Coffee Shop — Flutter Mobile App

A polished, mobile-first coffee ordering application built with Flutter. The app delivers a premium user experience through a glassmorphism-styled authentication flow, category-based product browsing, Hero-animated product transitions, and a clean feature-first architecture — all without any external state management dependency.

---

## Overview

Coffee Shop is a Flutter application that covers the full user journey of a coffee ordering experience: from an immersive splash screen and a glass-effect login/register flow, through a filterable product catalogue, to a detailed product view with an add-to-cart interaction.

The project demonstrates production-level UI craftsmanship alongside a maintainable, scalable code structure suitable for a real commercial app.

---



## Key Features

**Authentication Flow**
- Full-screen background image with a dark gradient overlay on both Login and Register screens
- Frosted glass card (`BackdropFilter` + `ImageFilter.blur`) housing all form elements
- Form validation: email format check, minimum password length, and password-confirmation match
- Password visibility toggle on both password fields
- `TextEditingController` lifecycle managed correctly with `dispose()`
- Navigation between Login and Register without rebuilding the background stack

**Home Screen**
- Custom `AppBar` with a curved bottom border and a hamburger menu that opens a `Drawer`
- Horizontal category filter tabs (All / Hot / Milk) with reactive selection state
- Search field with styled focus/enabled borders
- Filter dialog (`showFilterDialog`) using `StatefulBuilder` for in-dialog state — supports Hot, Cold, and With Milk checkbox filters
- Product `GridView` (2-column) with card shadow, image, name, and price
- Per-card quick-add button that triggers a floating `SnackBar` confirmation

**Product Detail Screen**
- `Hero` animation on the product image tied to the image asset path as the tag, ensuring a smooth shared-element transition from the grid
- Split-layout: top half is the full-bleed Hero image with gradient overlay; bottom half is a rounded white content panel
- Product name, price, and description displayed clearly
- Add to Cart button with floating `SnackBar` feedback

**Navigation Sidebar**
- Material `Drawer` with a styled header (avatar, name, email)
- Navigation items: Home, Coffee Menu, Favorites, Cart, Settings
- Logout action that navigates back to the Login screen

**Routing**
- Centralised `AppRouter` using `onGenerateRoute` — all routes are named constants defined in `AppRoutes`
- Argument passing via `RouteSettings.arguments` (typed cast to `Coffee` model for the details route)
- Fallback route renders a `"Route not found"` scaffold to prevent unhandled navigation

**Design System**
- `AppColors` — a sealed class (`AppColors._()`) exposing a complete, consistent colour palette: primary, secondary, surface, background, text, border, divider, and semantic colours (success, warning, error)
- IBM Plex font applied globally via `ThemeData`
- Consistent border radii, elevation, and spacing across all screens

---

## Tech Stack

| Layer | Technology |
|-------|-----------|
| Framework | Flutter (Dart) |
| UI Rendering | Material 3 widgets + custom painting |
| Blur / Glassmorphism | `dart:ui` — `ImageFilter.blur` / `BackdropFilter` |
| Navigation | Flutter Named Routes (`onGenerateRoute`) |
| State Management | `setState` (local widget state) |
| Data | Static Dart constants (no network layer) |
| Typography | IBM Plex (custom font) |
| Assets | Local image assets |

---

## Project Architecture

The project follows a **feature-first, layered architecture** — each feature is self-contained and internally separated into `data`, `domain`, and `presentation` layers. Shared infrastructure lives in `core`.

```
lib/
├── main.dart                        # App entry point
├── app.dart                         # Root widget — MaterialApp + routing config
│
├── core/
│   ├── routing/
│   │   └── app_routes.dart          # AppRoutes (constants) + AppRouter (onGenerateRoute)
│   └── theme/
│       └── color/
│           └── app_colors.dart      # Global design token palette
│
└── features/
    ├── splash/
    │   └── presentation/
    │       └── splash_screen.dart   # Splash — full-screen image + CTA button
    │
    ├── auth/
    │   ├── data/                    # (reserved for future auth data sources)
    │   ├── domain/                  # (reserved for future use cases/entities)
    │   └── presentation/
    │       ├── login/
    │       │   └── login_screen.dart    # Login — glassmorphism form
    │       └── register/
    │           └── register_screen.dart # Register — glassmorphism form
    │
    └── home/
        ├── data/
        │   └── coffee_data.dart     # Coffee model + static product list
        ├── domain/                  # (reserved for future use cases)
        └── presentation/
            ├── screens/
            │   ├── home_screen.dart         # Shell — Scaffold with Drawer + AppBody
            │   └── details_screen.dart      # Product detail — Hero + info panel
            └── widgets/
                ├── appbar/
                │   └── app_bar.dart         # Custom curved AppBar
                ├── appbody/
                │   └── app_body.dart        # Main content — search, tabs, grid
                ├── filter/
                │   └── filter_dialog.dart   # Filter modal dialog
                └── sidebar/
                    └── side_bar.dart        # Navigation Drawer
```

The `data` and `domain` directories under `auth` and `home/domain` are intentionally scaffolded but unpopulated — they represent the extension points for connecting a real backend (Firebase, REST API) without restructuring the project.

---

## How It Works

1. **App start** — `main.dart` calls `runApp(App())`. The root `MaterialApp` configures named routing and sets the initial route to `/` (Splash).

2. **Splash** — Displays a full-screen background image with a tagline and a "Get Started" button. Tapping navigates to Login via `pushReplacementNamed`.

3. **Login / Register** — Both screens share identical visual treatment: a full-screen background image, a dark gradient overlay, and a frosted glass card containing a validated `Form`. On successful validation, the user is pushed to `/home`.

4. **Home** — The `HomeScreen` scaffold hosts a `Drawer` (SideBar) and the `AppBody` widget. `AppBody` manages category selection state and filter state via `setState`. The product grid renders from a filtered view of the `coffees` list based on the active category tab.

5. **Filter Dialog** — Tapping the filter icon opens `showFilterDialog`, a `StatefulBuilder`-powered `AlertDialog`. The returned `Map<String, bool>` is applied back to `AppBody`'s state.

6. **Product Detail** — Tapping a grid card navigates to `/details`, passing the `Coffee` object as a `RouteSettings` argument. The Hero animation on the product image provides a fluid shared-element transition. The "Add to Cart" button shows a floating SnackBar.

7. **Sidebar** — The `Drawer` provides navigation links and a Logout option that redirects to the Login screen.

---

## Installation & Setup

**Requirements**
- Flutter SDK `>=3.0.0`
- Dart SDK `>=3.0.0`
- Android Studio / VS Code with Flutter plugin

**Clone and run**

```bash
git clone https://github.com/your-username/coffee_app.git
cd coffee_app
flutter pub get
flutter run
```

**Assets**

Ensure the following assets are declared in `pubspec.yaml` and present under `assets/images/`:

```yaml
flutter:
  assets:
    - assets/images/background.jpg
    - assets/images/coffee1.jpg
    - assets/images/coffee2.jpg
    - assets/images/coffee3.jpg
    - assets/images/coffee4.jpg
    - assets/images/coffee5.jpg
    - assets/images/coffee6.jpg
  fonts:
    - family: IBM
      fonts:
        - asset: assets/fonts/IBMPlexSans-Regular.ttf
        - asset: assets/fonts/IBMPlexSans-Bold.ttf
```

---

## Potential Future Improvements

The following extensions follow naturally from the current architecture:

- **Firebase Auth integration** — the `auth/data` and `auth/domain` layers are already scaffolded to receive a real authentication service (sign-in, registration, session persistence)
- **State management upgrade** — the current `setState` approach scales well for this scope; migrating to Riverpod or BLoC would be appropriate once remote data and user session state are introduced
- **Real cart management** — a cart model and provider to persist items selected across the grid and details screens
- **Search functionality** — the search `TextField` on the home screen is already rendered; wiring it to filter `filteredCoffees` by name is a direct next step
- **Favourites screen** — the Drawer already contains a Favourites link; adding a favourites list backed by local storage is a natural extension

---

## Engineering Notes

- **Controller disposal** is handled correctly in both `LoginScreen` and `RegisterScreen` — all `TextEditingController` instances are disposed in `dispose()`, preventing memory leaks.
- **`BackdropFilter` scoping** — the blur effect is wrapped in `ClipRRect` to prevent the blur from bleeding outside the card boundary, which is the correct approach for performant glassmorphism.
- **`StatefulBuilder` in dialogs** — the filter dialog uses `StatefulBuilder` instead of converting the entire screen to stateful, keeping the state scoped to the dialog itself.
- **Hero tags** — the `Hero` widget uses `coffee.image` (the asset path string) as the tag, which is unique per product and avoids tag collision in the grid.
- **`AppColors._()` private constructor** — prevents instantiation of the colour utility class, following the Dart convention for static-only classes.
- **`NeverScrollableScrollPhysics` on GridView** — the grid is nested inside a `SingleChildScrollView`; disabling the grid's own scroll physics is the correct pattern to avoid nested scroll conflicts.

---

_This project was built as part of a daily Flutter challenge series — one production-quality app per day. Every screen, component, and design decision was written manually without scaffolding tools or AI code generation._
