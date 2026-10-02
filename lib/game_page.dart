import 'package:flutter/material.dart';
import './result_page.dart';

class GamePage extends StatefulWidget {
  const GamePage({super.key});

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  int turn = 1;
  int player_one_choice = 0;
  int player_two_choice = 0;

  _handleSelection(int selecion) {
    if (turn == 1) {
      player_one_choice == selecion;
    } else if (turn == 2) {
      player_two_choice == selecion;
    }
  }

  _handleSubmit() {
    if (turn == 1) {
      turn += 1;
    } else if (turn == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => const ResultPage()),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: _handleSelection(1),
                    child: const Text('Rock'),
                  ),
                  SizedBox(width: 8),
                  ElevatedButton(
                    onPressed: _handleSelection(2),
                    child: const Text('Paper'),
                  ),
                  SizedBox(width: 8),
                  ElevatedButton(
                    onPressed: _handleSelection(3),
                    child: const Text('Scissor'),
                  ),
                ],
              ),
              SizedBox(width: 12),
              ElevatedButton(onPressed: () {}, child: const Text('Submit')),
            ],
          ),
        ),
      ),
    );
  }
}
