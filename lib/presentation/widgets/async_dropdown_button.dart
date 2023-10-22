/* import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get_connect.dart';

class AsyncDropDownButton<T> extends StatefulWidget {
  final String? label;
  final ValueChanged<T>? onChanged;
  final T? value;
  final String? initialHint;
  final FocusNode? focusNode;
  final bool? autovalidate;
  final FormFieldSetter<T>? onSaved;
  final FormFieldValidator<T>? validator;
  final Widget? icon;

  /// This is the url raw data is fetched from to make a [List]<[T]> with the [fromMapFunction]
  final String itemsUrl;

  /// This function converts the raw data gotten from the [itemsUrl] to a [List]<[T]>
  final List<T> Function(Map map) fromMapFunction;

  /// This function converts the items [T] gotten from [fromMapFunction] to [DropdownMenuItem]<[T]>
  final DropdownMenuItem<T> Function(T items) dropDownItemsBuilder;

  const AsyncDropDownButton(
      {Key? key,
      @required this.onChanged,
      this.value,
      this.focusNode,
      this.autovalidate = false,
      this.onSaved,
      this.validator,
      this.icon,
      this.label,
      this.initialHint,
      required this.fromMapFunction,
      required this.itemsUrl,
      required this.dropDownItemsBuilder})
      : assert(fromMapFunction != null),
        assert(dropDownItemsBuilder != null),
        super(key: key);

  @override
  _AsyncDropDownButtonState<T> createState() => _AsyncDropDownButtonState<T>();
}

class _AsyncDropDownButtonState<T> extends State<AsyncDropDownButton<T>> {
  List<DropdownMenuItem<T>>? dropDownItems = [];
  String? errorMessage;
  bool isLoading = true;
  List<T>? items;

  @override
  void setState(fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  void _fetchData() {
    _getData(widget.itemsUrl).then((data) {
      items = widget.fromMapFunction(data);
      //print(items.toString());
      setState(() {
        dropDownItems = items?.map(widget.dropDownItemsBuilder).toList();
        isLoading = false;
        errorMessage = null;
      });
    }).catchError((error) {
      if (error is SocketException) {
        errorMessage = "Couldn't connect";
      } else {
        errorMessage = error.toString();
        print(errorMessage);
      }
      setState(() {
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    //print(dropDownItems);
    final DropdownButtonFormField<T> dropdownButtonFormField =
        DropdownButtonFormField<T>(
            hint: isLoading
                ? Text('Loading ...')
                : errorMessage != null
                    ? Text(
                        errorMessage!,
                        style: TextStyle(color: Theme.of(context).errorColor),
                      )
                    : Text(widget.initialHint),
            focusNode: widget.focusNode,
            icon: isLoading
                ? LoadingIndicator(radius: 13)
                : dropDownItems.isEmpty
                    ? TextButton(
                        onPressed: () {
                          _fetchData();
                        },
                        child: Text('Retry', style: TextStyle(fontSize: 13)),
                        style: TextButton.styleFrom(
                            padding: EdgeInsets.all(0),
                            backgroundColor: Theme.of(context).hoverColor),
                      )
                    : null,
            autovalidate: widget.autovalidate,
            validator: widget.validator,
            style: kInputTextStyle(context),
            onSaved: widget.onSaved,
            items: dropDownItems,
            onChanged: widget.onChanged);

    return widget.label == null
        ? dropdownButtonFormField
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                widget.label,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  //color: AppColors.label,
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              dropdownButtonFormField
            ],
          );
  }
}

Future<Map> _getData(String url) async {
  //final response = await http.Client().get(url);
  final response = await GetHttpClient().get(url);

  if (response.statusCode != 200 && response.statusCode != 201) {
    throw Exception(jsonDecode(response.body));
  }
  return jsonDecode(response.body);
}
 */