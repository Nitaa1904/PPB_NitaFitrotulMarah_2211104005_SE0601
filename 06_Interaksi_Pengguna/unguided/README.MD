# Flutter Tourism App

A simple Flutter app with multi-page navigation and a form for user details, designed for quick access to home, tourism, and profile sections.

## Program Overview

1. **Navigation**:
   - The app has three pages accessed through a `BottomNavigationBar`:
     - **Home**: Includes a form for users to enter their **Name** and **Email**.
     - **Wisata**: Displays a placeholder for tourism information.
     - **Profil**: Displays a placeholder for profile information.

2. **Form on Home Page**:
   - **Name** and **Email** input fields with validation:
     - **Name** field cannot be empty.
     - **Email** requires a valid email format.
   - **Submit** button: Validates input and shows a confirmation `SnackBar` if the data is valid.

## UI Design

- **AppBar**: Custom blue color (`#0066CC`) with dynamic titles based on selected page.
- **Bottom Navigation**:
   - **Selected** item color: Light blue (`#0099FF`).
   - **Unselected** item color: Greyish blue (`#CCE5FF`).
- **Submit Button**: Blue color (`#0080FF`) with white text.

## Setup

1. Clone and navigate into the project:
   ```bash
   git clone https://github.com/yourusername/flutter-tourism-app.git
   cd flutter-tourism-app
2. Install dependencies:
    ```bash
    flutter pub get
3. Run the app:
    ```bash
    flutter run

This app uses google_fonts for a custom Poppins font on the AppBar title.

## Screenshots

### Home Page
<img src="Screenshot 2024-10-29 010404.png" alt="Home Page" width="300"/>

### Wisata Page
<img src="Screenshot 2024-10-29 010521.png" alt="Wisata Page" width="300"/>

### Profil Page
<img src="Screenshot 2024-10-29 010535.png" alt="Profil Page" width="300"/>

