INSTRUCTIONS :

Prerequisites:

Flutter SDK: Make sure you have Flutter SDK installed on your machine. You can download it from the official Flutter website: Flutter Downloads Building the App

Clone the repository: git clone https://github.com/Himanshusha673/News_App_curentsapi.git Navigate to the project directory:

cd your-repository Install dependencies:

flutter pub get Connect a device or start an emulator:

For Building Applcation: Connect a physical device to your computer using a USB cable, or Start an Android or iOS emulator. Build and run the app:

For Android: flutter run

For iOS: flutter run --device-id your_device_id Replace your_device_id with the ID of the connected iOS device or simulator.


I have created a news App using current Api and auth for reqres.in

You can Login through email- eve.holt@reqres.in
and password- cityslicka












Testing the App: To run the tests for the app, use the following command: flutter test

Additional Configuration: You can customize certain aspects of the app by modifying the relevant configuration files or variables. Refer to the project documentation for more details. That's it! Users can follow these instructions to successfully build, run, and test your Flutter app. Make sure to replace "your-username" and "your-repository" in the clone command with your actual GitHub username and repository name.

Youfor creating the released apk run following command: flutter build apk --split-per-abi --release --no shrink

This command will generate a release APK for all supported ABIs (Application Binary Interfaces) without code shrinking. The --split-per-abi flag ensures that separate APKs are generated for different ABIs, optimizing the APK size for each specific device architecture.