# Chat Team App

This is a chat application developed using Flutter with Firebase integration. It supports both Android and iOS, providing a modern and smooth real-time communication experience. The project uses the Provider architecture for state management and Firebase for authentication, notifications, and data storage.

## Features

- **User Authentication**: The app includes built-in authentication checking, redirecting users to either the login screen or directly into the chat, depending on their status.
- **Real-Time Notifications**: Implementation of custom notifications through the `ChatNotificationService`, allowing users to receive real-time alerts for new messages.
- **Custom Theme**: The user interface is designed with Material 3 theme and a modern color scheme, offering a pleasant visual experience.
- **Complete Firebase Integration**: The app utilizes Firebase for backend management, authentication, and push notifications, with platform-specific configurations for iOS and Android.

## Technologies Used

- **Flutter**: Framework used for cross-platform development (Android and iOS).
- **Firebase**: Backend-as-a-Service for authentication and notifications.
- **Provider**: State management using the ChangeNotifier pattern.
- **Dart**: Programming language for building the app's logic.

## How to Run

1. Clone the repository:
   git clone https://github.com/bernardoxm/chat.git
2. Install the dependencies:
   flutter pub get
3. Run the app:
   flutter run

Make sure to correctly set up Firebase for your project by following the official documentation.

