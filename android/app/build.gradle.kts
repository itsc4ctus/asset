plugins {
    id("com.android.application")
    id("com.google.gms.google-services") // Firebase integration
    id("kotlin-android")
    id("dev.flutter.flutter-gradle-plugin") // Flutter Gradle plugin
}

android {
    namespace = "com.cactus.asset.asset"
    compileSdk = flutter.compileSdkVersion
    ndkVersion = "27.0.12077973" // NDK version

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_11
        targetCompatibility = JavaVersion.VERSION_11
    }

    kotlinOptions {
        jvmTarget = JavaVersion.VERSION_11.toString()
    }

    defaultConfig {
        applicationId = "com.cactus.asset.asset" // Your app's unique ID
        minSdk = 23 // Minimum SDK version
        targetSdk = 33 // Target SDK version
        versionCode = flutter.versionCode // Version code from Flutter
        versionName = flutter.versionName // Version name from Flutter
    }

    buildTypes {
        release {
            // TODO: Add your own signing config for the release build.
            // Signing with the debug keys for now, so `flutter run --release` works.
            signingConfig = signingConfigs.getByName("debug")
        }
    }

    buildFeatures {
        viewBinding = true // Corrected View Binding configuration
    }
}

flutter {
    source = "../.." // Path to your Flutter source code
}
