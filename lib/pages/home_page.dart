import 'dart:async';

import 'package:flutter/material.dart';
import 'package:timer_xadrez/core/app_colors.dart';
import 'package:timer_xadrez/core/app_text.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Player 1
  int _minutes1 = 15;
  int _seconds1 = 0;
  bool _isRunning1 = false;
  late Timer _timer1;
  bool _won1 = false;
  int _totalMoves1 = 0;
  double _timePerMove1 = 0;

  // Player 2
  int _minutes2 = 15;
  int _seconds2 = 0;
  bool _isRunning2 = false;
  late Timer _timer2;
  bool _won2 = false;
  int _totalMoves2 = 0;
  double _timerPerMove2 = 0;

  void _toggleTimer1() {
    if (!_isRunning1) {
      _totalMoves1++;
      _isRunning1 = true;
      _won1 = false;
      _timer1 = Timer.periodic(const Duration(seconds: 1), (Timer timer) {
        setState(() {
          if (_minutes1 == 0 && _seconds1 == 0) {
            _isRunning1 = false;
            timer.cancel();
          } else if (_seconds1 > 0) {
            _seconds1--;
          } else {
            _minutes1--;
            _seconds1 = 59;
          }
        });
      });
    } else {
      _isRunning1 = false;
      _timer1.cancel();
      _toggleTimer2();
    }
  }

  void _toggleTimer2() {
    if (!_isRunning2) {
      _totalMoves2++;
      _isRunning2 = true;
      _won2 = false;
      _timer2 = Timer.periodic(const Duration(seconds: 1), (Timer timer) {
        setState(() {
          if (_minutes2 == 0 && _seconds2 == 0) {
            _isRunning2 = false;
            timer.cancel();
          } else if (_seconds2 > 0) {
            _seconds2--;
          } else {
            _minutes2--;
            _seconds2 = 59;
          }
        });
      });
    } else {
      _isRunning2 = false;
      _timer2.cancel();
      _toggleTimer1();
    }
  }

  void _resetTimer1() {
    _isRunning1 = false;
    _won1 = false;
    _totalMoves1 = 0;
    _timer1.cancel();
    setState(() {
      _minutes1 = 15;
      _seconds1 = 0;
    });
  }

  void _resetTimer2() {
    _isRunning2 = false;
    _won2 = false;
    _totalMoves2 = 0;
    _timer2.cancel();
    setState(() {
      _minutes2 = 15;
      _seconds2 = 0;
    });
  }

  void _checkmate1() {
    _isRunning1 = false;
    _timer1.cancel();
    _isRunning2 = false;
    _timer2.cancel();
    setState(() {
      _won1 = true;
    });
  }

  void _checkmate2() {
    _isRunning1 = false;
    _timer1.cancel();
    _isRunning2 = false;
    _timer2.cancel();
    setState(() {
      _won2 = true;
    });
  }

  void _resetTimer() {
    _resetTimer1();
    _resetTimer2();
  }

  String _timerTextFormated({required int minutes, required int seconds}) {
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }

  String _getTimerPerMoves(
      {required int totalMoves, required int minutes, required int seconds}) {
    var timePassedInSeconds = (15 * 60) - (minutes * 60 + seconds);
    if (timePassedInSeconds == 0 || totalMoves == 0) {
      return '00:00';
    }

    var averageTimePerMove = timePassedInSeconds / (totalMoves - 1);
    var averageMinutes = (averageTimePerMove / 60).floor();
    var averageSeconds = (averageTimePerMove % 60).toInt();

    return _timerTextFormated(minutes: averageMinutes, seconds: averageSeconds);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsetsDirectional.symmetric(
            horizontal: 8.0, vertical: 25.0),
        alignment: AlignmentDirectional.center,
        color: AppColors.background,
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Transform(
                alignment: Alignment.center,
                transform: Matrix4.rotationX(3.14159),
                child: Container(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Transform(
                        alignment: Alignment.center,
                        transform: Matrix4.rotationY(3.14159),
                        child: Text(
                          _timerTextFormated(
                              minutes: _minutes1, seconds: _seconds1),
                          style: TextStyle(
                              color: _won1 == false
                                  ? AppColors.text
                                  : AppColors.winner,
                              fontSize: 56.0),
                        ),
                      ),
                      const SizedBox(height: 70),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Transform(
                            alignment: Alignment.center,
                            transform: Matrix4.rotationY(3.14159),
                            child: ElevatedButton(
                              onPressed: _checkmate1,
                              style: const ButtonStyle(
                                padding: MaterialStatePropertyAll(
                                    EdgeInsets.symmetric(
                                        vertical: 16.0, horizontal: 48.0)),
                                backgroundColor:
                                    MaterialStatePropertyAll(AppColors.green),
                              ),
                              child: const Text(
                                'checkmate',
                                style: AppText.body,
                              ),
                            ),
                          ),
                          Transform(
                            alignment: Alignment.center,
                            transform: Matrix4.rotationY(3.14159),
                            child: ElevatedButton(
                              onPressed: _toggleTimer1,
                              style: const ButtonStyle(
                                padding: MaterialStatePropertyAll(
                                    EdgeInsets.symmetric(
                                        vertical: 16.0, horizontal: 62.0)),
                                backgroundColor:
                                    MaterialStatePropertyAll(AppColors.green),
                              ),
                              child: const Text(
                                'check',
                                style: AppText.body,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    IconButton(
                      onPressed: _resetTimer,
                      icon: const Icon(
                        Icons.restore,
                        size: 40.0,
                        color: AppColors.text,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (BuildContext context) {
                            return Container(
                              color: AppColors.green,
                              child: Column(
                                children: <Widget>[
                                  Expanded(
                                    flex: 1,
                                    child: Transform(
                                      alignment: Alignment.center,
                                      transform: Matrix4.rotationX(3.14159),
                                      child: Transform(
                                        alignment: Alignment.center,
                                        transform: Matrix4.rotationY(3.14159),
                                        child: Column(
                                          children: <Widget>[
                                            const Text(
                                              'Player 1',
                                              style: TextStyle(
                                                fontSize: 28,
                                                color: AppColors.text,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 20.0,
                                            ),
                                            Align(
                                              alignment: Alignment.topLeft,
                                              child: Column(
                                                children: <Widget>[
                                                  Text(
                                                    'Total de movimentos: $_totalMoves1',
                                                    style: const TextStyle(
                                                      fontSize: 22,
                                                      color: AppColors.text,
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    height: 8.0,
                                                  ),
                                                  Text(
                                                    'Tempo médio por rodada: ${_getTimerPerMoves(totalMoves: _totalMoves1, minutes: _minutes1, seconds: _seconds1)}',
                                                    style: const TextStyle(
                                                      fontSize: 22,
                                                      color: AppColors.text,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 48,
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Column(
                                      children: [
                                        const Text(
                                          'Player 2',
                                          style: TextStyle(
                                            fontSize: 28,
                                            color: AppColors.text,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        Align(
                                          alignment: Alignment.topLeft,
                                          child: Column(
                                            children: <Widget>[
                                              Text(
                                                'Total de movimentos: $_totalMoves2',
                                                style: const TextStyle(
                                                  fontSize: 22,
                                                  color: AppColors.text,
                                                ),
                                              ),
                                              Text(
                                                'Tempo médio por rodada: ${_getTimerPerMoves(totalMoves: _totalMoves2, minutes: _minutes2, seconds: _seconds2)}',
                                                style: const TextStyle(
                                                  fontSize: 22,
                                                  color: AppColors.text,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      },
                      icon: const Icon(
                        Icons.menu_open,
                        size: 40.0,
                        color: AppColors.text,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                padding: const EdgeInsets.all(8),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      _timerTextFormated(
                          minutes: _minutes2, seconds: _seconds2),
                      style: TextStyle(
                        color:
                            _won2 == false ? AppColors.text : AppColors.winner,
                        fontSize: 56.0,
                      ),
                    ),
                    const SizedBox(
                      height: 90,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton(
                          onPressed: _toggleTimer2,
                          style: const ButtonStyle(
                            padding: MaterialStatePropertyAll(
                                EdgeInsets.symmetric(
                                    vertical: 16.0, horizontal: 62.0)),
                            backgroundColor:
                                MaterialStatePropertyAll(AppColors.green),
                          ),
                          child: const Text(
                            'check',
                            style: AppText.body,
                          ),
                        ),
                        ElevatedButton(
                          onPressed: _checkmate2,
                          style: const ButtonStyle(
                            padding: MaterialStatePropertyAll(
                                EdgeInsets.symmetric(
                                    vertical: 16.0, horizontal: 48.0)),
                            backgroundColor:
                                MaterialStatePropertyAll(AppColors.green),
                          ),
                          child: const Text(
                            'checkmate',
                            style: AppText.body,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
