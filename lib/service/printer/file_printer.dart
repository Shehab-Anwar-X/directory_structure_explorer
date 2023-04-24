import 'dart:io';
import 'i_printer.dart';

/// Implement the FilePrinter class that implements the IPrinter interface
/// and prints the contents of a file.
class FilePrinter implements IPrinter {
  /// A boolean variable that determines whether symbols should be shown or not
  final bool shouldShowSymbols;

  /// Constructor that takes in the value of shouldShowSymbols
  FilePrinter({required this.shouldShowSymbols});

  @override
  String printFileSystemEntity(FileSystemEntity entity, String prefix) {
    // Cast the entity to a file and get the file name
    final file = entity as File;
    final fileName = file.path.split(Platform.pathSeparator).last;
    const color = '\u001b[31m'; // Set the color to red
    const resetColor = '\u001b[0m';

    // Choose the symbol to print based on whether shouldShowSymbols is set.
    final symbolOrSpace = shouldShowSymbols ? '+ ' : '';
    final line = '$prefix├── $color$symbolOrSpace$resetColor$fileName\n';

    return line;
  }
}
