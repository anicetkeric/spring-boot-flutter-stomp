import 'package:flutter/material.dart';

class GateDestination extends StatelessWidget {
  final String number;
  final String destination;
  const GateDestination({
    super.key, required this.number, required this.destination
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 5),
      elevation: 20.0,
      color: Theme.of(context).cardColor,
      child: Container(
        //height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Gate | Porte',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                 // height: 1.5,
                color: Theme.of(context).primaryColor,
              ),
            ),
            Text(
              number,
              style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                color: Colors.yellowAccent,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10.0),
            Text(
              destination,
              style: Theme.of(context).textTheme.displayLarge?.copyWith(
                  color: Theme.of(context).colorScheme.error,
                  fontWeight: FontWeight.bold,
                  fontSize: 100,
              )
            ),
          ],
        )
      ),
    );
  }
}
