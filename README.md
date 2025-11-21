# Easacc Mobile Application  
A cross-platform Flutter application built with **Clean Architecture**,  
**Bloc/Cubit State Management**, **Supabase Authentication**, and  
**Bluetooth + WiFi scanning** for printer device discovery.

---

## 🚀 Features

- 🔐 Google Authentication (OAuth)
- 🔵 Facebook Authentication (OAuth)
- 🌐 WebView with dynamic URL (editable from settings)
- 🔵 Bluetooth Device Scanning (Printer Discovery)
- 📶 WiFi Network Scanning
- ⚙️ Settings with persistent storage (SharedPreferences)
- 🌗 Full Light + Dark mode support
- 💎 Clean Architecture (Domain, Data, Presentation layers)

---

# 🏛 Architecture Overview

The project follows **Clean Architecture + Bloc** for scalable, testable, maintainable code.
![image](https://github.com/user-attachments/assets/b4a2d07a-c7a1-487a-aecd-a1a406d234fa)

.
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


---
# Screenshots 
![photo_2025-11-22 01 56 53](https://github.com/user-attachments/assets/840a086a-6762-48ee-ac46-415e34a72bcc)
![photo_2025-11-22 01 56 52](https://github.com/user-attachments/assets/31fef7ce-3816-455d-a9f0-fe94e7051540)
![photo_2025-11-22 01 56 51](https://github.com/user-attachments/assets/f33ff433-a5b4-4c01-8577-857b03822ef8)
![photo_2025-11-22 01 56 50](https://github.com/user-attachments/assets/b32b6daa-4711-4422-9e8a-51616d42d534)
![photo_2025-11-22 01 56 48](https://github.com/user-attachments/assets/48628cc6-3aba-48dc-a31c-5bf79fadf039)
![photo_2025-11-22 01 56 47](https://github.com/user-attachments/assets/d33ff136-fdd3-4948-b2d6-887cfd2a7f9a)
![photo_2025-11-22 01 56 42](https://github.com/user-attachments/assets/0399d930-35d9-4031-ac95-73cc6d194ae9)

---

# 🧱 Clean Architecture Layers

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
- `cubit/` for settings (URL, scanning Bluetooth, scanning WiFi)  
- `widgets/` → modular components  
- `screens/` → UI screens

---

# 🔐 Authentication Flow (Google + Facebook using Supabase OAuth)

The app uses Supabase OAuth with deep-link redirection:

User taps Google/Facebook →
Supabase opens external browser →
User logs in →
Supabase redirects back (deep link) →
Supabase restores session →
auth.onAuthStateChange emits "signedIn" →
AuthBloc emits LoggedInAuthState →
Navigate to HomeScreen

markdown
Copy code

📎 **Deep Link Example**
com.karimelabasy.easacc://login-callback/

yaml
Copy code

---

# 📲 User Flows

## 1️⃣ Authentication Flow

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

yaml
Copy code

---

## 2️⃣ Home Screen Flow

Home Screen
└── WebView (loads saved URL)

yaml
Copy code

---

## 3️⃣ Settings Flow

Settings Screen
├── Edit WebView URL
├── Scan Bluetooth Devices (Printers)
├── Scan WiFi Networks
└── Select Preferred Devices

yaml
Copy code

---

# 🔵 Bluetooth Scanning

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

yaml
Copy code

---

# 📶 WiFi Scanning

### State fields:

isScanningWifi
wifiNetworks
selectedWifi


### Flow:

Scan WiFi →
Request Permission →
wifi_scan.startScan() →
getScannedResults() →
Emit updated state →
User selects preferred network

yaml
Copy code

---

# 🌗 Dark Mode / Light Mode

This project supports full dynamic theming using:

ThemeMode.system
ThemeMode.dark
ThemeMode.light

yaml
Copy code

---

# ⚙️ Technology Stack

| Feature | Technology |
|--------|------------|
| State Management | Bloc / Cubit |
| Authentication | Supabase OAuth |
| Storage | SharedPreferences |
| Device Discovery | FlutterBluePlus + wifi_scan |
| UI Framework | Flutter |
| Architecture | Clean Architecture |
| Deep Linking | Android Intent Filters / iOS URL Schemes |

---

# ✔ Getting Started

### Install dependencies:
flutter pub get


### Run App:
flutter run


---

# 🤝 Contributing

Pull requests and feature suggestions are welcome.

---

# 📄 License

MIT License © 2025 Karim Elabasy
