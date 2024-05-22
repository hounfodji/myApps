import 'package:flutter/material.dart';

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
    });
  }

  // decement
  void decrementCounter() {
    setState(() {
      counter--;
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
            Text(counter.toString(), style: TextStyle(fontSize: 30),),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
              ElevatedButton(onPressed: incrementCounter, child: Text("Increment")),
              ElevatedButton(onPressed: decrementCounter, child: Text("Decrement")),
            ],)
          ],
        ),
      ),
    );
  }
}