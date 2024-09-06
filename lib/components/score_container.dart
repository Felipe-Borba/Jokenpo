import 'package:flutter/material.dart';

class ScoreContainer extends StatelessWidget {
  final int playerScore;
  final int computerScore;

  const ScoreContainer({
    super.key,
    required this.playerScore,
    required this.computerScore,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.fromLTRB(0, 32, 0, 0),
          child: Text('Placar'),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(64, 16, 64, 16),
          child: Container(
            width: MediaQuery.sizeOf(context).width * 0.5,
            height: 80,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Text('Voce'),
                      Text('$playerScore'),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Text('Computador'),
                      Text('$computerScore'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
