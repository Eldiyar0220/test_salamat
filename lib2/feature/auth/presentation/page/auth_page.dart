import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import '../../../../../lib2/core/components/mega_text_animation.dart';
import '../../../../../lib2/core/constant/app_images.dart';
import '../../../../../lib2/feature/introduction_animation/introduction_animation_screen.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool hideInput = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff000D39),
      appBar: AppBar(
        backgroundColor: const Color(0xff000D39),
        title: AnimatedTextKit(
          repeatForever: false, totalRepeatCount: 2,
          animatedTexts: [
            TypewriterAnimatedText(
              'Регистрация',
              textStyle: const TextStyle(
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
              speed: const Duration(milliseconds: 100),
            ),
          ],
          // onTap: onTap,
        ),

        //  const Text(
        //   'Регистрация',
        //   style: TextStyle(color: Colors.white),
        // ),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Image.asset(AppImages.fivs),
                    const SizedBox(height: 20),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        'Пожалуйста, введите ваш адрес электронной почты и придумайте пароль, чтобы начать изучение кыргызского языка с нами. 😂👍 ',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(height: 20),
                    MegaTweenAnimations.appearWidget(
                      duration: const Duration(milliseconds: 1200),
                      child: TextFieldWidget(
                        labelText: 'Email',
                        validator: (v) {
                          if (v?.isEmpty == true) {
                            return 'Обезательное поле';
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(height: 15),
                    MegaTweenAnimations.appearWidget(
                      duration: const Duration(milliseconds: 1400),
                      child: TextFieldWidget(
                        obscureText: hideInput,
                        labelText: 'Пароль',
                        validator: (v) {
                          if (v?.isEmpty == true) {
                            return 'Обезательное поле';
                          }
                          return null;
                        },
                        suffixIcon: IconButton(
                          onPressed: () {
                            hideInput = !hideInput;
                            setState(() {});
                          },
                          icon: Icon(
                            hideInput ? Icons.visibility : Icons.visibility_off,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    // const Spacer(),
                  ],
                ),
              ),
            ),
            SafeArea(
              child: MegaTweenAnimations.slideWidget(
                curve: Curves.bounceInOut,
                finish: 0,
                begin: 2,
                offsetBuilder: (value) {
                  return Offset(0, value);
                },
                duration: const Duration(milliseconds: 1000),
                child: GestureDetector(
                  onTap: () {
                    if (_formKey.currentState?.validate() == true) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const IntroductionAnimationScreen()),
                      );
                    }
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 16,
                    ),
                    margin: const EdgeInsets.only(
                      left: 16,
                      right: 16,
                      bottom: 15,
                    ),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.yellow,
                    ),
                    child: const Text(
                      'Подтвердить',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FloatingBottomArea extends StatelessWidget {
  const FloatingBottomArea({
    super.key,
    required this.child,
    required this.areaContent,
  });
  final Widget child;
  final Widget areaContent;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[Expanded(child: child), areaContent],
    );
  }
}

class TextFieldWidget extends StatefulWidget {
  const TextFieldWidget({
    super.key,
    required this.labelText,
    this.suffixIcon,
    this.validator,
    this.obscureText = false,
  });

  final String labelText;
  final Widget? suffixIcon;
  final bool obscureText;
  final String? Function(String? value)? validator;

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  final borderT = const OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(10),
    ),
    borderSide: BorderSide(
      color: Colors.yellow,
    ),
  );
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: TextFormField(
        // maxLines: maxLines,
        // textInputAction: textInputAction,
        // onFieldSubmitted: onFieldSubmitted,
        // textCapitalization: textCapitalization,
        autofocus: false,
        autocorrect: false,
        enabled: true,
        // keyboardType: keyboardType,
        // controller: textEditingController,
        // validator: validator,
        // onSaved: onSave,
        // onChanged: onChanged,
        // maxLength: maxLength,
        // focusNode: focus,
        validator: widget.validator,
        obscureText: widget.obscureText,
        style: const TextStyle(color: Colors.white),
        //     AppThemeHelper.style.bold16
        //         .copyWith(color: AppThemeHelper.colors.textBlack),
        decoration: InputDecoration(
          counter: const SizedBox(),
          filled: true,
          fillColor: const Color.fromARGB(255, 0, 5, 23),
          //     ? fillColor ?? AppThemeHelper.colors.background
          //     : AppThemeHelper.colors.llGray,
          // icon: fi,
          // prefixText: prefixText,
          // prefix: prefix,
          // prefixStyle: prefixStyle ??
          //     AppThemeHelper.style.bold16.copyWith(
          //       color: AppThemeHelper.colors.textBlack,
          //     ),
          counterStyle: const TextStyle(color: Colors.transparent),
          // suffix: suffixSecond,
          suffixIcon: widget.suffixIcon,
          border: borderT,
          enabledBorder: borderT,
          focusedBorder: borderT,
          focusedErrorBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
            borderSide: BorderSide(
              color: Colors.red,
            ),
          ),
          disabledBorder: InputBorder.none,
          errorBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
            borderSide: BorderSide(
              color: Colors.red,
            ),
          ),
          labelStyle: const TextStyle(
            color: Colors.white,
          ),
          hintStyle: const TextStyle(
            color: Colors.white,
          ),
          labelText: widget.labelText,
          helperText: '',
          // error: ,
          errorStyle: const TextStyle(fontSize: 13),
          // helperStyle: AppThemeHelper.style.regular14
          //     .copyWith(color: AppThemeHelper.colors.darkGray),
          hintText: 'Введите',
        ),
      ),
    );
  }
}
