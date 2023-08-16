import 'dart:async';

import 'package:flutter/material.dart';
import 'package:timer_xadrez/core/app_colors.dart';
import 'package:timer_xadrez/core/app_text.dart';
import 'package:timer_xadrez/pages/home_page.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage>{

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color.fromARGB(255, 18, 32, 47),
      ),
      home: Scaffold(
        body: ListView(children: [
          Menu(),
        ]),
      ),
    );
  }
}

class Menu extends StatelessWidget {

  _goToHistory(){

  }
  _goToProfile(){

  }
  _goToStartMatch(BuildContext context) async{
    late Widget page = const HomePage();
    String something = "";
    try {
      something = await push(context, page);
    } catch (error){
      something = "Saída forçada";
    }
    print(something);
  }
  _goToRanking(){

  }

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    final profile = localizations != null ? localizations.profile : 'profile';
    final matchHistory = localizations != null ? localizations.matchHistory : 'Match History';
    final startMatch = localizations != null ? localizations.startMatch : 'Start Match';
    final ranking = localizations != null ? localizations.ranking : 'Ranking';


    return Column(
      children: [
        Container(
          width: 430,
          height: 932,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(color: Color(0xFF011F23)),
          child: Stack(
            children: [
              Positioned(
                left: 136,
                top: 215,
                child: const Text(
                  //Substituir o item abaixo pelo nome do app
                  'Nome do App',
                  style: TextStyle(
                    color: Color(0xFFAFB3B7),
                    fontSize: 24,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Positioned(
                left: 18,
                top: 516,
                child: SizedBox(
                  width: 180,
                  height: 180,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 180,
                          height: 180,
                          decoration: ShapeDecoration(
                            color: AppColors.green,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 20,
                        top: 66,
                        child: SizedBox(
                          width: 141,
                          height: 48,
                          child: ElevatedButton(
                            onPressed: null,
                            style: const ButtonStyle(
                              padding: MaterialStatePropertyAll(
                                  EdgeInsets.symmetric(
                                      vertical: 1.0, horizontal: 1.0)),
                              backgroundColor:
                              MaterialStatePropertyAll(AppColors.green),
                          ),
                          child: Text(
                            matchHistory,
                            textAlign: TextAlign.center,
                            style: AppText.body,
                          ),
                        ),
                      ),
                      )
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 233,
                top: 516,
                child: SizedBox(
                  width: 180,
                  height: 180,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 180,
                          height: 180,
                          decoration: ShapeDecoration(
                            color: AppColors.green,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 20,
                        top: 88,
                        child: SizedBox(
                          width: 141,
                          height: 18,
                          child: ElevatedButton(
                            onPressed: null,
                            style: const ButtonStyle(
                              padding: MaterialStatePropertyAll(
                                  EdgeInsets.symmetric(
                                      vertical: 1.0, horizontal: 1.0)),
                              backgroundColor:
                              MaterialStatePropertyAll(AppColors.green),
                            ),
                          child: Text(
                            profile,
                            textAlign: TextAlign.center,
                            style: AppText.body,
                          ),
                        ),
                      ),
                      )
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 18,
                top: 386,
                child: SizedBox(
                  width: 395,
                  height: 108,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 395,
                          height: 108,
                          decoration: ShapeDecoration(
                            color: AppColors.green,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 135,
                        top: 44,
                        child: SizedBox(
                          width: 125,
                          height: 20,
                          child: ElevatedButton(
                            onPressed: () => _goToStartMatch,
                            style: const ButtonStyle(
                              padding: MaterialStatePropertyAll(
                                  EdgeInsets.symmetric(
                                      vertical: 1.0, horizontal: 1.0)),
                              backgroundColor:
                              MaterialStatePropertyAll(AppColors.green),
                            ),
                          child: Text(
                            startMatch,
                            textAlign: TextAlign.center,
                            style: AppText.body,
                          ),
                        ),
                      ),
                      )
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 18,
                top: 718,
                child: SizedBox(
                  width: 395,
                  height: 139,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 395,
                          height: 139,
                          decoration: ShapeDecoration(
                            color: AppColors.green,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 135,
                        top: 56.63,
                        child: SizedBox(
                          width: 125,
                          height: 25.74,
                          child: ElevatedButton(
                            onPressed: null,
                            style: const ButtonStyle(
                              padding: MaterialStatePropertyAll(
                                  EdgeInsets.symmetric(
                                      vertical: 1.0, horizontal: 1.0)),
                              backgroundColor:
                              MaterialStatePropertyAll(AppColors.green),
                            ),
                          child: Text(
                            ranking,
                            textAlign: TextAlign.center,
                            style: AppText.body,
                          ),
                        ),
                      ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Future push(BuildContext context, Widget page, {bool flagBack=true})
  {
    if (flagBack)
    {
      return Navigator.push(
          context,
          MaterialPageRoute(builder: (BuildContext context) { return page; })
      );
    }
    else
    {
      return Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (BuildContext context) { return page; })
      );
    }
  }
}