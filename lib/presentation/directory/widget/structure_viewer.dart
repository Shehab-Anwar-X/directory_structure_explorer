import 'package:flutter/material.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_highlight/theme_map.dart';

class StructureViewerWidget extends StatelessWidget {
  const StructureViewerWidget({required String structureFiles, Key? key})
      : _structureFiles = structureFiles,
        super(key: key);

  final String _structureFiles;

  @override
  Widget build(BuildContext context) {
    final themeIndex = themeMap.keys.toList().indexOf('monokai-sublime');
    return ClipRRect(
      borderRadius: BorderRadius.circular(8.0),
      child: HighlightView(
        _structureFiles,
        language: 'json',
        theme: themeMap.values.toList()[themeIndex],
        padding: const EdgeInsets.all(12.0),
        textStyle: const TextStyle(fontSize: 16.0),
      ),
    );
  }
}
