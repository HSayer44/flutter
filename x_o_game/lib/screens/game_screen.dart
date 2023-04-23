// ignore_for_file: avoid_types_as_parameter_names, non_constant_identifier_names

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../elements/colors.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  static var customFontWhite = GoogleFonts.coiny(
    textStyle: const TextStyle(
      color: Colors.white,
      letterSpacing: 3,
      fontSize: 28,
    ),
  );

  int oScore = 0;
  int xScore = 0;

  int filledBoxes = 0;

  int attempts = 0;

  static const maxSeconds = 30;
  int seconds = maxSeconds;

  bool oTurn = true;
  bool winnerFound = false;

  String resultDeclartion = '';

  Timer? timer;

  List<String> displayX0 = ['', '', '', '', '', '', '', '', ''];
  List<int> matchIndexes = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MainColor.primaryColor,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text('Player 0', style: customFontWhite),
                      Text(oScore.toString(), style: customFontWhite),
                    ],
                  ),
                  const SizedBox(width: 20),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text('PLayer X', style: customFontWhite),
                      Text(xScore.toString(), style: customFontWhite),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 3,
              child: GridView.builder(
                itemCount: 9,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3),
                itemBuilder: (BuildContext, int index) {
                  return GestureDetector(
                    onTap: () {
                      _tapped(index);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                          width: 5,
                          color: MainColor.primaryColor,
                        ),
                        color: matchIndexes.contains(index)
                            ? MainColor.accentColor
                            : MainColor.secondaryColor,
                      ),
                      child: Center(
                        child: Text(
                          displayX0[index],
                          style: GoogleFonts.coiny(
                            textStyle: TextStyle(
                              fontSize: 64,
                              color: MainColor.primaryColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Expanded(
              flex: 2,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(resultDeclartion, style: customFontWhite),
                    const SizedBox(height: 10),
                    _BuildTimer()
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void _tapped(int index) {
    final isRunning = timer == null ? false : timer!.isActive;
    if (isRunning) {
      setState(() {
        if (oTurn && displayX0[index] == '') {
          displayX0[index] = '0';
          filledBoxes++;
        } else if (!oTurn && displayX0[index] == '') {
          displayX0[index] = 'X';
          filledBoxes++;
        }
        oTurn = !oTurn;
        _checkWinner();
      });
    }
  }

  void _checkWinner() {
    //check 1st row
    if (displayX0[0] == displayX0[1] &&
        displayX0[0] == displayX0[2] &&
        displayX0[0] != '') {
      setState(() {
        resultDeclartion = 'Player ${displayX0[0]} Wins!';
        _updateScore(displayX0[0]);
        matchIndexes.addAll([0, 1, 2]);
        stopTimer();
      });
    }
    //check 2nd row
    if (displayX0[3] == displayX0[4] &&
        displayX0[3] == displayX0[5] &&
        displayX0[3] != '') {
      setState(() {
        resultDeclartion = 'Player ${displayX0[3]} Wins!';
        _updateScore(displayX0[3]);
        matchIndexes.addAll([3, 4, 5]);
        stopTimer();
      });
    }
    //check 3rd row
    if (displayX0[6] == displayX0[7] &&
        displayX0[6] == displayX0[8] &&
        displayX0[6] != '') {
      setState(() {
        resultDeclartion = 'Player ${displayX0[6]} Wins!';
        _updateScore(displayX0[6]);
        matchIndexes.addAll([6, 7, 8]);
        stopTimer();
      });
    }
    //check 1st column
    if (displayX0[0] == displayX0[3] &&
        displayX0[0] == displayX0[6] &&
        displayX0[0] != '') {
      setState(() {
        resultDeclartion = 'Player ${displayX0[0]} Wins!';
        _updateScore(displayX0[0]);
        matchIndexes.addAll([0, 3, 6]);
        stopTimer();
      });
    }

    // check 2st colum
    if (displayX0[1] == displayX0[4] &&
        displayX0[1] == displayX0[7] &&
        displayX0[1] != '') {
      setState(() {
        resultDeclartion = 'Player ${displayX0[1]} Wins!';
        _updateScore(displayX0[1]);
        matchIndexes.addAll([1, 7, 4]);
        stopTimer();
      });
    }
    // check 3rd colum
    if (displayX0[2] == displayX0[5] &&
        displayX0[2] == displayX0[8] &&
        displayX0[2] != '') {
      setState(() {
        resultDeclartion = 'Player ${displayX0[2]} Wins!';
        _updateScore(displayX0[2]);
        matchIndexes.addAll([2, 5, 8]);
        stopTimer();
      });
    }
    // check diagonal
    if (displayX0[0] == displayX0[4] &&
        displayX0[0] == displayX0[8] &&
        displayX0[0] != '') {
      setState(() {
        resultDeclartion = 'Player ${displayX0[0]} Wins!';
        _updateScore(displayX0[0]);
        matchIndexes.addAll([0, 4, 8]);
        stopTimer();
      });
    }
    if (displayX0[2] == displayX0[4] &&
        displayX0[2] == displayX0[6] &&
        displayX0[2] != '') {
      setState(() {
        resultDeclartion = 'Player ${displayX0[2]} Wins!';
        _updateScore(displayX0[2]);
        matchIndexes.addAll([4, 6, 2]);
        stopTimer();
      });
    }
    if (!winnerFound && filledBoxes == 9) {
      setState(() {
        resultDeclartion = 'Nobody Wins!';
      });
    }
  }

  void _updateScore(String winner) {
    if (winner == '0') {
      oScore++;
    } else if (winner == 'X') {
      xScore++;
    }
    winnerFound = true;
  }

  void _clearBoard() {
    setState(() {
      for (int i = 0; i < 9; i++) {
        displayX0[i] = '';
      }
      matchIndexes.clear();
      resultDeclartion = '';
    });
    filledBoxes = 0;
  }

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (_) {
      setState(() {
        if (seconds > 0) {
          seconds--;
        } else {
          stopTimer();
        }
      });
    });
  }

  void stopTimer() {
    resetTimer();
    timer?.cancel();
  }

  void resetTimer() => seconds = maxSeconds;

  Widget _BuildTimer() {
    final isRuning = timer == null ? false : timer!.isActive;
    return isRuning ? SizedBox(
      width: 100,
      height: 100,
      child: Stack(
        fit: StackFit.expand,
        children: [
          CircularProgressIndicator(
            value: 1 - seconds / maxSeconds,
            valueColor: const AlwaysStoppedAnimation(Colors.white),
            strokeWidth: 8,
            backgroundColor: MainColor.accentColor,
          ),
          Center(
            child: Text(
              '$seconds',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 50
              ),
            ),
          ),
        ],
      ),
    ) : ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
      ),
      onPressed: () {
        startTimer();
        _clearBoard();
        attempts++;
      },
      child: Text(
        attempts == 0 ? 'Start' : 'Play Again',
        style: const TextStyle(fontSize: 20, color: Colors.black),
      ),
    );
  }
}
