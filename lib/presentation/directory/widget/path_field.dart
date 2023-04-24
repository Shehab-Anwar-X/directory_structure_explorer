import 'package:flutter/material.dart';

class DirectoryPathField extends StatelessWidget {
  const DirectoryPathField(
      {required TextEditingController controller, Key? key})
      : _controller = controller,
        super(key: key);

  final TextEditingController _controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 28.0,
      child: TextField(
        enabled: false,
        controller: _controller,
        style: const TextStyle(fontSize: 12.0),
        decoration: const InputDecoration(
          fillColor: Color(0xFF45494a),
          disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFF646464), width: 1.0),
          ),
          filled: true,
          labelText: 'Directory Path',
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
}
