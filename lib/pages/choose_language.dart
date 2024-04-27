import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_lang/constants.dart';
import 'package:learning_lang/models/language_model.dart';
import 'package:learning_lang/pages/dashboard.dart';
import 'package:learning_lang/widgets/language_selector.dart';
import 'package:learning_lang/widgets/primary_button.dart';

class ChooseLanguage extends StatefulWidget {
  const ChooseLanguage({super.key});

  @override
  _ChooseLanguageState createState() => _ChooseLanguageState();
}

List<LanguageModel> languages = [
  LanguageModel(
    language: "Spanish",
    imagePath: "assets/images/spain.png",
  ),
  LanguageModel(
    language: "English",
    imagePath: "assets/images/england.png",
  ),
  LanguageModel(
    language: "German",
    imagePath: "assets/images/germany.png",
  ),
  LanguageModel(
    language: "Korean",
    imagePath: "assets/images/korea.png",
  ),
  LanguageModel(
    language: "Polish",
    imagePath: "assets/images/poland.png",
  ),
  LanguageModel(
    language: "Italian",
    imagePath: "assets/images/italy.png",
  ),
];

class _ChooseLanguageState extends State<ChooseLanguage> {
  int _activeIndex = -1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(
                  height: 30.0,
                ),
                const Text(
                  "Choose the Language",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 28.0,
                    fontWeight: FontWeight.w600,
                    color: Constants.primaryTextColor,
                  ),
                ),
                const SizedBox(
                  height: 35.0,
                ),
                ...languages.map((language) {
                  int currentIndex = languages.indexOf(language);
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        _activeIndex = currentIndex;
                      });
                    },
                    child: LanguageSelector(
                      isActive: _activeIndex == currentIndex,
                      language: language.language,
                      imagePath: language.imagePath,
                    ),
                  );
                }).toList(),
                AnimatedCrossFade(
                  crossFadeState: _activeIndex == -1
                      ? CrossFadeState.showFirst
                      : CrossFadeState.showSecond,
                  duration: const Duration(milliseconds: 450),
                  firstChild: Container(
                    height: ScreenUtil().setHeight(50.0),
                  ),
                  secondChild: PrimaryButton(
                    text: "Continue",
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (BuildContext context) {
                            return Dashboard();
                          },
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
