import 'dart:io';

import 'package:clipboard/clipboard.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

import '../directory_traversal/directory_traversal.dart';
import '../printer/directory_printer.dart';

abstract class FilePickerScreenService {
  const FilePickerScreenService._();

  static Future<String?> pickFolder() {
    return FilePicker.platform.getDirectoryPath();
  }

  static String structureFiles({required String path}) {
    return DirectoryTraversal(
      root: Directory(path),
      printer: const DirectoryPrinter(shouldShowSymbols: false),
    ).traverseDirectory().trimRight();
  }

  static Future<void> saveFilesStructureToClipboard({
    required BuildContext context,
    required String path,
  }) async {
    FlutterClipboard.copy(structureFiles(path: path));
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Copied Successfully'),
      ),
    );
  }
}
