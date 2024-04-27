// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:learning_lang/core/components/text_field/form_filed.dart';

// // class CustomTextEditingController extends TextEditingController {
// //   CustomTextEditingController({super.text});

// //   DateTime? _dateTime;

// //   DateTime get dateTime => _dateTime ?? DateTime.now();
// //   set dateTime(DateTime? dateTime) {
// //     _dateTime = dateTime;
// //   }
// // }

// // class MegaOutlinedField extends StatefulWidget {
// //   const MegaOutlinedField({
// //     super.key,
// //     this.maxLength,
// //     this.maxLines,
// //     this.mask,
// //     this.leading,
// //     this.suffix,
// //     this.prefixText,
// //     this.focus,
// //     this.keyboardType,
// //     this.hintText,
// //     this.labelText,
// //     this.helpText,
// //     this.textEditingController,
// //     this.validator,
// //     this.onSave,
// //     this.inputKey,
// //     this.contentPadding,
// //     this.enableClearBtn = true,
// //     this.obscure = false,
// //     this.enabled = true,
// //     this.onChanged,
// //     this.onlyNumAndSym = false,
// //     this.onlyLetters = false,
// //     this.clearInputFunc,
// //     this.icon,
// //     this.prefixStyle,
// //     this.prefix,
// //   });
// //   final Widget? leading;
// //   final Widget? suffix;
// //   final String? prefix;
// //   final String? prefixText;
// //   final TextInputType? keyboardType;
// //   final TextEditingController? textEditingController;
// //   final String? labelText;
// //   final FormFieldValidator<String>? validator;
// //   final FormFieldSetter<String>? onSave;
// //   final String? hintText;
// //   final String? helpText;
// //   final EdgeInsets? contentPadding;
// //   final Key? inputKey;
// //   final int? maxLength;
// //   final int? maxLines;
// //   final bool obscure;
// //   final bool enableClearBtn;
// //   final bool enabled;
// //   final dynamic mask;
// //   final Function(String value)? onChanged;
// //   final FocusNode? focus;
// //   final bool? onlyNumAndSym;
// //   final bool? onlyLetters;
// //   final Function()? clearInputFunc;
// //   final Widget? icon;
// //   final TextStyle? prefixStyle;

// //   @override
// //   State<MegaOutlinedField> createState() => _MegaOutlinedFieldState();
// // }

// // class _MegaOutlinedFieldState extends State<MegaOutlinedField> {
// //   FocusNode? _focusNode;
// //   bool _hasFocus = false;
// //   String? _errorText;

// //   String? _processValidator(String? value) {
// //     if (widget.validator != null) {
// //       setState(() {
// //         _errorText = widget.validator!(value);
// //       });
// //     }
// //     return _errorText;
// //   }

// //   void _clearText() {
// //     if (widget.textEditingController != null) {
// //       WidgetsBinding.instance.addPostFrameCallback(
// //         (_) => widget.textEditingController!.clear(),
// //       );
// //       if (widget.clearInputFunc != null) {
// //         widget.clearInputFunc!();
// //       }
// //     }
// //   }

