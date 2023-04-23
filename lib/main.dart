import 'dart:io';
import 'printer/directory_printer.dart';
import 'package:flutter/foundation.dart';
import 'directory_traversal/directory_traversal.dart';

const path = 'C:/Users/sheha/StudioProjects/design_patterns/lib';

void main() {
  final directory = Directory(path);

  final traversal = DirectoryTraversal(
    root: directory,
    printer: const DirectoryPrinter(shouldShowSymbols: false),
  );

  final text = traversal.traverseDirectory().trimRight();

  if (kDebugMode) {
    print('\n$text');
  }
}
