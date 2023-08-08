import 'package:flutter/material.dart';
import 'package:timer_xadrez/core/app_colors.dart';
import 'package:timer_xadrez/core/app_text.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
            Container(
              padding: const EdgeInsets.all(8),
              child: const Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      OutlinedButton(
                        onPressed: null,
                        style: ButtonStyle(
                          padding: MaterialStatePropertyAll(
                              EdgeInsets.symmetric(
                                  vertical: 16.0, horizontal: 62.0)),
                          backgroundColor:
                              MaterialStatePropertyAll(AppColors.green),
                        ),
                        child: Text(
                          'check',
                          style: AppText.body,
                        ),
                      ),
                      OutlinedButton(
                        onPressed: null,
                        style: ButtonStyle(
                          padding: MaterialStatePropertyAll(
                              EdgeInsets.symmetric(
                                  vertical: 16.0, horizontal: 48.0)),
                          backgroundColor:
                              MaterialStatePropertyAll(AppColors.green),
                        ),
                        child: Text(
                          'checkmate',
                          style: AppText.body,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 48,
                  ),
                  Text(
                    '00:00',
                    style: AppText.timerText,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
