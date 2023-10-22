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

## Deploy a new release

Prepare a new release by following these steps:

1. Update the changelog in `CHANGELOG.md`
2. Update the version and build number in `pubspec.yaml`
3. Update version in `lib/ui/pages/settings/settings_page.dart`
4. Update dependencies with `flutter pub upgrade`
5. Push all changes to `main` branch with `git push`
6. Create a new git tag:
    1. `git tag -a vX.X.X -m "Release vX.X.X"`
    2. `git push origin vX.X.X`
7. Merge `main` branch into `release` branch

### Deploy a new Android release

```shell
# Pull the latest changes
git pull

# Make sure you are on the release branch
git checkout release

# Reset the branch to the latest commit
git reset --hard

# Clean up the build files
flutter clean

# Build the app bundle
flutter build appbundle

# Upload the generated app bundle to the Play Console
# https://play.google.com/console/

# Clean up the build files
flutter clean

# Go back to main branch after the release is done
git checkout main

```

### Deploy a new iOS release

A new release is automatically created when the `main` and `release` branches are merged. XCode
Cloud will automatically create a new release and upload the app to the App Store.
