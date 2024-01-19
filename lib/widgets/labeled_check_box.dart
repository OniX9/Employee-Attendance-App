import 'package:flutter/material.dart';

class LabeledCheckBox extends StatefulWidget {
  final String label;
  final double? padding;
  final double? textSpacing;

  const LabeledCheckBox({
    this.label = '',
    this.padding = 24,
    this.textSpacing = 0,
    super.key,
  });

  @override
  State<LabeledCheckBox> createState() => _LabeledCheckBoxState();
}

class _LabeledCheckBoxState extends State<LabeledCheckBox> {
  bool? isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          height: widget.padding,
          width: widget.padding,
          child: Checkbox(
            value: isChecked,
            onChanged: (newValue) => setState(
                  () {
                isChecked = newValue;
              },
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(3),
            ),
          ),
        ),
        SizedBox(width: widget.textSpacing),
        Text(widget.label),
      ],
    );
  }
}