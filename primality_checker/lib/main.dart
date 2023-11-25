import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) =>
      const MaterialApp(title: "Primality Checker", home: PrimalityChecker());
}

class PrimalityChecker extends StatefulWidget {
  const PrimalityChecker({super.key});

  @override
  PrimalityCheckerState createState() => PrimalityCheckerState();
}

class PrimalityCheckerState extends State<PrimalityChecker> {
  final TextEditingController _numberController = TextEditingController();
  String _result = ' ';

  void checkPrime() {
    int value = int.tryParse(_numberController.text) ?? 0;
    setState(() {
      _result = (value >= 0)
          ? textMessage(value)
          : "Please enter 0 or a positive integer number";
    });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Primality Checker'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: _numberController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Enter a number',
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: checkPrime,
                child: const Text('Check Primality'),
              ),
              const SizedBox(height: 20),
              Text(
                _result,
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      );
}

bool isPrime(int value) {
  if (value < 4) {
    return value > 1;
  }
  if (value % 2 == 0 || value % 3 == 0) {
    return false;
  }
  for (var i = 5; i * i <= value; i += 6) {
    if (value % i == 0 || value % (i + 2) == 0) {
      return false;
    }
  }
  return true;
}

String textMessage(int value) =>
    (isPrime(value)) ? "$value is prime." : "$value is not prime.";
