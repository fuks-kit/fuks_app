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

## Services

This app uses various services to provide data to the UI components. The services are located in
the `lib/services` folder. The services using [gRPC](https://grpc.io/) to communicate with the
backend. The gRPC services are generated automatically and can be found in the `lib/generated`.
**When the backend proto definitions changes, the gRPC services must be regenerated.** To regenerate
the gRPC services, please take a look at the specific repository of the backend service.

The backend implementation of these services can be found here:

* **[App Services](https://github.com/fuks-kit/app_services):** The app services fetch data from
  Google Workspace and provide it to the app.
* **[Doorman](https://github.com/fuks-kit/doorman)**: The doorman service connects the door system
  in the fuks office to open the door.

## Deploy a new release

To deploy a new release you need access to App Store Connect and Google Play Console. Patrick
Zierahn (patrick.zierahn@fuks.org) can grant you access to both.

### Prepare a new release

Prepare a new release by following these steps:

1. Update flutter version to the newest version: `flutter upgrade`
2. Update the changelog in `CHANGELOG.md`
3. Update the **version** and **build number** in `pubspec.yaml`
4. Update version in `lib/ui/pages/settings/settings_page.dart`
5. Update dependencies:
    1. Update flutter dependencies: `flutter pub upgrade`
    2. Update iOS dependencies: `cd ios && pod update && cd ..`
    3. Update Android dependencies: `cd android && ./gradlew app:dependencies && cd ..`
    4. Update MacOS dependencies: `cd macos && pod update && cd ..`
    5. Commit and push all changes: `git commit -am "Update dependencies"; git push`
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

1. Prepare android signing
    1. Download the `keystore.jks` and `key.properties` files from the fuks Google Drive
    2. Copy the files to the `android` folder
2. Pull the latest changes: `git pull origin release`
3. Make sure you are on the release branch: `git checkout release`
4. Reset the branch to the latest commit: `git reset --hard`
5. Clean up the build files: `flutter clean`
6. Build the app bundle: `flutter build appbundle`
7. Upload the generated app bundle to the Play Console
    1. Go to https://play.google.com/console/
    2. Select fuks app
    3. Go to Release > App bundle explorer
    4. Click on "Upload new version"
    5. Select the generated app bundle
8. Clean up the build files: `flutter clean`
9. Go back to main branch after the release is done: `git checkout main`

### Release a new Android version

All Android releases are managed through
the [Google Play Console](https://play.google.com/console/).
To create a new release, follow these steps:

1. Check if the latest version build was successfully
    1. Go to Release > App bundle explorer
    2. Check if latest build was successful
2. To release the newest version to the beta:
    1. Go to Testing > Internal testing
    2. Click on "Edit release"
    3. Click on "Add from library"
    4. Select the newest version
    5. Update the release notes
    6. Click on "Next" and "Save and Publish"

### Upload a new iOS release to the App Store

A new release is automatically created when the `main` and `release` branches are merged. XCode
Cloud will automatically create a new release and upload the app to the App Store. Beta testers will
receive an email with a link to the new version. The new version will be available in the App Store
within a few hours.

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

## Terms and conditions

The app's terms and conditions are located in the `terms_and_conditions` folder. These terms and
conditions must be acknowledged and accepted by users prior to using the app. Similarly, users are
also required to accept the app's privacy policy. Additionally, both the terms and conditions and
the privacy policy are readily available through direct links in the App Store and Play Store.

The `terms_and_conditions` folder contains a firebase web app that can publish the terms and privacy
policy to the web. Updates the can be published by running `firebase deploy` in
the `terms_and_conditions` folder.