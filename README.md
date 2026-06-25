# Flutter Application Setup Guide

This guide will walk you through setting up your local environment configuration and running the application.

## Prerequisites

Before running the application, ensure you have the following installed on your machine:

* **Flutter SDK** (Ensure it matches the version specified in your `pubspec.yaml`)
* **Dart SDK** (Bundled with Flutter)
* An Android/iOS Emulator or physical device connected for debugging

---

## 🛠️ Installation Steps

### 1. Environment Configuration

The application relies on environment variables for API configuration and debugging flags.

Create a file named `.env` in the root directory of the project (at the same level as `pubspec.yaml`) and paste the following configuration values:

```env
SHOW_DEBUG_INFO=false
API_ENDPOINT='https://rickandmortyapi.com/api'

```

> **Note:** Ensure `.env` is included in your `.gitignore` file to avoid exposing environment properties or internal API endpoints to your remote repository.

### 2. Fetch Project Dependencies

Open your terminal in the project root directory and download all the required Flutter packages by running:

```bash
flutter pub get

```

### 3. Generate Code Files (Build Runner)

This project utilizes code generation packages (such as Freezed, Injectable, or Retrofit). Run the following command to generate the necessary underlying files and strip out any conflicting schemas:

```bash
dart run build_runner build --delete-conflicting-outputs

```

---

## 🚀 Running the Application

Once your code generation is successful and dependencies are locked in, you can launch the application.

### Running via Command Line

Execute the standard run target in your terminal:

```bash
flutter run

```

### Alternative: Specifying Target Targets

If you have multiple devices connected, verify your target device ID using `flutter devices` and execute targeting a specific engine:

```bash
flutter run -d <DEVICE_ID>

```