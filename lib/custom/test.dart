import 'package:flutter/material.dart';

class CustomStepProgressIndicator extends StatefulWidget {
  final double width;
  final double height;
  final int totalSteps;
  final int currentStep;
  final double stepWidth;
  final double stepHeight;
  final double padding;
  final Color unselectedColor;
  final Color firstColor;
  final Color lastColor;

  CustomStepProgressIndicator({
    required this.totalSteps,
    required this.currentStep,
    required this.width,
    required this.height,
    this.stepWidth = 40.0,
    this.stepHeight = 20.0,
    this.padding = 2.0,
    this.unselectedColor = Colors.grey,
    required this.firstColor,
    required this.lastColor, // Pass a list of colors
    // Pass a list of colors
  });

  @override
  State<CustomStepProgressIndicator> createState() =>
      _CustomStepProgressIndicatorState();
}

class _CustomStepProgressIndicatorState
    extends State<CustomStepProgressIndicator> {
  @override
  Widget build(BuildContext context) {
    final int firstSegmentSteps = widget.totalSteps ~/ 3;
    final int lastSegmentSteps = widget.totalSteps - (firstSegmentSteps * 2);

    return Container(
      height: widget.stepHeight,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: Transform.rotate(
              angle: 180 * 3.14159265359 / 180, // Rotate by 180 degrees

              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: List.generate(widget.totalSteps, (index) {
                  Color mixedColor;
                  if (index < firstSegmentSteps) {
                    // First segment, use the first color
                    mixedColor = widget.firstColor;
                  } else if (index >= firstSegmentSteps + lastSegmentSteps) {
                    // Last segment, use the last color
                    mixedColor = widget.lastColor;
                  } else {
                    // Middle segment, mix the first and last colors
                    final mixFactor = (index - firstSegmentSteps) /
                        (lastSegmentSteps - 1); // Normalize to [0, 1]
                    mixedColor = Color.lerp(
                        widget.firstColor, widget.lastColor, mixFactor)!;
                  }
                  if (index > 0) {
                    return Container(
                      width: widget.stepWidth,
                      height: widget.stepHeight * (index + 1),
                      margin: EdgeInsets.symmetric(horizontal: widget.padding),
                      decoration: BoxDecoration(
                        gradient: (index + 1 <= widget.currentStep)
                            ? LinearGradient(
                                colors: [mixedColor, mixedColor],
                              )
                            : null,
                        color: (index + 1 <= widget.currentStep)
                            ? null
                            : widget.unselectedColor,
                      ),
                    );
                  } else {
                    return Container();
                  }
                }),
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: List.generate(widget.totalSteps, (index) {
                Color mixedColor;
                if (index < firstSegmentSteps) {
                  // First segment, use the first color
                  mixedColor = widget.firstColor;
                } else if (index >= firstSegmentSteps + lastSegmentSteps) {
                  // Last segment, use the last color
                  mixedColor = widget.lastColor;
                } else {
                  // Middle segment, mix the first and last colors
                  final mixFactor = (index - firstSegmentSteps) /
                      (lastSegmentSteps - 1); // Normalize to [0, 1]
                  mixedColor = Color.lerp(
                      widget.firstColor, widget.lastColor, mixFactor)!;
                }

                return Container(
                  width: widget.stepWidth,
                  height: widget.stepHeight * (index + 1),
                  margin: EdgeInsets.symmetric(horizontal: widget.padding),
                  decoration: BoxDecoration(
                    gradient: (index + 1 <= widget.currentStep)
                        ? LinearGradient(
                            colors: [mixedColor, mixedColor],
                          )
                        : null,
                    color: (index + 1 <= widget.currentStep)
                        ? null
                        : widget.unselectedColor,
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
