import 'package:flutter/material.dart';

class DirectoryPickerBtn extends StatelessWidget {
  const DirectoryPickerBtn({required VoidCallback onTap, Key? key})
      : _onTap = onTap,
        super(key: key);

  final VoidCallback _onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onTap,
      child: Container(
        alignment: Alignment.bottomCenter,
        constraints: const BoxConstraints.expand(
          width: 28.0,
          height: 28.0,
        ),
        decoration: BoxDecoration(
          border: Border.all(
            width: 1.0,
            color: const Color(0xFF646464),
          ),
          borderRadius: BorderRadius.circular(7.0),
          color: const Color(0xFF45494a),
        ),
        child: Text(
          '...',
          style: TextStyle(
            color: Theme.of(context).primaryColorLight,
          ),
        ),
      ),
    );
  }
}
