import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
class CounterPage extends StatefulWidget {
  const CounterPage({super.key});

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  // variable
  int counter = 0;

  // methods

  // increment
  void incrementCounter() {
    setState(() {
      counter++;
      HapticFeedback.vibrate();
    });
  }

  // decrement
  void decrementCounter() {
    setState(() {
      counter != 0 ? counter-- : counter = 0;
      HapticFeedback.vibrate();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("You pushed the button this many times: "),
            Text(
              "$counter",
              style: TextStyle(fontSize: 30, color: counter == 0 ? Colors.red : Colors.black), // Change color based on count
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                    onPressed: incrementCounter, child: Text("Increment")),
                ElevatedButton(
                    onPressed: decrementCounter, child: Text("Decrement")),
                     ElevatedButton(
                    onPressed: () {
                      HapticFeedback.heavyImpact();
                    }, child: Text("test")),
              ],
            )
          ],
        ),
      ),
    );
  }
}
