import 'dart:io';
import 'package:path/path.dart' as p;
import 'i_printer.dart';

/// DirectoryPrinter class that implements the Printer interface and prints the contents of a directory.
class DirectoryPrinter implements IPrinter {
  /// A boolean value that indicates whether symbols should be shown or not.
  final bool shouldShowSymbols;

  /// Constructor for the DirectoryPrinter class.
  const DirectoryPrinter({required this.shouldShowSymbols});

  /// Prints the contents of a directory.
  @override
  String printFileSystemEntity(FileSystemEntity entity, String prefix) {
    // Cast the entity to a directory and get the list of files in it.
    final directory = entity as Directory;
    final files = directory.listSync();

    var text = '';

    // Loop through each file and print it with a prefix.
    for (var i = 0; i < files.length; i++) {
      final file = files[i];
      final isLast = i == files.length - 1;
      final fileName = file.path.split(Platform.pathSeparator).last;
      final isDirectory = file is Directory;

      // Choose the symbol to print based on whether the file is a directory or not and whether shouldShowSymbols is set.
      final symbol = isDirectory && shouldShowSymbols ? '>' : '+';

      // Set the color based on whether the file is a directory or not
      // final color = isDirectory ? '\u001b[32m' : '\u001b[31m';

      // Set reset color to ensure no color spillage to subsequent console outputs
      // const resetColor = '\u001b[0m';

      // Add a symbol or space based on whether shouldShowSymbols is set.
      final symbolOrSpace = shouldShowSymbols ? '$symbol ' : '';

      // Remove the current directory from the prefix so that it's not printed for each line
      final linePrefix = prefix.replaceAll(p.basename(directory.path), '');

      // Construct the line to be printed with appropriate formatting
      // final line = '$linePrefix${isLast ? '└── ' : '├── '}$color$symbolOrSpace$resetColor${isDirectory ? '$fileName/' : fileName}\n';
      final line =
          '$linePrefix${isLast ? '└── ' : '├── '}$symbolOrSpace${isDirectory ? '$fileName/' : fileName}\n';

      text += line;

      // If the file is a directory, print its contents with an indented prefix.
      if (isDirectory) {
        final childPrefix =
            '$prefix${isLast ? '    ' : '│   '}${shouldShowSymbols ? ' ' : ''}';
        final childDirName = p.basename(file.path);

        // Create a new DirectoryPrinter instance to print the child directory.
        final printer = DirectoryPrinter(shouldShowSymbols: shouldShowSymbols);
        text += printer.printFileSystemEntity(
            file, childPrefix.replaceAll(childDirName, ''));
      }
    }

    return text;
  }
}
