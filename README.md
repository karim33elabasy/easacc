# Easacc Mobile Application  
A cross-platform Flutter application built with **Clean Architecture**,  
**Bloc/Cubit State Management**, **Supabase Authentication**, and  
**Bluetooth canning** for device discovery.

---

## Features

- Google Authentication (OAuth)
- Facebook Authentication (OAuth)
- WebView with dynamic URL (editable from settings)
- Bluetooth Device Scanning (Printer Discovery)
- Settings with persistent storage (SharedPreferences)
- Full Light + Dark mode support
- Clean Architecture (Domain, Data, Presentation layers)

---

# Architecture Overview

The project follows **Clean Architecture + Bloc** for scalable, testable, maintainable code.
![image](https://github.com/user-attachments/assets/b4a2d07a-c7a1-487a-aecd-a1a406d234fa)

```
├── app.dart
├── app_providers.dart
├── core
│   ├── constants
│   │   ├── app_colors.dart
│   │   ├── my_padding.dart
│   │   └── sizes.dart
│   ├── failure
│   │   └── failure.dart
│   ├── themes
│   │   ├── my_theme.dart
│   │   └── widget_themes
│   ├── usecases
│   │   ├── main_usecase.dart
│   │   └── no_params.dart
│   ├── utils
│   │   ├── app_routes.dart
│   │   ├── services_locator.dart
│   │   └── shared_pref_services.dart
│   ├── validators_and_helpers
│   │   ├── date_time_formatter.dart
│   │   ├── helper_methods.dart
│   │   └── validation.dart
│   ├── variables_and_enums
│   │   ├── enum_as_string.dart
│   │   ├── enums.dart
│   │   └── shared_pref_variables.dart
│   └── widgets
│       ├── app_icon_button.dart
│       ├── app_logo.dart
│       ├── app_scaffold.dart
│       ├── dialogs
│       ├── my_button.dart
│       ├── side_menu.dart
│       ├── snack_bar_services.dart
│       └── snack_bars
├── features
│   ├── authentication
│   │   ├── data
│   │   ├── domain
│   │   └── presentation
│   └── home
│       └── presentation
└── main.dart
```

---
# Screenshots

<p align="center">
  <img src="https://github.com/user-attachments/assets/28278f95-14c3-4864-acbb-2c5d58e0fa64" width="300" style="margin: 10px;" />
  <img src="https://github.com/user-attachments/assets/cc60eb62-1325-4980-8d17-d90368c1503b" width="300" style="margin: 10px;" />
  <img src="https://github.com/user-attachments/assets/d5d8463c-1dc0-463a-9f25-80f5b9cf4839" width="300" style="margin: 10px;" />
  <img src="https://github.com/user-attachments/assets/5f0d3b2d-f8d3-47d1-b66b-43ff0492b8ca" width="300" style="margin: 10px;" />
  <img src="https://github.com/user-attachments/assets/5867227f-8509-4a60-8758-5f0f778ef03f" width="300" style="margin: 10px;" />
  <img src="https://github.com/user-attachments/assets/6550739e-a37a-421b-b024-5150e601be5d" width="300" style="margin: 10px;" />
  <img src="https://github.com/user-attachments/assets/8727b462-b11a-44cc-8975-c3a8cf7c4c38" width="300" style="margin: 10px;" />
  <img src="https://github.com/user-attachments/assets/6cf10597-726b-4521-a2b3-2c034489be72" width="300" style="margin: 10px;" />
  <img src="https://github.com/user-attachments/assets/6f73c21a-5a5c-453e-aedf-e65c67c4b6be" width="300" style="margin: 10px;" />
  <img src="https://github.com/user-attachments/assets/bb6e6303-44aa-47b4-9218-d140f506d242" width="300" style="margin: 10px;" />
</p>



---

# Clean Architecture Layers

### **1. Data Layer**
- `datasources/` → Supabase Auth Data Source  
- `models/` → Convert JSON ↔ Entities  
- `repositories_impl/` → Implements Domain repositories

### **2. Domain Layer**
- `entities/` → Pure business objects  
- `repositories/` → Abstract contracts  
- `usecases/` → Contain one single responsibility

### **3. Presentation Layer**
- `bloc/` for authentication  
- `cubit/` for settings (URL, scanning Bluetooth)  
- `widgets/` → modular components  
- `screens/` → UI screens

---

# Authentication Flow (Google + Facebook using Supabase OAuth)

The app uses Supabase OAuth with deep-link redirection:

User taps Google/Facebook →
Supabase opens external browser →
User logs in →
Supabase redirects back (deep link) →
Supabase restores session →
auth.onAuthStateChange emits "signedIn" →
AuthBloc emits LoggedInAuthState →
Navigate to HomeScreen


**Deep Link Example**
com.karimelabasy.easacc://login-callback/


---

# User Flows

## Authentication Flow

Auth Screen
├── Google Login
└── Facebook Login
↓
External Browser Login
↓
Deep Link Callback
↓
AuthBloc detects signedIn
↓
Home Screen


---

## Home Screen Flow

Home Screen
└── WebView (loads saved URL)


---

## Settings Flow

Settings Screen
├── Edit WebView URL
├── Scan Bluetooth Devices (Printers)
└── Select Preferred Devices


---

# Bluetooth Scanning

### State fields:

isScanningBluetooth
bluetoothDevices
selectedBluetoothDevice


### Flow:

Scan Button Pressed →
Request Permission →
Bluetooth ON? →
Start Scan →
Stream scanResults →
Update Cubit State →
Stop scan after timeout


---

# Dark Mode / Light Mode

This project supports full dynamic theming using:

ThemeMode.system
ThemeMode.dark
ThemeMode.light


---

# ⚙️ Technology Stack

| Feature | Technology |
|--------|------------|
| State Management | Bloc / Cubit |
| Authentication | Supabase OAuth |
| Storage | SharedPreferences |
| Device Discovery | FlutterBluePlus |
| UI Framework | Flutter |
| Architecture | Clean Architecture |
| Deep Linking | Android Intent Filters / iOS URL Schemes |

---

# Getting Started

### Install dependencies:
flutter pub get


### Run App:
flutter run


---

# Contributing

Pull requests and feature suggestions are welcome.

---

# License

MIT License © 2025 Karim Elabasy
