import 'package:flutter/material.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:animations/animations.dart';

class StepProgressExample extends StatefulWidget {
  @override
  _StepProgressExampleState createState() => _StepProgressExampleState();
}

class _StepProgressExampleState extends State<StepProgressExample>
    with TickerProviderStateMixin {
  double _currentStep = 1.0; // Start in the middle (0.0 to 1.0)
  int _totalSteps = 15; // Total number of steps
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1), // Adjust animation duration as needed
    );

    // Start the animation
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Calculate the current step based on the double value
    int currentStep = (_currentStep).round();

    return Scaffold(
      appBar: AppBar(
        title: Text('Custom Step Progress Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: MediaQuery.of(context)
                  .size
                  .width, // Make the container full width
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end, // Align to the right
                children: [
                  Transform.rotate(
                    angle: 180 * 3.14159265359 / 180, // Rotate by 180 degrees
                    child: StepProgressIndicator(
                      totalSteps: _totalSteps,
                      currentStep: currentStep,
                      size: 40,
                      padding: 2,
                      roundedEdges: Radius.circular(10),
                      direction: Axis.horizontal,
                      // gradientColor: LinearGradient(
                      //   begin: Alignment.topLeft,
                      //   end: Alignment.bottomRight,
                      //   colors: [Colors.cyan, Colors.red],
                      // ),
                      selectedColor: Colors.blue,
                      unselectedColor: Colors.grey,

                      customSize: (index, _) => (index + 1),
                    ),
                  ),
                  StepProgressIndicator(
                    totalSteps: _totalSteps,
                    currentStep: currentStep,
                    size: 40,
                    padding: 2,
                    roundedEdges: Radius.circular(10),
                    direction: Axis.horizontal,
                    // gradientColor: LinearGradient(
                    //   begin: Alignment.topLeft,
                    //   end: Alignment.bottomRight,
                    //   colors: [Colors.cyan, Colors.red],
                    // ),
                    selectedColor: Colors.blue,
                    unselectedColor: Colors.grey,
                    customSize: (index, _) => (index + 1),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Text('Current Step: $currentStep'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Simulate changing the current step (move to the right)
                setState(() {
                  _currentStep = (_currentStep + 1);
                });
                // Restart the animation
                _animationController.reset();
                _animationController.forward();
              },
              child: Text('Next Step'),
            )
          ],
        ),
      ),
    );
  }
}
