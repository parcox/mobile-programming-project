![Nylo Banner](https://nylo.dev/images/nylo_logo_header.png)

<p align="center">
  <a href="https://github.com/nylo-core/nylo/releases"><img src="https://img.shields.io/github/v/release/nylo-core/nylo?style=plastic" alt="Latest Release Version"></a>
  <a href="https://github.com/nylo-core/nylo/blob/master/LICENSE"><img alt="GitHub" src="https://img.shields.io/github/license/nylo-core/nylo?style=plastic"></a>
  <a href="#"><img alt="GitHub stars" src="https://img.shields.io/github/stars/nylo-core/nylo?style=plastic"></a>
</p>

## Nylo

Nylo is a micro-framework for Flutter which is designed to help simplify developing apps. Every project provides a simple boilerplate and MVC pattern to help you build apps easier.

This project is open source and MIT-licenced, we welcome any contributions. You can join as a backer/sponsor to fund future development for this project [here](https://nylo.dev)

---

## Features
Some core features available
* [Routing](https://nylo.dev/docs/7.x/router).
* [Themes and styling](https://nylo.dev/docs/7.x/themes-and-styling).
* [Localization](https://nylo.dev/docs/7.x/localization).
* [CLI for generating project files](https://nylo.dev/docs/7.x/metro).
* [Elegant API Services for Networking](https://nylo.dev/docs/7.x/networking).
* [Creating App Icons](https://nylo.dev/docs/7.x/app-icons).
* [Project Configuration](https://nylo.dev/docs/7.x/configuration).
* [Streamlined Project Structure](https://nylo.dev/docs/7.x/directory-structure).

## Requirements
* Flutter >= 3.24.0

## Documentation
View our [docs](https://nylo.dev/docs) and visit [nylo.dev](https://nylo.dev)

## Changelog
Please see [CHANGELOG](https://github.com/nylo-core/framework/blob/7.x/CHANGELOG.md) for more information what has changed recently.

## Social
* [Twitter](https://twitter.com/nylo_dev)

## Security
If you discover any security related issues, please email support@nylo.dev instead of using the issue tracker.

## Contributors
* [Anthony Gordon](https://github.com/agordn52)

---

# hello_travel

A starter Flutter travel app for **Practical Session 1** — Mobile Programming (D3 Informatics Engineering, Even Semester 2025/2026).

## Project Structure

```
lib/
├── app/
│   ├── controllers/
│   │   └── home_controller.dart         ← Business logic (complete)
│   ├── models/
│   │   └── destination.dart             ← Data model (complete)
│   ├── networking/
│   │   ├── api_service.dart             ← Base API service (Nylo boilerplate)
│   │   └── destination_api_service.dart ← ⚠ TODO file (D1) — destination image URLs
│   └── providers/                       ← App lifecycle providers (complete)
├── bootstrap/
│   ├── boot.dart                        ← App initialization
│   ├── decoders.dart                    ← Register controllers & API services
│   └── theme.dart                       ← Theme configuration
├── resources/
│   ├── pages/
│   │   ├── home_page.dart               ← ⚠ TODO file (A1)
│   │   └── destination_detail_page.dart ← ⚠ TODO file (C1–C2)
│   ├── themes/
│   │   └── light_theme.dart             ← Colors and typography (complete)
│   └── widgets/
│       └── destination_card.dart        ← ⚠ TODO file (B1–B5)
├── routes/
│   └── router.dart                      ← Route definitions (complete)
└── main.dart                            ← Entry point (complete)
```

## Getting Started

```bash
flutter pub get
flutter run
```

## Nylo Concepts Used

Before starting the TODOs, read the following sections in the Nylo documentation:

| Concept | Docs | Description |
|---------|------|-------------|
| Page & NyPage | [Pages](https://nylo.dev/en/docs/7.x/pages) | Every page extends `NyStatefulWidget` and `NyPage` |
| Controller | [Controllers](https://nylo.dev/en/docs/7.x/controllers) | `widget.controller` gives access to data and business logic |
| Navigation | [Router](https://nylo.dev/en/docs/7.x/router#navigating-to-pages) | Use `routeTo(Page.path)` to navigate between pages |
| Sending data | [Router – Passing data](https://nylo.dev/en/docs/7.x/router#passing-data-to-another-page) | `routeTo(Page.path, data: object)` |
| Receiving data | [Router – Passing data](https://nylo.dev/en/docs/7.x/router#passing-data-to-another-page) | `widget.data()` on the destination page |

---

## TODOs for Students

The app structure is already set up. Your only task is to fill in the **9 TODO items** marked in the code. Each comment in the code already shows you exactly what to write — just copy and adapt the hint.

> **Groups:** A = `home_page.dart`, B = `destination_card.dart`, C = `destination_detail_page.dart`, D = `home_controller.dart`

| TODO | File | What to Write |
|------|------|---------------|
| **A1** | `home_page.dart` | Call `setState()` inside `_filterByCategory()` to update `_selectedCategory` and `_allDestinations` |
| **B1** | `destination_card.dart` | One `Text` widget showing `destination.name` in white bold (featured card) |
| **B2** | `destination_card.dart` | One `Row` with a location icon + `destination.country` text (featured card) |
| **B3** | `destination_card.dart` | One `Text` widget showing `destination.name` in bold (list card) |
| **B4** | `destination_card.dart` | One `Row` with a location icon + `destination.country` text (list card) |
| **B5** | `destination_card.dart` | One `Row` with a star icon + `destination.rating` text (list card) |
| **C1** | `destination_detail_page.dart` | A title `Text('About')` and a description `Text(dest.description)` |
| **C2** | `destination_detail_page.dart` | An `ElevatedButton` that shows a `SnackBar` when pressed |
| **D1** | `destination_api_service.dart` | Replace each `imageUrl` string with a real photo URL from [unsplash.com](https://unsplash.com) |

> Everything else (navigation, layout) has already been implemented for you.

## Tips

- Read the comment above each `// TODO` — it shows the exact code to write.
- Run `flutter run` after each TODO to see the result immediately.
- If you see red errors, run `flutter pub get` first.
- `widget.data()` — how Nylo receives data sent from the previous page via `routeTo(..., data: ...)`. ([docs](https://nylo.dev/en/docs/7.x/router#passing-data-to-another-page))

---

## Submission

```bash
flutter analyze
git add .
git commit -m "Praktikum-01: Complete hello_travel UI — TODO A1, B1-B5, C1-C2, D1"
git push origin main
```
