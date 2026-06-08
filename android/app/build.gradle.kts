plugins {
    id("com.android.application")
    id("dev.flutter.flutter-gradle-plugin")
}

android {
    namespace = "com.example.flutter_nexgen_events"
    compileSdk = 36

    defaultConfig {
        applicationId = "com.example.flutter_nexgen_events"
        minSdk = flutter.minSdkVersion
        targetSdk = 36
        versionCode = flutter.versionCode
        versionName = flutter.versionName
    }

    buildTypes {
        release {
            signingConfig = signingConfigs.getByName("debug")
        }
    }

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_17
        targetCompatibility = JavaVersion.VERSION_17
    }
}

kotlin {
    compilerOptions {
        jvmTarget = org.jetbrains.kotlin.gradle.dsl.JvmTarget.JVM_17
    }
}

flutter {
    source = "../.."
}

subprojects {
    afterEvaluate {
        extensions.findByType(com.android.build.gradle.BaseExtension::class.java)?.apply {
            compileSdkVersion(36)

            // ✅ Patch pour flutter_inappwebview : remplace l'ancienne règle Proguard
            if (name.contains("flutter_inappwebview")) {
                buildTypes.all {
                    proguardFiles(
                        getDefaultProguardFile("proguard-android-optimize.txt")
                    )
                }
            }
        }
    }
}