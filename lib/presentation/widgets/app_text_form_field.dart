import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../utils/values.dart';
import 'styles.dart';

class AppTextFormField extends StatelessWidget {
  const AppTextFormField({
    Key? key,
    this.obscureText = false,
    this.autovalidateMode = AutovalidateMode.onUserInteraction,
    this.label,
    this.hintText,
    this.enabled = true,
    this.textInputType = TextInputType.text,
    this.onChanged,
    this.prefixText,
    this.prefixIcon,
    this.suffixIcon,
    this.textEditingController,
    this.inputFormatters,
    this.maxLength,
    this.maxLines = 1,
    this.moneyInput = false,
    this.onTap,
    this.readOnly = false,
    this.decoration,
    this.onSaved,
    this.validator,
    this.initialValue,
    this.textInputAction,
    this.onSubmitted,
    this.minLines,
    this.expands = false,
    this.maxLengthEnforcement,
    this.autofillHints,
  }) : super(key: key);

  final String? initialValue;
  final bool obscureText;
  final AutovalidateMode? autovalidateMode;
  final String? Function(String?)? onSaved;
  final String? Function(String?)? validator;
  final String? Function(String?)? onSubmitted;
  final String? hintText;
  final String? label;
  final bool enabled;
  final bool readOnly;
  final TextInputType textInputType;
  final ValueChanged<String>? onChanged;
  final String? prefixText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextEditingController? textEditingController;
  final List<TextInputFormatter>? inputFormatters;
  final void Function()? onTap;
  final int? maxLength;
  final int? maxLines;
  final int? minLines;
  final bool expands;
  final bool moneyInput;
  final InputDecoration? decoration;
  final TextInputAction? textInputAction;
  final MaxLengthEnforcement? maxLengthEnforcement;
  final Iterable<String>? autofillHints;

  @override
  Widget build(BuildContext context) {
    final _textFormField = TextFormField(
      autofillHints: autofillHints,
      autovalidateMode: autovalidateMode,
      minLines: minLines,
      expands: expands,
      keyboardType: moneyInput ? TextInputType.number : textInputType,
      onChanged: onChanged,
      onTap: onTap,
      initialValue: initialValue,
      textCapitalization: TextCapitalization.sentences,
      textInputAction: textInputAction,
      maxLengthEnforcement: maxLengthEnforcement,
      inputFormatters: inputFormatters,
      // inputFormatters: moneyInput
      //     ? [WhitelistingTextInputFormatter.digitsOnly, MoneyFormatter()]
      //     : [LengthLimitingTextInputFormatter(maxLength)],
      controller: textEditingController,
      //cursorColor: Colors.grey,
      obscureText: obscureText,
      enabled: enabled,
      readOnly: readOnly,
      showCursor: !readOnly,
      maxLines: maxLines,
      validator: validator,
      onSaved: onSaved,
      onFieldSubmitted: onSubmitted,
      decoration: decoration ??
          InputDecoration(
            hintText: hintText,
            prefixIcon: prefixIcon,
            suffixIcon: Padding(
              padding: EdgeInsets.fromLTRB(12, 0, 12, 0),
              child: suffixIcon,
            ),
            prefixText: prefixText,
          ),
    );

    return label == null
        ? _textFormField
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label ?? '',
                style: kLabelStyle(context).copyWith(fontFamily: 'Cabin'),
              ),
              const SizedBox(
                height: AppMargin.m10,
              ),
              _textFormField,
            ],
          );
  }
}
