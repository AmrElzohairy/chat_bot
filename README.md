# 🧠 Chat Bot App - Flutter

A modern, secure, and beautifully designed Flutter-based AI Chat application that allows users to interact with AI, manage chat sessions, and personalize their experience. Built following clean architecture principles, robust state management, and fully responsive UI for all devices.

---

## ✨ Features

- 🚀 Onboarding Flow
- 🔐 Sign In / Sign Up Authentication
- 💬 Chat with AI Interface
- 💾 Saved Sessions Screen
- 👤 Profile Management
- 📜 Privacy Policy Page
- 📱 Responsive Design for All Devices

---

## 🧰 Tech Stack

### 📦 Flutter Packages & Tools

| Package | Description |
|--------|-------------|
| `dio` | For API networking |
| `shared_preferences` | Lightweight local storage for user preferences |
| `flutter_secure_storage` | Secure storage for sensitive data like tokens |
| `flutter_bloc` | State management using Bloc and Cubit |
| `get_it` | Dependency injection container |
| `go_router` | Declarative routing with deep linking support |
| `flutter_screenutil` | Responsive UI design utility |
| `flutter_native_splash` | Native splash screen support |
| `flutter_launcher_icons` | Custom launcher icon generation |

---

## 🏗️ Architecture

This app follows the **Clean Architecture** pattern:

- **Presentation Layer** – Flutter UI, BLoC/Cubit for state management  
- **Domain Layer** – Business logic and use cases  
- **Data Layer** – Dio for API communication, secure/local storage  

---

## 🔐 Security

- Authentication tokens are stored securely using `flutter_secure_storage`
- Non-sensitive data like flags and preferences use `shared_preferences`

---

## 📸 Screenshots

### 🔥 Light Mode

| Splash | Onboarding | Sign Up |
|-------|------------|---------|
| ![splash_light](https://github.com/user-attachments/assets/605ba7ea-2a9e-45c3-94da-1ecf687ae7fd) | ![onboarding_light](https://github.com/user-attachments/assets/88d18eb0-e4ff-4d41-b8b8-0003467bdd7e) | ![sign_up_light](https://github.com/user-attachments/assets/2db72984-cd4f-4070-a0cc-21babcec4062) |

| Sign In | Chat Screen | Saved Sessions |
|--------|-------------|----------------|
| ![sign_in_light](https://github.com/user-attachments/assets/5bd5f1a0-0b60-4e0b-b7ca-ccf94899a3b0) | ![chat_light](https://github.com/user-attachments/assets/569bc261-e651-4338-afc0-90c65aab6ac4) | ![saved_sesions_light](https://github.com/user-attachments/assets/e0fea7bd-2e31-4001-b80a-ff016e74dfed) |

| Profile | Privacy Policy | AI Bot |
|--------|----------------|--------|
| ![profile_light](https://github.com/user-attachments/assets/42087ff2-697f-4006-b65c-e57153680ce9) | ![privacy_policy_light](https://github.com/user-attachments/assets/fd54a040-6d12-49e3-8a59-42756c22af6a) | ![bot_image_light](https://github.com/user-attachments/assets/ecf23ac5-d6bf-4c97-b38b-e7100225b1fb) |

---

### 🌙 Dark Mode

| Splash | Onboarding | Sign Up |
|-------|------------|---------|
| ![splash_dark](https://github.com/user-attachments/assets/46b30f3d-a088-40b7-bec1-bed81d1abb31) | ![onboarding_dark](https://github.com/user-attachments/assets/75308469-6395-496c-a575-65880a8c9882) | ![sign_up_dark](https://github.com/user-attachments/assets/c751e9e4-a41b-483d-b09a-3afabec801b0) |

| Sign In | Chat Screen | Saved Sessions |
|--------|-------------|----------------|
| ![sign_in_dark](https://github.com/user-attachments/assets/554910d6-a2b4-4ed1-adfe-3550a6823e57) | ![chat_dark](https://github.com/user-attachments/assets/e5cd2cad-18e6-49df-ba97-bcc171c9b505) | ![saved_sesions_dark](https://github.com/user-attachments/assets/5273c056-b328-4921-a916-eff980a9aea3) |

| Profile | Privacy Policy | AI Bot |
|--------|----------------|--------|
| ![profile_dark](https://github.com/user-attachments/assets/80a499cb-e55f-47d4-ba33-279801daae01) | ![privacy_policy_dark](https://github.com/user-attachments/assets/2189386f-5fb7-4349-8c75-599c5fa8d002) | ![bot_image_dark](https://github.com/user-attachments/assets/75e0f3b9-2979-4475-a575-bf47638b0cc5) |

---

## 🚧 Coming Soon

- 🔔 Push Notifications  
- 📊 Session Insights & Chat Stats  
- 🌐 Multi-language Support

---

> 💡 Feel free to fork, clone, and contribute!  
> Made with using Flutter ❤️.
