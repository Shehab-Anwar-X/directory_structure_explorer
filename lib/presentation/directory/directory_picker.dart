import 'package:flutter/material.dart';
import '../../service/file_picker_screen/file_picker_screen_service.dart';
import 'widget/directory_picker_btn.dart';
import 'widget/path_field.dart';
import 'widget/structure_viewer.dart';

class DirectoryPickerView extends StatefulWidget {
  const DirectoryPickerView({Key? key}) : super(key: key);
  static const routeName = '/directory-picker';

  @override
  State<DirectoryPickerView> createState() => _DirectoryPickerViewState();
}

class _DirectoryPickerViewState extends State<DirectoryPickerView> {
  final _directoryController = TextEditingController();

  Future<void> _pickFolder() async {
    final directoryPath = await FilePickerScreenService.pickFolder();
    if (directoryPath != null) {
      _directoryController.text = directoryPath;
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: _directoryController.text.isEmpty
          ? null
          : FloatingActionButton.extended(
              label: const Text('Copy Files Structure'),
              onPressed: () {
                FilePickerScreenService.saveFilesStructureToClipboard(
                  context: context,
                  path: _directoryController.text,
                );
              },
            ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            const SizedBox(height: 70.0),
            Row(
              children: [
                Expanded(
                  child: DirectoryPathField(controller: _directoryController),
                ),
                const SizedBox(width: 10.0),
                DirectoryPickerBtn(onTap: _pickFolder),
              ],
            ),
            if (_directoryController.text.isNotEmpty) ...[
              const SizedBox(height: 10.0),
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: StructureViewerWidget(
                    structureFiles: FilePickerScreenService.structureFiles(
                      path: _directoryController.text,
                    ),
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
