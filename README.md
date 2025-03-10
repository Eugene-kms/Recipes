# Recipe App

## Overview



Recipe App is an iOS application that allows users to browse, search, and bookmark their favorite recipes. This project was developed as part of a tutorial series to demonstrate modern iOS development practices, including MVVM-C architecture, Clean Architecture principles, and the use of popular third-party libraries.

<img src="https://github.com/user-attachments/assets/66adee9d-36d0-42cc-a64c-e348dac8fdda" width="375">
<img src="https://github.com/user-attachments/assets/f0d5c20b-bc36-4010-a4d4-301e1626f27e" width="375">

## Architecture

The app is built using a combination of MVVM-C (Model-View-ViewModel-Coordinator) and Clean Architecture principles:

- **MVVM-C**: Separates the presentation logic into View Models and uses Coordinators for navigation.
- **Clean Architecture**: Divides the app into layers (Presentation, Domain, and Data) for better separation of concerns.

### Layers

1. **Presentation Layer**: Contains the UI components (Views), ViewModels, and Coordinators.
2. **Domain Layer**: Contains the business logic, including entities and use cases (if applicable).
3. **Data Layer**: Manages data operations, including networking and local storage.

## Additional features

- Unit Tests with XCTest
- Programmatic UI
- Networking Layer
- Localization support

## Technologies

- Swift 5.5+
- UIKit
- [SDWebImage](https://github.com/SDWebImage/SDWebImage): For efficient image loading and caching
- [SnapKit](https://github.com/SnapKit/SnapKit): For programmatic Auto Layout
- Swift Package Manager (SPM): For dependency management

## Getting Started

### Prerequisites

- Xcode 13.0+
- iOS 15.0+

### Installation

1. Clone the repository:
```
git clone https://github.com/yourusername/recipe-app.git
```
2. Open `RecipeApp.xcodeproj` in Xcode.
3. Build and run the project on your simulator or device.

## Project Structure
<img width="329" alt="Screenshot 2024-09-30 at 17 16 29" src="https://github.com/user-attachments/assets/f62bd6cf-ac6a-4eea-85d4-cd95d89760e2">

## UI/UX

The app follows iOS Human Interface Guidelines and includes the following main screens:

1. **Home Screen**: Displays a list of recipes and includes a search bar.
2. **Recipe Detail Screen**: Shows detailed information about a selected recipe.
3. **Bookmarks Screen**: Lists all bookmarked recipes.

Navigation is handled through a tab bar interface, allowing easy access to the Home and Bookmarks screens.

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details.
