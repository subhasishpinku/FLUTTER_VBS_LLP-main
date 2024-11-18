import 'package:flutter/material.dart';

class CreatedChip extends StatefulWidget {
  const CreatedChip({Key? key}) : super(key: key);

  @override
  State<CreatedChip> createState() => _CreatedChipState();
}

class _CreatedChipState extends State<CreatedChip> {
  bool _isChipSelected = false;
  Color _color = Colors.black;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ChoiceChip(
            onSelected: (value) {
              setState(() {
                _isChipSelected = value;
                value ? _color = Colors.white : _color = Colors.black;
              });
            },
            selected: _isChipSelected,
            label: Text(
              'Lorem Ipsum',
              style: TextStyle(color: _color),
            )),
        const SizedBox(width: 5)
      ],
    );
  }
}
