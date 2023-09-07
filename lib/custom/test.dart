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
  final Color middleColor;
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
    required this.middleColor,
    required this.lastColor,
  });

  @override
  State<CustomStepProgressIndicator> createState() =>
      _CustomStepProgressIndicatorState();
}

class _CustomStepProgressIndicatorState
    extends State<CustomStepProgressIndicator> {
  @override
  Widget build(BuildContext context) {
    final int firstSegmentSteps = widget.totalSteps ~/ 4;
    final int secondSegmentSteps = firstSegmentSteps;
    final int thirdSegmentSteps = firstSegmentSteps;
    final int lastSegmentSteps = widget.totalSteps - (firstSegmentSteps * 3);

    return Container(
      height: widget.stepHeight,
      child: Row(
        // mainAxisSize: MainAxisSize.max,
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
                  } else if (index < firstSegmentSteps + secondSegmentSteps) {
                    // Second segment, use the middle color
                    final mixFactor = (index - firstSegmentSteps) /
                        (secondSegmentSteps - 1); // Normalize to [0, 1]
                    mixedColor = Color.lerp(
                        widget.firstColor, widget.middleColor, mixFactor)!;
                  } else if (index <
                      firstSegmentSteps +
                          secondSegmentSteps +
                          thirdSegmentSteps) {
                    // Third segment, use the last color
                    final mixFactor =
                        (index - firstSegmentSteps - secondSegmentSteps) /
                            (thirdSegmentSteps - 1); // Normalize to [0, 1]
                    mixedColor = Color.lerp(
                        widget.middleColor, widget.lastColor, mixFactor)!;
                  } else {
                    // Last segment, use the last color
                    mixedColor = widget.lastColor;
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
                  } else if (index < firstSegmentSteps + secondSegmentSteps) {
                    // Second segment, use the middle color
                    final mixFactor = (index - firstSegmentSteps) /
                        (secondSegmentSteps - 1); // Normalize to [0, 1]
                    mixedColor = Color.lerp(
                        widget.firstColor, widget.middleColor, mixFactor)!;
                  } else if (index <
                      firstSegmentSteps +
                          secondSegmentSteps +
                          thirdSegmentSteps) {
                    // Third segment, use the last color
                    final mixFactor =
                        (index - firstSegmentSteps - secondSegmentSteps) /
                            (thirdSegmentSteps - 1); // Normalize to [0, 1]
                    mixedColor = Color.lerp(
                        widget.middleColor, widget.lastColor, mixFactor)!;
                  } else {
                    // Last segment, use the last color
                    mixedColor = widget.lastColor;
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
