import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/services.dart';

@immutable
class EntryField extends StatelessWidget {
  const EntryField({
    Key key,
    this.initialValue,
    this.onChanged,
    this.label,
    this.suffix,
    this.helperText,
    this.validator,
    this.keyboardType = TextInputType.text,
    this.inputFormatters,
    this.minHeight = 100,
    this.autofocus = false,
  })  : assert(keyboardType != null),
        assert(autofocus != null),
        assert(minHeight != null),
        super(key: key);

  final String initialValue;
  final String helperText;
  final ValueChanged<String> onChanged;
  final String label;
  final String suffix;
  final FormFieldValidator<String> validator;
  final TextInputType keyboardType;
  final List<TextInputFormatter> inputFormatters;
  final double minHeight;
  final bool autofocus;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(minHeight: minHeight),
      child: Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: TextFormField(
          initialValue: initialValue,
          onChanged: onChanged,
          decoration: InputDecoration(
            labelText: label,
            suffix: suffix != null ? Text(suffix) : null,
            helperText: helperText,
            hasFloatingPlaceholder: true,
            errorMaxLines: 4,
          ),
          keyboardType: keyboardType,
          autovalidate: true,
          validator: validator,
          autofocus: autofocus,
          inputFormatters: inputFormatters,
          style: TextStyle(
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
