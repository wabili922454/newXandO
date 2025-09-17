// ignore_for_file: unused_field, prefer_interpolation_to_compose_strings

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:practise_flut/constants/color.dart';

class Game extends StatefulWidget {
  const Game({super.key});

  @override
  State<Game> createState() => _GameState();
}

class _GameState extends State<Game> {
  bool xturn = true;

  int attempt = 0;

  List<String> displayxo = ['', '', '', '', '', '', '', '', '', ''];
  List<int> matchindexes = [];
  int xscore = 0;
  int oscore = 0;
  int filledboxes = 0;
  bool winnerfound = false;
  static const maxseconds = 30;
  int seconds = maxseconds;
  Timer? timer;

  String resultDeclaration = '';
  static var customefonts = GoogleFonts.coiny(
    textStyle: TextStyle(
      fontSize: 38,
      fontWeight: FontWeight.bold,
      letterSpacing: 2,
      color: Colors.white,
    ),
  );
  void startTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (_) {
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

  void resetTimer() => seconds = maxseconds;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                margin: EdgeInsets.only(top: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Player X', style: customefonts),
                        Text(xscore.toString(), style: customefonts),
                      ],
                    ),
                    SizedBox(width: 20),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Player O', style: customefonts),
                        Text(oscore.toString(), style: customefonts),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                ),
                itemCount: 9,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      _tapped(index);
                      print(index);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                          width: 5,
                          color: Maincolor.primarycolor,
                        ),
                        color: matchindexes.contains(index)
                            ? Maincolor.accentcolor
                            : Maincolor.secondarycolor,
                      ),
                      child: Center(
                        child: Text(
                          displayxo[index],
                          style: GoogleFonts.coiny(
                            textStyle: TextStyle(
                              fontSize: 64,
                              color: Maincolor.primarycolor,
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
                    Text(resultDeclaration, style: customefonts),
                    SizedBox(height: 10),
                    _buildTimer(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTimer() {
    final isrunning = timer == null ? false : timer!.isActive;

    return isrunning
        ? SizedBox(
            height: 100,
            width: 100,
            child: Stack(
              fit: StackFit.expand,
              children: [
                CircularProgressIndicator(
                  value: 1 - seconds / maxseconds,
                  valueColor: AlwaysStoppedAnimation(Colors.white),
                  strokeAlign: 8,
                  backgroundColor: Maincolor.accentcolor,
                ),
                Center(
                  child: Text(
                    '$seconds',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 50,
                    ),
                  ),
                ),
              ],
            ),
          )
        : ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              padding: EdgeInsets.symmetric(horizontal: 32, vertical: 32),
            ),
            onPressed: () {
              startTimer();
              _clearboard();
              attempt++;
            },
            child: Text(
              attempt == 0 ? 'start' : 'play again',
              style: TextStyle(color: Colors.black, fontSize: 20),
            ),
          );
  }

  void _tapped(int index) {
    final isrunning = timer == null ? false : timer!.isActive;

    if (isrunning) {
      setState(() {
        if (xturn && displayxo[index] == '') {
          filledboxes++;
          displayxo[index] = 'X';
        } else if (!xturn && displayxo[index] == '') {
          filledboxes++;
          displayxo[index] = 'O';
        }
        xturn = !xturn;
        _checkwinner();
      });
    }
  }

  void _checkwinner() {
    if (displayxo[0] == displayxo[1] &&
        displayxo[0] == displayxo[2] &&
        displayxo[0] != '') {
      setState(() {
        resultDeclaration = ' Player ' + displayxo[0] + ' wins ';
        matchindexes.addAll([0, 1, 2]);
        stopTimer();
        _updateScore(displayxo[0]);
      });
    }
    if (displayxo[3] == displayxo[4] &&
        displayxo[3] == displayxo[5] &&
        displayxo[3] != '') {
      setState(() {
        resultDeclaration = ' Player ' + displayxo[3] + ' wins ';
        matchindexes.addAll([3, 4, 5]);
        stopTimer();
        _updateScore(displayxo[3]);
      });
    }
    if (displayxo[6] == displayxo[7] &&
        displayxo[6] == displayxo[8] &&
        displayxo[6] != '') {
      setState(() {
        resultDeclaration = ' Player ' + displayxo[0] + ' wins ';
        matchindexes.addAll([6, 7, 8]);
        stopTimer();
        _updateScore(displayxo[0]);
      });
    }
    if (displayxo[0] == displayxo[3] &&
        displayxo[0] == displayxo[6] &&
        displayxo[0] != '') {
      setState(() {
        resultDeclaration = ' Player' + displayxo[0] + 'wins ';
        matchindexes.addAll([0, 3, 6]);
        stopTimer();
        _updateScore(displayxo[0]);
      });
    }
    if (displayxo[1] == displayxo[4] &&
        displayxo[1] == displayxo[7] &&
        displayxo[1] != '') {
      setState(() {
        resultDeclaration = ' Player ' + displayxo[1] + ' wins ';
        matchindexes.addAll([1, 4, 7]);
        stopTimer();
        _updateScore(displayxo[1]);
      });
    }
    if (displayxo[2] == displayxo[5] &&
        displayxo[2] == displayxo[8] &&
        displayxo[2] != '') {
      setState(() {
        resultDeclaration = ' Player ' + displayxo[2] + ' wins ';
        matchindexes.addAll([2, 5, 8]);
        stopTimer();
        _updateScore(displayxo[2]);
      });
    }
    if (displayxo[0] == displayxo[4] &&
        displayxo[0] == displayxo[8] &&
        displayxo[0] != '') {
      setState(() {
        resultDeclaration = ' Player ' + displayxo[0] + ' wins ';
        matchindexes.addAll([0, 4, 8]);
        stopTimer();
        _updateScore(displayxo[0]);
      });
    }
    if (displayxo[6] == displayxo[4] &&
        displayxo[6] == displayxo[2] &&
        displayxo[6] != '') {
      setState(() {
        resultDeclaration = ' Player ' + displayxo[6] + ' wins ';
        matchindexes.addAll([6, 4, 2]);
        stopTimer();
        _updateScore(displayxo[6]);
      });
    }
    if (!winnerfound && filledboxes == 9) {
      setState(() {
        resultDeclaration = ' NOBODY WINS';
      });
    }
  }

  void _updateScore(String winner) {
    if (winner == 'X') {
      xscore++;
    } else if (winner == 'O') {
      oscore++;
    }
    winnerfound = true;
  }

  void _clearboard() {
    setState(() {
      for (int i = 0; i < 9; i++) {
        displayxo[i] = '';
      }
      resultDeclaration = '';
      matchindexes.clear();
      winnerfound = false;
      xturn = true;
    });
    filledboxes = 0;
  }
}
