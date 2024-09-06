import 'dart:math';

import 'package:flutter/material.dart';
import 'package:jokenpo/components/play_option.dart';
import 'package:jokenpo/components/score_container.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text('Jokenpo'),
        centerTitle: true,
      ),
      body: const Body(),
    );
  }
}

class Body extends StatefulWidget {
  const Body({
    super.key,
  });

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  List<String> options = [
    'assets/images/rock.png',
    'assets/images/paper.png',
    'assets/images/scissor.png'
  ];
  int? _computerMove;
  int _playerScore = 0;
  int _computerScore = 0;
  bool? _userWin;

  void _selectRock() {
    int move = _generateComputerMove();
    _computeWinner(move, 0, 2);
    _clearState();
  }

  void _selectPaper() {
    int move = _generateComputerMove();
    _computeWinner(move, 1, 0);
    _clearState();
  }

  void _selectScissor() {
    int move = _generateComputerMove();
    _computeWinner(move, 2, 1);
    _clearState();
  }

  int _generateComputerMove() {
    int move = Random().nextInt(3);
    setState(() {
      _computerMove = move;
    });
    return move;
  }

  void _computeWinner(int move, int select, int wins) {
    if (move != select) {
      bool userWin = move == wins;
      setState(() {
        _userWin = userWin;
        _playerScore = userWin ? _playerScore + 1 : _playerScore;
        _computerScore = !userWin ? _computerScore + 1 : _computerScore;
      });
    } else {
      setState(() {
        _userWin = null;
      });
    }
  }

  void _clearState() {
    Future.delayed(const Duration(seconds: 20), () {
      setState(() {
        _computerMove = null;
        _userWin = null;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Align(
        alignment: const AlignmentDirectional(0, -1),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0, 24, 0, 0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  const Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 16),
                    child: Text('Jogada do Computador'),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      PlayOption(
                        imagePath: _computerMove != null
                            ? options[_computerMove!]
                            : null,
                        onTap: _selectRock,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0, 24, 0, 0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  const Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 16),
                    child: Text('Sua Jogada'),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      PlayOption(
                        imagePath: options[0],
                        onTap: _selectRock,
                      ),
                      PlayOption(
                        imagePath: options[1],
                        onTap: _selectPaper,
                      ),
                      PlayOption(
                        imagePath: options[2],
                        onTap: _selectScissor,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 16, 0, 0),
              child: Column(
                children: [
                  const Text("Resultado"),
                  if (_userWin != null)
                    Text(_userWin! ? "Você Ganhou" : "Você perdeu")
                  else if (_userWin == null && _computerMove != null)
                    const Text("Empate")
                ],
              ),
            ),
            const Spacer(),
            ScoreContainer(
              playerScore: _playerScore,
              computerScore: _computerScore,
            )
          ],
        ),
      ),
    );
  }
}
