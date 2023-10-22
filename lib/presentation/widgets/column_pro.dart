import 'package:flutter/material.dart';

class FlexibleScrollViewColumn extends StatelessWidget {
  const FlexibleScrollViewColumn(
      {Key? key,
      this.children,
      this.mainAxisAlignment = MainAxisAlignment.start,
      this.mainAxisSize = MainAxisSize.max,
      this.crossAxisAlignment = CrossAxisAlignment.center,
      this.padding})
      : super(key: key);

  final List<Widget>? children;
  final EdgeInsets? padding;
  final MainAxisAlignment mainAxisAlignment;
  final MainAxisSize mainAxisSize;
  final CrossAxisAlignment crossAxisAlignment;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints viewportConstraints) {
        return SingleChildScrollView(
          padding: padding,
          physics: BouncingScrollPhysics(),
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: viewportConstraints.maxHeight -
                  (padding?.top ?? 0) -
                  (padding?.bottom ?? 0),
            ),
            child: IntrinsicHeight(
              child: Column(
                mainAxisSize: mainAxisSize,
                mainAxisAlignment: mainAxisAlignment,
                crossAxisAlignment: crossAxisAlignment,
                children: children!,
              ),
            ),
          ),
        );
      },
    );
  }
}
