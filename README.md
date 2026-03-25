# hello_travel

A starter Flutter travel app for **Practical Session 1** — Mobile Programming (D3 Informatics Engineering, Even Semester 2025/2026).

## Project Structure

```
lib/
├── app/
│   ├── controllers/
│   │   └── home_controller.dart    ← Business logic (complete)
│   ├── models/
│   │   └── destination.dart        ← Data model (complete)
│   └── providers/
│       └── app_provider.dart       ← App-wide config (complete)
├── resources/
│   ├── pages/
│   │   ├── home_page.dart          ← ⚠ Main TODO file (A1–A6)
│   │   └── destination_detail_page.dart  ← ⚠ TODO file (C1–C4)
│   ├── themes/
│   │   └── light_theme.dart        ← Colors and typography (complete)
│   └── widgets/
│       └── destination_card.dart   ← ⚠ TODO file (B1–B7)
├── routes/
│   └── router.dart                ← Route definitions (complete)
└── main.dart                      ← Entry point (complete)
```

## Getting Started

```bash
flutter pub get
flutter run
```

## TODOs for Students

| TODO | File | Description |
|------|------|-------------|
| A1 | `home_page.dart` | Implement `_filterByCategory()` |
| A2 | `home_page.dart` | Build `SliverAppBar` with hero image |
| A3 | `home_page.dart` | Build greeting section with `RichText` |
| A4 | `home_page.dart` | Build horizontal featured list |
| A5 | `home_page.dart` | Build category filter chips |
| A6 | `home_page.dart` | Build vertical destination list |
| B1 | `destination_card.dart` | Replace placeholder with `CachedNetworkImage` (horizontal card) |
| B2 | `destination_card.dart` | Display destination name (horizontal card) |
| B3 | `destination_card.dart` | Display country with icon (horizontal card) |
| B4 | `destination_card.dart` | Replace placeholder with `CachedNetworkImage` (vertical card) |
| B5 | `destination_card.dart` | Display destination name (vertical card) |
| B6 | `destination_card.dart` | Row with location icon + country (vertical card) |
| B7 | `destination_card.dart` | Row with star icon + rating (vertical card) |
| C1 | `destination_detail_page.dart` | Build `SliverAppBar` with destination image |
| C2 | `destination_detail_page.dart` | Row with name, country, and rating |
| C3 | `destination_detail_page.dart` | 'About' section title + description text |
| C4 | `destination_detail_page.dart` | 'Save to Wishlist' button with `SnackBar` |

## Submission

```bash
flutter analyze
git add .
git commit -m "Praktikum-01: Complete hello_travel UI — TODO A1-A6, B1-B7, C1-C4"
git push origin main
```
