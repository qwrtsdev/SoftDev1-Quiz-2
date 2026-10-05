import 'package:flutter/material.dart';
import 'result_page.dart';

class GamePage extends StatefulWidget {
  const GamePage({super.key});

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  int turn = 1;
  String player_one_choice = '';
  String player_two_choice = '';

  void _handleSelection(String selecion) {
    if (turn == 1) {
      setState(() {
        player_one_choice = selecion;
      });
    } else if (turn == 2) {
      setState(() {
        player_two_choice = selecion;
      });
    }
  }

  void _handleSubmit() {
    if (turn == 1) {
      setState(() {
        turn += 1;
      });
    } else if (turn == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => ResultPage(
            player_one_choice: player_one_choice,
            player_two_choice: player_two_choice,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Player ${turn} Turn', style: const TextStyle(fontSize: 20)),
              const SizedBox(height: 16),
              Text(
                'You picked: ${turn == 1 ? player_one_choice : player_two_choice}',
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () => _handleSelection('Rock'),
                    child: const Text('Rock'),
                  ),
                  SizedBox(width: 8),
                  ElevatedButton(
                    onPressed: () => _handleSelection('Paper'),
                    child: const Text('Paper'),
                  ),
                  SizedBox(width: 8),
                  ElevatedButton(
                    onPressed: () => _handleSelection('Scissor'),
                    child: const Text('Scissor'),
                  ),
                ],
              ),
              SizedBox(height: 12),
              ElevatedButton(
                onPressed: _handleSubmit,
                child: const Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
