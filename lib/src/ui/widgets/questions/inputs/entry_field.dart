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
    this.helperText,
    this.validator,
    this.keyboardType = TextInputType.text,
    this.inputFormatters,
    this.autofocus = false,
  })  : assert(keyboardType != null),
        assert(autofocus != null),
        super(key: key);

  final String initialValue;
  final String helperText;
  final ValueChanged<String> onChanged;
  final String label;
  final FormFieldValidator<String> validator;
  final TextInputType keyboardType;
  final List<TextInputFormatter> inputFormatters;
  final bool autofocus;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(minHeight: 100),
      child: TextFormField(
        initialValue: initialValue,
        onChanged: onChanged,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          enabledBorder: OutlineInputBorder(),
          labelText: label,
          helperText: helperText,
          hasFloatingPlaceholder: true,
        ),
        keyboardType: keyboardType,
        autovalidate: true,
        validator: validator,
        autofocus: autofocus,
        inputFormatters: inputFormatters,
        style: TextStyle(
          color: Colors.black,
          fontSize: 20,
        ),
      ),
    );
  }
}
