// ignore_for_file: prefer_interpolation_to_compose_strings, avoid_print, unused_import
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Game1 extends StatefulWidget {
  const Game1({super.key});

  @override
  State<Game1> createState() => _Game1State();
}

class _Game1State extends State<Game1> {
  int attempt = 0;
  String resultDeclaration = '';
  bool xturn = true;
  int xscore = 0;
  int oscore = 0;
  List<String> displayxo = ['', '', '', '', '', '', '', '', ''];
  bool winnerfound = false;
  int filledboxes = 0;
  List<int> matchindexes = [];

  Timer? time;
  static const maxseconds = 30;
  int seconds = maxseconds;

  starttimer() {
    time = Timer.periodic(Duration(seconds: 1), (_) {
      setState(() {
        if (seconds > 0) {
          seconds--;
        } else {
          stoptimer();
        }
      });
    });
  }

  stoptimer() {
    resetTimer();
    time?.cancel();
  }

  void resetTimer() => seconds = maxseconds;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 1,
              child: Container(
                margin: EdgeInsets.only(top: 40),
                child: Row(
                  children: [
                    Column(
                      children: [
                        SizedBox(height: 20),
                        Text(
                          'PLAYER X',
                          style: GoogleFonts.coiny(
                            fontSize: 30,
                            color: Colors.blue,
                          ),
                        ),
                        Text(
                          xscore.toString(),
                          style: GoogleFonts.coiny(
                            fontSize: 30,
                            color: Colors.blue,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 50),
                    Column(
                      children: [
                        SizedBox(height: 20),
                        Text(
                          'PLAYER O',
                          style: GoogleFonts.coiny(
                            fontSize: 30,
                            color: Colors.blue,
                          ),
                        ),
                        Text(
                          oscore.toString(),
                          style: GoogleFonts.coiny(
                            fontSize: 30,
                            color: Colors.blue,
                          ),
                        ),
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
                        color: matchindexes.contains(index)
                            ? Colors.blue
                            : Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(width: 5, color: Colors.blue),
                      ),

                      child: Center(
                        child: Text(
                          displayxo[index],
                          style: GoogleFonts.coiny(
                            color: matchindexes.contains(index)
                                ? Colors.white
                                : Colors.blue,
                            fontSize: 64,
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
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Text(
                      resultDeclaration,
                      style: GoogleFonts.coiny(
                        fontSize: 33,
                        color: Colors.blue,
                      ),
                    ),
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
    final isrunning = time == null ? false : time!.isActive;

    return isrunning
        ? SizedBox(
            height: 100,
            width: 100,
            child: Stack(
              fit: StackFit.expand,
              children: [
                CircularProgressIndicator(
                  value: 1 - seconds / maxseconds,
                  valueColor: AlwaysStoppedAnimation(Colors.blue),
                  strokeAlign: 8,
                  backgroundColor: Colors.white,
                ),
                Center(
                  child: Text(
                    '$seconds',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
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
              starttimer();
              _clearboard();
              attempt++;
            },
            child: Text(
              attempt == 0 ? ' START' : 'PLAY AGAIN',
              style: GoogleFonts.coiny(fontSize: 32, color: Colors.blue),
            ),
          );
  }

  _tapped(int index) {
    final isrunning = time == null ? false : time!.isActive;
    if (isrunning) {
      setState(() {
        if (displayxo[index] == '') {
          if (xturn && displayxo[index] == '') {
            displayxo[index] = 'X';
            filledboxes++;
          } else if (!xturn && displayxo[index] == '') {
            displayxo[index] = 'O';
            filledboxes++;
          }

          xturn = !xturn;

          _checkwinner();
        }
      });
    }
  }

  _checkwinner() {
    if (displayxo[0] == displayxo[1] &&
        displayxo[0] == displayxo[2] &&
        displayxo[0] != '') {
      setState(() {
        resultDeclaration = ' Player ' + displayxo[0] + ' wins ';
        updatescore(displayxo[0]);
        stoptimer();
        matchindexes.addAll([0, 1, 2]);
      });
    }
    if (displayxo[3] == displayxo[4] &&
        displayxo[3] == displayxo[5] &&
        displayxo[3] != '') {
      setState(() {
        resultDeclaration = ' Player ' + displayxo[3] + ' wins ';
        updatescore(displayxo[3]);
        stoptimer();
        matchindexes.addAll([3, 4, 5]);
      });
    }
    if (displayxo[6] == displayxo[7] &&
        displayxo[6] == displayxo[8] &&
        displayxo[6] != '') {
      setState(() {
        resultDeclaration = ' Player ' + displayxo[6] + ' wins ';
        updatescore(displayxo[6]);
        stoptimer();
        matchindexes.addAll([6, 7, 8]);
      });
    }
    if (displayxo[0] == displayxo[3] &&
        displayxo[0] == displayxo[6] &&
        displayxo[0] != '') {
      setState(() {
        resultDeclaration = ' Player ' + displayxo[0] + ' wins ';
        updatescore(displayxo[0]);
        stoptimer();
        matchindexes.addAll([0, 3, 6]);
      });
    }
    if (displayxo[1] == displayxo[4] &&
        displayxo[1] == displayxo[7] &&
        displayxo[1] != '') {
      setState(() {
        resultDeclaration = ' Player ' + displayxo[1] + ' wins ';
        updatescore(displayxo[1]);
        stoptimer();
        matchindexes.addAll([1, 4, 7]);
      });
    }
    if (displayxo[2] == displayxo[5] &&
        displayxo[2] == displayxo[8] &&
        displayxo[2] != '') {
      setState(() {
        resultDeclaration = ' Player ' + displayxo[2] + ' wins ';
        updatescore(displayxo[2]);
        stoptimer();
        matchindexes.addAll([2, 5, 8]);
      });
    }
    if (displayxo[0] == displayxo[4] &&
        displayxo[0] == displayxo[8] &&
        displayxo[0] != '') {
      setState(() {
        resultDeclaration = ' Player ' + displayxo[0] + ' wins ';
        updatescore(displayxo[0]);
        stoptimer();
        matchindexes.addAll([0, 4, 8]);
      });
    }
    if (displayxo[2] == displayxo[4] &&
        displayxo[2] == displayxo[6] &&
        displayxo[2] != '') {
      setState(() {
        resultDeclaration = ' Player ' + displayxo[2] + ' wins ';
        updatescore(displayxo[2]);
        stoptimer();
        matchindexes.addAll([2, 4, 6]);
      });
    } else if (!winnerfound && filledboxes == 9) {
      resultDeclaration = ' THE MATCH ENDED IN A DRAW';
      stoptimer();
    }
  }

  updatescore(String winner) {
    if (winner == 'X') {
      xscore++;
    } else if (winner == 'O') {
      oscore++;
    }
  }

  _clearboard() {
    setState(() {
      for (int i = 0; i < 9; i++) {
        displayxo[i] = '';
      }
      filledboxes = 0;
      xturn = true;
      winnerfound = false;
      resultDeclaration = '';
      filledboxes = 0;
      matchindexes.clear();
    });
  }
}
