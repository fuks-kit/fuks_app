# fuks_app

The official fuks app

## Project structure

```bash
lib                           # All dart source code
├── generated                 # Code that was generated and shouldn't be touched!
├── services                  # Services providers, like the doorman-service, for UI components
├── ui                        # All User Interface components and Widgets
│   ├── pages                 # All pages in the App
│   ├── theme                 # Theme data like fonts, colors, shapes, etc.
│   └── widgets               # Widgets and dialogs that are shared across pages
└── utils                     # Helper functions that are used across components
```

## Prepare a new release

1. Update the version and build number in `pubspec.yaml`
2. Update version in `lib/ui/pages/settings/settings_page.dart`
3. Create a new git tag:
    1. `git tag -a v1.0.0 -m "Release v1.0.0"`
    2. `git push origin v1.0.0`
4. Merge `main` branch into `release` branch