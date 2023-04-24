import 'dart:io';

/// The Printer class is an abstract class that provides the
/// printFileSystemEntity method to be implemented by subclasses for printing
/// the file system entities.
abstract class IPrinter {
  /// Private constructor to prevent getting an instance from this interface.
  const IPrinter._();

  /// This method is used to print the file system entity and takes two arguments:
  ///
  /// entity: a [FileSystemEntity] that represents the file system entity.
  ///
  /// prefix: a [String] that represents the prefix to be printed before the file system entity.
  ///
  /// This method returns a [String] that represents the text output of the file system entity.
  String printFileSystemEntity(FileSystemEntity entity, String prefix);
}
