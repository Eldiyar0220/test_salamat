import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MegaFormField extends StatelessWidget {
  const MegaFormField({
    super.key,
    this.maxLength,
    this.maxLines,
    this.mask,
    this.leading,
    this.suffix,
    this.prefix,
    this.prefixText,
    this.focus,
    this.keyboardType,
    this.hintText,
    this.hintStyle,
    this.labelText,
    this.isOutline,
    this.helpText,
    this.textEditingController,
    this.validator,
    this.onSave,
    this.inputKey,
    this.contentPadding,
    this.obscure = false,
    this.enabled = true,
    this.enableClearBtn = true,
    this.onChanged,
    this.onlyNumAndSym = false,
    this.onlyLetters = false,
    this.inputFormatters,
    this.fillColor,
    this.onFieldSubmitted,
    this.style,
    this.prefixStyle,
    this.suffixIcon,
    this.textCapitalization = TextCapitalization.none,
    this.textInputAction,
    this.onTapOutside,
    this.isContentPaddingNull = false,
  });

  final Function(String)? onFieldSubmitted;
  final List<TextInputFormatter>? inputFormatters;
  final Widget? leading;
  final Widget? suffix;
  final Widget? suffixIcon;
  final Widget? prefix;
  final String? prefixText;
  final TextInputType? keyboardType;
  final TextEditingController? textEditingController;
  final String? labelText;
  final FormFieldValidator<String>? validator;
  final FormFieldSetter<String>? onSave;
  final String? hintText;
  final TextStyle? hintStyle;
  final String? helpText;
  final bool? isOutline;
  final EdgeInsets? contentPadding;
  final Key? inputKey;
  final int? maxLength;
  final int? maxLines;
  final bool obscure;
  final bool enabled;
  final bool enableClearBtn;
  final dynamic mask;
  final Function(String value)? onChanged;
  final FocusNode? focus;
  final bool? onlyNumAndSym;
  final bool? onlyLetters;
  final TextCapitalization textCapitalization;
  final Color? fillColor;
  final TextStyle? style;
  final TextStyle? prefixStyle;
  final TextInputAction? textInputAction;
  final Function(PointerDownEvent)? onTapOutside;
  final bool isContentPaddingNull;

  void _clearText() {
    if (textEditingController != null) {
      WidgetsBinding.instance
          .addPostFrameCallback((_) => textEditingController!.clear());
    }
  }

  @override
  Widget build(BuildContext context) {
    final suffixSecond = enableClearBtn
        ? GestureDetector(
            child: const Icon(Icons.close), onTap: () => _clearText())
        : suffix;

    return TextFormField(
      maxLines: maxLines,
      textInputAction: textInputAction,
      onFieldSubmitted: onFieldSubmitted,
      textCapitalization: textCapitalization,
      key: inputKey,
      autofocus: false,
      autocorrect: false,
      enabled: enabled,
      keyboardType: keyboardType,
      controller: textEditingController,
      validator: validator,
      onSaved: onSave,
      onChanged: onChanged,
      maxLength: maxLength,
      focusNode: focus,
      obscureText: obscure,
      // style: style ??
      //     AppThemeHelper.style.bold16
      //         .copyWith(color: AppThemeHelper.colors.textBlack),
      decoration: InputDecoration(
          counter: const SizedBox(),
          filled: isOutline == true ? true : false,
          // fillColor: enabled == true
          //     ? fillColor ?? AppThemeHelper.colors.background
          //     : AppThemeHelper.colors.llGray,
          icon: leading,
          prefixText: prefixText,
          prefix: prefix,
          // prefixStyle: prefixStyle ??
          //     AppThemeHelper.style.bold16.copyWith(
          //       color: AppThemeHelper.colors.textBlack,
          //     ),
          counterStyle: const TextStyle(color: Colors.transparent),
          suffix: suffixSecond,
          suffixIcon: suffixIcon,
          contentPadding: isContentPaddingNull
              ? null
              : contentPadding ??
                  (isOutline == true
                      ? const EdgeInsets.only(bottom: 6, left: 16)
                      : const EdgeInsets.only(bottom: 6)),
          border: InputBorder.none,
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          focusedErrorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          // labelStyle: AppThemeHelper.style.medium16
          //     .copyWith(color: AppThemeHelper.colors.inputBorderColor),
          // hintStyle: hintStyle ??
          //     AppThemeHelper.style.regular14
          //         .copyWith(color: AppThemeHelper.colors.inputBorderColor),
          labelText: labelText,
          helperText: helpText,
          errorStyle: const TextStyle(fontSize: 0, height: 0),
          // helperStyle: AppThemeHelper.style.regular14
          //     .copyWith(color: AppThemeHelper.colors.darkGray),
          hintText: hintText),
      inputFormatters: onlyNumAndSym!
          ? [
              FilteringTextInputFormatter.allow(
                RegExp('[a-zA-Z0-9]'),
              ),
            ]
          : onlyLetters!
              ? [
                  FilteringTextInputFormatter.allow(
                    RegExp(r'[a-zA-Zа-яёА-яё]+|\s'),
                  ),
                ]
              : inputFormatters,
    );
  }
}
