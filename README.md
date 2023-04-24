# Directory Picker and Structure Viewer

This is a Dart application that allows the user to select a directory and copy its files structure
to the clipboard.

The application provides a directory picker button that opens a file picker dialog where the user
can select a directory. Once the directory is selected, the application displays its path and its
files structure in a tree view.

The file structure viewer is based on the `flutter_highlight` library, which provides syntax
highlighting for JSON format.

The application is implemented using Flutter and Dart programming languages. It uses
the `file_picker` library to open the file picker dialog and the `clipboard` library to copy the
files structure to the clipboard.

## Usage

To use this application, you can run it on an emulator or a physical device. The application has a
single screen that shows the directory picker button and the files structure viewer.

1. Click on the directory picker button to open the file picker dialog.
2. Select a directory from the file picker dialog.
3. The application will display the directory path and its files structure in the tree view.
4. Click on the `Copy Files Structure` button to copy the files structure to the clipboard.

## Screenshot

![Directory Picker screen in Windows](/screenshot/windows/directory_picker_screen.png)
![Pick the directory path in Windows](/screenshot/windows/pick_directory_path.png)
![Directory Picker screen in Android](/screenshot/android/directory_picker_screen.jpg)

## Installation

To install and run this application, you need to have Flutter and Dart SDKs installed on your
system.

1. Clone this repository to your local machine using `git clone`.
2. Open the cloned directory in your preferred editor.
3. Run `flutter pub get` to download the required dependencies.
4. Run `flutter run` to launch the application.

#### Or download the application directly from the installer file It contains an application version for Android and Windows

[Windows](/installer/Directory%20Structure%20Explorer.exe)
[Android](/installer/android.apk) 