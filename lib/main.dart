import 'package:basketball_counter_app/cubit/counter_cubit.dart';
import 'package:basketball_counter_app/cubit/counter_state.dart';
import 'package:basketball_counter_app/widgets/custom_elevated_button.dart';
import 'package:basketball_counter_app/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const BasketballApp());
}

class BasketballApp extends StatelessWidget {
  const BasketballApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Homepage(),
      ),
    );
  }
}

class Homepage extends StatelessWidget {
  Homepage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CounterCubit, CounterState>(
      builder: (context, state) {
        return Scaffold(
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
                    CustomText(
                        text:
                            '${BlocProvider.of<CounterCubit>(context).teamAPoints}',
                        fontSize: 150),
                    CustomElevatedButton(
                        onPressed: () {
                          BlocProvider.of<CounterCubit>(context)
                              .TeamIncrement(team: "A", buttonNumber: 1);
                        },
                        text: 'add 1 point'),
                    const SizedBox(
                      height: 16,
                    ),
                    CustomElevatedButton(
                        onPressed: () {
                          BlocProvider.of<CounterCubit>(context)
                              .TeamIncrement(team: "A", buttonNumber: 2);
                        },
                        text: 'add 2 points'),
                    const SizedBox(
                      height: 16,
                    ),
                    CustomElevatedButton(
                        onPressed: () {
                          BlocProvider.of<CounterCubit>(context)
                              .TeamIncrement(team: "A", buttonNumber: 3);
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
                    CustomText(
                        text:
                            '${BlocProvider.of<CounterCubit>(context).teamBPoints}',
                        fontSize: 150),
                    CustomElevatedButton(
                        onPressed: () {
                          BlocProvider.of<CounterCubit>(context)
                              .TeamIncrement(team: "B", buttonNumber: 1);
                        },
                        text: 'add 1 point'),
                    const SizedBox(
                      height: 16,
                    ),
                    CustomElevatedButton(
                        onPressed: () {
                          BlocProvider.of<CounterCubit>(context)
                              .TeamIncrement(team: "B", buttonNumber: 2);
                        },
                        text: 'add 2 points'),
                    const SizedBox(
                      height: 16,
                    ),
                    CustomElevatedButton(
                        onPressed: () {
                          BlocProvider.of<CounterCubit>(context)
                              .TeamIncrement(team: "B", buttonNumber: 3);
                        },
                        text: 'add 3 points'),
                  ],
                ),
              ]),
              const Spacer(),
              CustomElevatedButton(onPressed: () {
                BlocProvider.of<CounterCubit>(context).resetPoints();
              }, text: 'Reset'),
              const Spacer(
                flex: 3,
              )
            ],
          ),
        );
      },
      listener: (context, state) {},
    );
  }
}
