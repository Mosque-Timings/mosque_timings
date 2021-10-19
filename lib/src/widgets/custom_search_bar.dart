import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomSearchBar extends StatelessWidget {
  final String? initialValue;
  final String? hint;
  final TextEditingController? controller;
  final Function(String)? onChanged;
  final Function(String)? validator;
  final List<TextInputFormatter>? inputFormatters;
  final Function(String)? onSaved;
  final Function(String)? onSubmit;
  final TextAlignVertical? textAlignVertical;
  final bool? hasIcon;
  final Size? size;
  const CustomSearchBar({
    Key? key,
    this.initialValue,
    this.controller,
    this.onChanged,
    this.validator,
    this.inputFormatters,
    this.onSaved,
    this.hint,
    this.onSubmit,
    this.textAlignVertical,
    this.hasIcon = true,
    this.size = const Size(350, 50),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
            width: size!.width,
            child: TextFormField(
              controller: controller,
              onChanged: (val) => onChanged!(val),
              validator: (val) => validator!(val!),
              initialValue: initialValue,
              inputFormatters: inputFormatters,
              onSaved: (val) => onSaved!(val!),
              onFieldSubmitted: (val) => onSubmit!(val),
              textAlignVertical: textAlignVertical,
              decoration: InputDecoration(
                prefixIcon: hasIcon!
                    ? const Icon(
                        Icons.filter_alt,
                        size: 24,
                        color: Colors.black54,
                      )
                    : const SizedBox.shrink(),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                  borderSide: const BorderSide(
                    width: 0,
                    style: BorderStyle.none,
                  ),
                ),
                filled: true,
                hintStyle: TextStyle(color: Colors.grey[800]),
                hintText: hint,
                fillColor: Colors.blueGrey.shade50,
              ),
            )));
  }
}
