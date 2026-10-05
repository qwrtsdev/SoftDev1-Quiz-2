import 'package:flutter/material.dart';
import '../main.dart';

class ResultPage extends StatefulWidget {
  final String player_one_choice;
  final String player_two_choice;

  const ResultPage({
    super.key,
    required this.player_one_choice,
    required this.player_two_choice,
  });
  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  @override
  Widget build(BuildContext context) {
    String one = widget.player_one_choice;
    String two = widget.player_two_choice;
    String result = '';

    if (one == two) {
      result = 'Draw';
    } else if (one == 'Rock' && two == 'Scissor') {
      result = 'Player 1 Wins';
    } else if (one == 'Paper' && two == 'Rock') {
      result = 'Player 1 Wins';
    } else if (one == 'Scissor' && two == 'Paper') {
      result = 'Player 1 Wins';
    } else {
      result = 'Player 2 Wins';
    }

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Result', style: const TextStyle(fontSize: 20)),
              const SizedBox(height: 16),
              Text('Player 1: $one'),
              Text('Player 2: $two'),
              Text(result),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const HomePage()),
                  );
                },
                child: const Text('End'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
