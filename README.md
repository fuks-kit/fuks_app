# fuks_app

Goal of this project is to create a mobile application that informs interested students about fuks
e.V.

**Features:**

- [x] Display upcoming events
- [x] Display projects
- [x] Show Karlsruher Transfer magazines
- [x] Grant fuks e.V. members access to the office

## Project structure

```bash
.
├── CHANGELOG.md         # Changelog of the project
├── android              # Android specific files
├── assets               # Static assets like images, fonts, etc.
├── ios                  # iOS specific files
├── lib                  # All dart source code
│   ├── generated        # Code that was generated and shouldn't be touched!
│   ├── services         # Services providers, like the doorman-service, for UI components
│   ├── ui               # All User Interface components and Widgets
│   │   ├── pages        # All pages in the App
│   │   ├── theme        # Theme data like fonts, colors, shapes, etc.
│   │   └── widgets      # Widgets and dialogs that are shared across pages
│   └── utils            # Helper functions that are used across components
├── macos                # MacOS specific files
├── terms_and_conditions # Terms and conditions of the app
├── pubspec.yaml         # Project configuration

```

## Deploy a new release

Prepare a new release by following these steps:

1. Update flutter version to the newest version: `flutter upgrade`
2. Update the changelog in `CHANGELOG.md`
3. Update the version and build number in `pubspec.yaml`
4. Update version in `lib/ui/pages/settings/settings_page.dart`
5. Update dependencies
    1. Update flutter dependencies:`flutter pub upgrade`
    2. Update iOS dependencies: `cd ios && pod update && cd ..`
    3. Update Android dependencies: `cd android && ./gradlew app:dependencies && cd ..`
    4. Update MacOS dependencies: `cd macos && pod update && cd ..`
6. Push all changes to `main` branch with `git push`
7. Create a new git tag:
    1. `git tag -a vX.X.X -m "Release vX.X.X"`
    2. `git push origin vX.X.X`
8. Merge `main` branch into `release` branch on GitHub:
    1. Go to https://github.com/fuks-kit/fuks_app/tree/release
    2. Click on `This branch is ..., X commits behind main`
    3. Click on `Create pull request`
    4. Click on `Merge pull request`

### Upload a new Android release to the Play Store

```shell
# Pull the latest changes of the release branch
git pull origin release

# Make sure you are on the release branch
git checkout release

# Reset the branch to the latest commit
git reset --hard

# Clean up the build files
flutter clean

# Build the app bundle
flutter build appbundle

# Upload the generated app bundle to the Play Console
# 1. Go to https://play.google.com/console/
# 2. Select fuks app
# 3. Go to Release > App bundle explorer
# 4. Click on "Upload new version"
# 5. Select the generated app bundle

# Clean up the build files
flutter clean

# Go back to main branch after the release is done
git checkout main

```

### Upload a new iOS release to the App Store

A new release is automatically created when the `main` and `release` branches are merged. XCode
Cloud will automatically create a new release and upload the app to the App Store.

### Release a new iOS version

All iOS releases are managed through [App Store Connect](https://appstoreconnect.apple.com/). To
create a new release, follow these steps:

1. Check if the latest version build was successfully
    1. Go to Apps > fuks > Xcode Cloud
    2. Check if latest build was successful
2. To release the newest version to the public:
    1. Go to App Store > iOS Version
    2. Update version name
    3. (Optional) Update text and screenshots
    4. Scroll to Build and replace old version with new version
    5. Save and submit for review

After theses steps are completed, the new version will be available in the App Store within a few
hours.

> Note: If you don't have access to App Store Connect, conntact patrick.zierahn@fuks or
> joris.briegel@fuks.org.

## Terms and conditions

The app's terms and conditions are located in the `terms_and_conditions` folder. These terms and
conditions must be acknowledged and accepted by users prior to using the app. Similarly, users are
also required to accept the app's privacy policy. Additionally, both the terms and conditions and
the privacy policy are readily available through direct links in the App Store and Play Store.

The `terms_and_conditions` folder contains a firebase web app that can publish the terms and privacy
policy to the web. Updates the can be published by running `firebase deploy` in
the `terms_and_conditions` folder.