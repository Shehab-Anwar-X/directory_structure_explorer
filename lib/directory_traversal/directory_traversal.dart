import 'dart:io';
import '../printer/i_printer.dart';

/// The DirectoryTraversal class provides a mechanism for traversing a directory
/// and printing its contents using a specified printer.
class DirectoryTraversal {
  /// The root directory to traverse.
  final Directory root;

  /// The printer used to print the file system entities.
  final IPrinter printer;

  /// Creates an instance of DirectoryTraversal.
  DirectoryTraversal({
    required this.root,
    required this.printer,
  });

  /// Traverses the specified directory and prints its contents.
  String traverseDirectory() {
    return printer.printFileSystemEntity(root, '');
  }
}
