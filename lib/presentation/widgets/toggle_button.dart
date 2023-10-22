import 'package:flutter/material.dart';
import 'package:get/get.dart';

// Modify to use <T> instead of fixed values
class ToggleButton extends StatefulWidget {
  const ToggleButton({
    Key? key,
    required this.value,
    required this.onChanged,
    this.size = const Size(300, 60),
    this.decoration,
    required this.leftText,
    required this.rightText,
    required this.selectedTextColor,
    required this.sliderColor,
    this.innerRadius = 50,
    this.unselectedTextColor,
  }) : super(key: key);

  final ToggleValue value;
  final ValueChanged<ToggleValue> onChanged;
  final Size size;
  final BoxDecoration? decoration;
  final String leftText;
  final String rightText;
  final double? innerRadius;

  final Color selectedTextColor;
  final Color sliderColor;
  final Color? unselectedTextColor;

  @override
  _ToggleButtonState createState() => _ToggleButtonState();
}

enum ToggleValue { right, left }

class _ToggleButtonState extends State<ToggleButton> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        clipBehavior: Clip.hardEdge,
        constraints: BoxConstraints(
          maxWidth: widget.size.width,
          maxHeight: widget.size.height,
        ),
        decoration: widget.decoration,
        child: LayoutBuilder(builder:
            (BuildContext context, BoxConstraints viewportConstraints) {
          return Stack(
            children: [
              AnimatedAlign(
                alignment: widget.value == ToggleValue.right
                    ? Alignment.centerRight
                    : Alignment.centerLeft,
                duration: Duration(milliseconds: 300),
                child: Container(
                  width: viewportConstraints.maxWidth / 2,
                  height: widget.size.height,
                  decoration: BoxDecoration(
                    color: widget.sliderColor,
                    borderRadius: widget.decoration?.borderRadius ??
                        BorderRadius.all(Radius.circular(50.0)),
                  ),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: InkWell(
                      borderRadius:
                          BorderRadius.circular(widget.innerRadius ?? 50),
                      onTap: () {
                        print('object');
                        widget.onChanged(ToggleValue.left);
                      },
                      child: Center(
                        child: Text(
                          widget.leftText,
                          style: Get.textTheme.titleSmall?.copyWith(
                            color: widget.value == ToggleValue.left
                                ? widget.selectedTextColor
                                : widget.unselectedTextColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      borderRadius:
                          BorderRadius.circular(widget.innerRadius ?? 50),
                      onTap: () {
                        widget.onChanged(ToggleValue.right);
                      },
                      child: Center(
                        child: Text(
                          widget.rightText,
                          style: Get.textTheme.titleSmall?.copyWith(
                            color: widget.value == ToggleValue.right
                                ? widget.selectedTextColor
                                : widget.unselectedTextColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          );
        }),
      ),
    );
  }
}
