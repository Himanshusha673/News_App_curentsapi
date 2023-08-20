INSTRUCTIONS :

Prerequisites:

Flutter SDK: Make sure you have Flutter SDK installed on your machine. You can download it from the official Flutter website: Flutter Downloads Building the App

Clone the repository: git clone https://github.com/Himanshusha673/News_App_curentsapi.git Navigate to the project directory:

cd your-repository Install dependencies:

flutter pub get Connect a device or start an emulator:

For Building Applcation: Connect a physical device to your computer using a USB cable, or Start an Android or iOS emulator. Build and run the app:

For Android: flutter run

For iOS: flutter run --device-id your_device_id Replace your_device_id with the ID of the connected iOS device or simulator.

###########################
I have developed a news app that integrates the Current API for fetching news articles and the Reqres API for authentication. Here's an overview of the app's features and components:

## News App with Authentication

### Overview

This Flutter news app fetches news articles using the Current API and supports user authentication through the Reqres API. It follows the MVVM architecture pattern for fetching and managing API data.

### Authentication

- Users can log in using the provided email and password:
  - Email: eve.holt@reqres.in
  - Password: cityslicka

### Home Screen

- The Home Screen is the main screen of the app where users can explore the latest news articles.
- The top app bar contains options for logout, viewing bookmarked articles, and toggling between dark and light themes.
- News articles are displayed in a scrollable list using a PageView.
- Users can swipe left and right to view different news articles.

### Search Bar

- A search bar is available at the top of the Home Screen for users to search for specific news articles.
- Users can enter keywords to search for relevant news articles.

### Category Bar

- The Category Bar displays different news categories that users can filter by.
- Users can tap on a category to view news articles specific to that category.

### News Cards

- News articles are presented as cards with a title, image, category, and a short description.
- Users can tap on a news card to expand and view the full description.
- Tapping the "Read More" link reveals the complete article description.

### Bookmarks

- Users can bookmark news articles for later reference.
- Bookmarked articles are stored using the Hive local database.
- The bookmark status of articles is indicated by an icon on the news cards.

### Responsive UI

- The app's UI is designed to be responsive and adapt to different screen sizes.
- Elements like buttons, fonts, and image sizes adjust based on the device's screen dimensions.

## Setup and Usage

1. Clone the repository.
2. Ensure you have Flutter and Dart installed on your machine.
3. Run `flutter pub get` in the project directory to install the dependencies.
4. Connect to the internet to fetch news articles from the Current API.
5. Navigate to the `lib` directory and update the code based on the provided code snippets.
6. Replace the `newsData.image.toString()` with the actual URL of news article images.
7. Run the app using `flutter run`.

## Notes

- The app follows the MVVM architecture pattern for efficient data management.
- "Provider" is used as the state management solution.
- Hive is used to locally store bookmarked news articles.
- The UI is designed to be responsive using the `MediaQuery` to adapt to various screen sizes.

Feel free to explore the code and customize the app to your preferences. If you encounter any issues or have questions, please don't hesitate to ask.



Testing the App: To run the tests for the app, use the following command: flutter test

Additional Configuration: You can customize certain aspects of the app by modifying the relevant configuration files or variables. Refer to the project documentation for more details. That's it! Users can follow these instructions to successfully build, run, and test your Flutter app. Make sure to replace "your-username" and "your-repository" in the clone command with your actual GitHub username and repository name.

Youfor creating the released apk run following command: flutter build apk --split-per-abi --release --no shrink

This command will generate a release APK for all supported ABIs (Application Binary Interfaces) without code shrinking. The --split-per-abi flag ensures that separate APKs are generated for different ABIs, optimizing the APK size for each specific device architecture.