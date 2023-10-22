/* import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppDropDownButton<T> extends StatelessWidget {
  final String? label;
  final ValueChanged<T?>? onChanged;
  final List<DropdownMenuItem<T>> items;
  final T? value;
  final String? hint;
  final bool isExpanded;

  final FocusNode? focusNode;
  final AutovalidateMode? autovalidateMode;
  final FormFieldSetter<T>? onSaved;
  final FormFieldValidator<T>? validator;
  final EdgeInsets? dropdownPadding;
  final Widget? icon;

  //final bool enabled;

  const AppDropDownButton({
    Key? key,
    required this.onChanged,
    required this.items,
    this.value,
    this.focusNode,
    this.autovalidateMode,
    this.onSaved,
    this.validator,
    this.icon,
    this.label,
    this.hint,
    this.dropdownPadding,
    this.isExpanded = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _dropdownButtonFormField = DropdownButtonFormField2<T>(
      // Drop downs have an unusual padding at the Top
      // These makes it appear centered
      buttonPadding: EdgeInsets.only(bottom: 8),
      buttonHeight: 28,

      hint: hint != null
          ? Text(hint!, style: Get.theme.inputDecorationTheme.hintStyle)
          : null,
      isExpanded: isExpanded,
      //customItemsHeight: 8,
      //itemHeight: 48,
      value: value,
      focusNode: focusNode,
      iconSize: 20,
      icon: icon ??
          ImageIcon(
            AssetImage('assets/icons/angle_down.png'),
          ),
      iconEnabledColor: Get.theme.inputDecorationTheme.hintStyle!.color,
      autovalidateMode: autovalidateMode,
      validator: validator,
      //style: kInputTextStyle(context),
      onSaved: onSaved,
      items: items,
      onChanged: onChanged,
      dropdownPadding: dropdownPadding,
      dropdownDecoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        boxShadow: [kDropShadow(0, 10, 16)],
      ),
    );

    return label == null
        ? _dropdownButtonFormField
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[Label(label: label), _dropdownButtonFormField],
          );
  }
}

class Label extends StatelessWidget {
  const Label({
    Key? key,
    required this.label,
  }) : super(key: key);

  final String? label;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label ?? '',
            style: kLabelStyle(context),
          ),
          SizedBox(
            height: AppMargin.m10,
          ),
        ],
      ),
    );
  }
}
 */