// //   @override
// //   void initState() {
// //     super.initState();
// //     _focusNode = widget.focus ?? FocusNode();
// //     _focusNode!.addListener(() {
// //       if (!mounted) return;
// //       setState(() {
// //         _hasFocus = _focusNode!.hasFocus;
// //       });
// //     });
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Column(
// //       crossAxisAlignment: CrossAxisAlignment.start,
// //       mainAxisSize: MainAxisSize.min,
// //       children: [
// //         Container(
// //           padding: const EdgeInsets.symmetric(horizontal: 5).copyWith(top: 8),
// //           decoration: BoxDecoration(
// //             color: widget.enabled
// //                 ? AppThemeHelper.colors.background
// //                 : AppThemeHelper.colors.llGray,
// //             borderRadius: BorderRadius.circular(10),
// //             border: widget.enabled
// //                 ? Border.all(
// //                     color: _errorText != null
// //                         ? AppThemeHelper.colors.red
// //                         : _hasFocus
// //                             ? AppThemeHelper.colors.dGray
// //                             : AppThemeHelper.colors.inputBorderColor,
// //                     width: 1)
// //                 : null,
// //           ),
// //           child: Row(
// //             children: [
// //               Expanded(
// //                 child: MegaFormField(
// //                   prefixStyle: widget.prefixStyle,
// //                   prefixText: widget.prefixText,
// //                   focus: _focusNode,
// //                   isOutline: true,
// //                   enableClearBtn: false,
// //                   contentPadding: const EdgeInsets.symmetric(horizontal: 8),
// //                   enabled: widget.enabled,
// //                   hintText: widget.hintText,
// //                   inputKey: widget.inputKey,
// //                   keyboardType: widget.keyboardType,
// //                   leading: widget.leading,
// //                   mask: widget.mask,
// //                   maxLength: widget.maxLength,
// //                   maxLines: widget.maxLines,
// //                   obscure: widget.obscure,
// //                   onChanged: widget.onChanged,
// //                   onSave: widget.onSave,
// //                   suffix: widget.suffix,
// //                   textEditingController: widget.textEditingController,
// //                   validator: (value) => _processValidator(value),
// //                   labelText: widget.labelText,
// //                   onlyNumAndSym: widget.onlyNumAndSym,
// //                   onlyLetters: widget.onlyLetters,
// //                 ),
// //               ),
// //               widget.icon != null
// //                   ? Padding(
// //                       padding: const EdgeInsets.only(right: 20, bottom: 6),
// //                       child: widget.icon)
// //                   : _hasFocus == true && widget.enableClearBtn == true
// //                       ? Padding(
// //                           padding: const EdgeInsets.only(right: 20),
// //                           child: GestureDetector(
// //                             onTap: () => _clearText(),
// //                             child: Icon(
// //                               Icons.close,
// //                               size: 24,
// //                               color: AppThemeHelper.colors.textBlack,
// //                             ),
// //                           ))
// //                       : const SizedBox(
// //                           height: 0,
// //                           width: 0,
// //                         )
// //             ],
// //           ),
// //         ),
// //         const SizedBox(
// //           height: 8,
// //         ),
// //         _errorText != null
// //             ? Text(
// //                 '$_errorText',
// //                 style: AppThemeHelper.style.regular12
// //                     .copyWith(color: AppThemeHelper.colors.red),
// //               )
// //             : widget.helpText != null
// //                 ? Text(
// //                     '${widget.helpText}',
// //                     style: AppThemeHelper.style.regular12.copyWith(
// //                       color: AppThemeHelper.colors.dGray,
// //                     ),
// //                   )
// //                 : const SizedBox(
// //                     height: 0,
// //                     width: 0,
// //                   )
// //       ],
// //     );
// //   }
// // }

// class OutlinedNewMegaField extends StatefulWidget {
//   const OutlinedNewMegaField({
//     super.key,
//     this.maxLength,
//     this.maxLines,
//     this.mask,
//     this.leading,
//     this.suffix,
//     this.prefix,
//     this.focus,
//     this.keyboardType,
//     this.hintText,
//     this.hintStyle,
//     this.helpText,
//     this.textEditingController,
//     this.validator,
//     this.onSave,
//     this.inputKey,
//     this.contentPadding,
//     this.enableClearBtn = true,
//     this.obscure = false,
//     this.enabled = true,
//     this.onChanged,
//     this.suffixIcon,
//     this.onlyNumAndSym = false,
//     this.labelText,
//     this.isUnableColor = false,
//     this.inputFormatters,
//     this.fillColor,
//     this.onlyLetters = false,
//     this.onFieldSubmitted,
//     this.style,
//     this.textCapitalization = TextCapitalization.none,
//     this.textInputAction,
//     this.onTapOutside,
//     this.enableClearAll = true,
//     this.isOutline = true,
//     this.isContentPaddingNull = false,
//     this.errorTextWidget,
//   });

//   final Function(String)? onFieldSubmitted;
//   final List<TextInputFormatter>? inputFormatters;
//   final Widget? leading;
//   final Widget? suffix;
//   final Widget? suffixIcon;
//   final Widget? prefix;
//   final TextInputType? keyboardType;
//   final TextEditingController? textEditingController;
//   final FormFieldValidator<String>? validator;
//   final FormFieldSetter<String>? onSave;
//   final String? hintText;
//   final TextStyle? hintStyle;
//   final String? helpText;
//   final EdgeInsets? contentPadding;
//   final Key? inputKey;
//   final int? maxLength;
//   final int? maxLines;
//   final bool obscure;
//   final bool enableClearBtn;
//   final bool enabled;
//   final dynamic mask;
//   final Function(String value)? onChanged;
//   final FocusNode? focus;
//   final bool? onlyNumAndSym;
//   final String? labelText;
//   final bool isUnableColor;
//   final TextCapitalization textCapitalization;
//   final bool onlyLetters;
//   final Color? fillColor;
//   final TextStyle? style;
//   final TextInputAction? textInputAction;
//   final Function(PointerDownEvent)? onTapOutside;
//   final bool enableClearAll;
//   final bool isOutline;
//   final bool isContentPaddingNull;
//   final Widget Function(String error)? errorTextWidget;

//   @override
//   State<OutlinedNewMegaField> createState() => _OutlinedNewMegaFieldState();
// }

// class _OutlinedNewMegaFieldState extends State<OutlinedNewMegaField> {
//   FocusNode? _focusNode;
//   bool _hasFocus = false;
//   String? _errorText;

//   String? _processValidator(String? value) {
//     if (widget.validator != null) {
//       setState(() {
//         _errorText = widget.validator!(value);
//       });
//     }
//     return _errorText;
//   }

//   void _clearText() {
//     if (widget.textEditingController != null) {
//       WidgetsBinding.instance
//           .addPostFrameCallback((_) => widget.textEditingController!.clear());
//     }
//   }

//   @override
//   void initState() {
//     super.initState();
//     _focusNode = widget.focus ?? FocusNode();
//     _focusNode!.addListener(() {
//       if (!mounted) return;
//       setState(() {
//         _hasFocus = _focusNode!.hasFocus;
//       });
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       mainAxisSize: MainAxisSize.min,
//       children: [
//         Container(
//           padding: widget.contentPadding ??
//               const EdgeInsets.symmetric(horizontal: 5).copyWith(top: 8),
//           decoration: BoxDecoration(
//             color: widget.enabled
//                 ? widget.fillColor ?? Colors.transparent
//                 : Colors.blue,
//             borderRadius: BorderRadius.circular(10),
//             border: widget.enabled
//                 ? Border.all(
//                     color: widget.isUnableColor
//                         ? const Color(0xff000D39)
//                         : _errorText != null
//                             ? Colors.red
//                             : _hasFocus
//                                 ? Colors.blue
//                                 : Colors.yellow,
//                     width: 1)
//                 : null,
//           ),
//           child: Row(
//             children: [
//               Expanded(
//                 child: MegaFormField(
//                   isContentPaddingNull: widget.isContentPaddingNull,
//                   suffixIcon: widget.suffixIcon,
//                   textInputAction: widget.textInputAction,
//                   onTapOutside: widget.onTapOutside,
//                   style: widget.style,
//                   onFieldSubmitted: widget.onFieldSubmitted,
//                   textCapitalization: widget.textCapitalization,
//                   onlyLetters: widget.onlyLetters,
//                   inputFormatters: widget.inputFormatters,
//                   focus: _focusNode,
//                   isOutline: widget.isOutline,
//                   fillColor: widget.fillColor,
//                   enableClearBtn:
//                       widget.enableClearAll ? !widget.enableClearBtn : false,
//                   contentPadding: widget.contentPadding ??
//                       const EdgeInsets.symmetric(horizontal: 8.0),
//                   enabled: widget.enabled,
//                   hintText: widget.hintText,
//                   hintStyle: widget.hintStyle,
//                   inputKey: widget.inputKey,
//                   keyboardType: widget.keyboardType,
//                   leading: widget.leading,
//                   mask: widget.mask,
//                   maxLength: widget.maxLength,
//                   maxLines: widget.maxLines,
//                   obscure: widget.obscure,
//                   onChanged: widget.onChanged,
//                   onSave: widget.onSave,
//                   prefix: widget.prefix,
//                   suffix: widget.suffix,
//                   labelText: widget.labelText,
//                   textEditingController: widget.textEditingController,
//                   validator: (value) => _processValidator(value),
//                   onlyNumAndSym: widget.onlyNumAndSym,
//                 ),
//               ),
//               _hasFocus == true &&
//                       widget.enableClearBtn == true &&
//                       widget.enableClearAll
//                   ? Padding(
//                       padding: const EdgeInsets.only(right: 16.0),
//                       child: GestureDetector(
//                         onTap: () => _clearText(),
//                         child: const Icon(
//                           Icons.close,
//                           size: 24,
//                           color: Colors.white,
//                         ),
//                       ))
//                   : const SizedBox(
//                       height: 0,
//                       width: 0,
//                     )
//             ],
//           ),
//         ),
//         const SizedBox(
//           height: 8,
//         ),
//         _errorText != null
//             ? widget.errorTextWidget != null
//                 ? widget.errorTextWidget!(_errorText!)
//                 : Text(
//                     '$_errorText',
//                     // style: AppThemeHelper.style.regular12.copyWith(
//                     //   color: AppThemeHelper.colors.red,
//                     // ),
//                   )
//             : widget.helpText != null
//                 ? Text(
//                     '${widget.helpText}',
//                     // style: AppThemeHelper.style.regular12
//                     //     .copyWith(color: AppThemeHelper.colors.dGray),
//                   )
//                 : const SizedBox(
//                     height: 0,
//                     width: 0,
//                   )
//       ],
//     );
//   }
// }
