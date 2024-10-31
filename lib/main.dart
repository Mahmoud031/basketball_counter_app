import 'package:basketball_counter_app/widgets/custom_elevated_button.dart';
import 'package:basketball_counter_app/widgets/custom_text.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const BasketballApp());
}

class BasketballApp extends StatefulWidget {
  const BasketballApp({super.key});

  @override
  State<BasketballApp> createState() => _BasketballAppState();
}

class _BasketballAppState extends State<BasketballApp> {
  int teamAPoints = 0;

  int teamBPoints = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.orange,
          title: const Text(
            'Points Counter',
            style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic),
          ),
        ),
        body: Column(
          children: [
            const SizedBox(
              height: 32,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
              Column(
                children: [
                  const CustomText(text: 'Team A', fontSize: 32),
                  CustomText(text: '$teamAPoints', fontSize: 150),
                  CustomElevatedButton(
                      onPressed: () {
                        setState(() {
                          teamAPoints++;
                        });
                      },
                      text: 'add 1 point'),
                  const SizedBox(
                    height: 16,
                  ),
                  CustomElevatedButton(
                      onPressed: () {
                        setState(() {
                          teamAPoints += 2;
                        });
                      },
                      text: 'add 2 points'),
                  const SizedBox(
                    height: 16,
                  ),
                  CustomElevatedButton(
                      onPressed: () {
                        setState(() {
                          teamAPoints += 3;
                        });
                      },
                      text: 'add 3 points'),
                ],
              ),
              const SizedBox(
                height: 400,
                child: VerticalDivider(
                  color: Colors.grey,
                  thickness: 1,
                ),
              ),
              Column(
                children: [
                  const CustomText(text: 'Team B', fontSize: 32),
                  CustomText(text: '$teamBPoints', fontSize: 150),
                  CustomElevatedButton(
                      onPressed: () {
                        setState(() {
                          teamBPoints++;
                        });
                      },
                      text: 'add 1 point'),
                  const SizedBox(
                    height: 16,
                  ),
                  CustomElevatedButton(
                      onPressed: () {
                        setState(() {
                          teamBPoints += 2;
                        });
                      },
                      text: 'add 2 points'),
                  const SizedBox(
                    height: 16,
                  ),
                  CustomElevatedButton(
                      onPressed: () {
                        setState(() {
                          teamBPoints += 3;
                        });
                      },
                      text: 'add 3 points'),
                ],
              ),
            ]),
            const Spacer(),
            CustomElevatedButton(
                onPressed: () {
                  setState(() {
                    teamAPoints = 0;
                    teamBPoints = 0;
                  });
                },
                text: 'Reset'),
            const Spacer(
              flex: 3,
            )
          ],
        ),
      ),
    );
  }
}
