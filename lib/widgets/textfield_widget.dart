import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFieldWidget extends StatelessWidget {
  final IconData icon;
  final String? hint;
  final String? errorText;
  final bool isObscure;
  final bool isIcon;
  final TextInputType? inputType;

  //final TextEditingController textController;
  final EdgeInsets padding;
  final Color hintColor;
  final Color iconColor;
  final FocusNode? focusNode;
  final ValueChanged? onFieldSubmitted;
  final ValueChanged? onChanged;
  final bool autoFocus;
  final TextInputAction? inputAction;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Container(
        width: 310,
        child: TextFormField(
          // controller: textController,
          focusNode: focusNode,
          onFieldSubmitted: onFieldSubmitted,
          onChanged: onChanged,
          autofocus: autoFocus,
          textInputAction: inputAction,
          obscureText: this.isObscure,
          maxLength: 25,
          keyboardType: this.inputType,
          style: Theme.of(context).textTheme.bodyText2,
          decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: this.hint,
              hintStyle: Theme.of(context)
                  .textTheme
                  .bodyText2!
                  .copyWith(color: hintColor),
              errorText: errorText,
              counterText: '',
              icon: this.isIcon ? Icon(this.icon, color: iconColor) : null),
        ),
      ),
    );
  }

  const TextFieldWidget({
    Key? key,
    required this.icon,
    required this.errorText,
    // required this.textController,
    this.inputType,
    this.hint,
    this.isObscure = false,
    this.isIcon = true,
    this.padding = const EdgeInsets.all(0),
    this.hintColor = Colors.grey,
    this.iconColor = Colors.grey,
    this.focusNode,
    this.onFieldSubmitted,
    this.onChanged,
    this.autoFocus = false,
    this.inputAction,
  }) : super(key: key);
}

class TextFormFieldCustom extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final TextInputAction? textInputAction;
  final TextInputType? textInputType;
  final bool? obscureText;
  final bool? enabled;
  final TextInputFormatter? inputFormatter;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Color? hintColor;

  TextFormFieldCustom(
      {this.controller,
      this.hintText,
      this.textInputAction,
      this.textInputType,
      this.obscureText,
      this.enabled,
      this.inputFormatter,
      this.prefixIcon,
      this.suffixIcon,
      this.hintColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      //decoration: BoxDecoration(boxShadow: [shadow]),
      child: TextFormField(
        controller: controller,
        textInputAction: textInputAction ?? TextInputAction.next,
        keyboardType: textInputType ?? TextInputType.text,
        obscureText: obscureText ?? false,
        enabled: enabled ?? true,
        inputFormatters: inputFormatter != null ? [inputFormatter!] : [],
        decoration: InputDecoration(
            contentPadding: EdgeInsets.only(left: 21, top: 15, bottom: 15),
            fillColor: Colors.white,
            filled: true,
            hintText: hintText ?? "HintText",
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey, width: 1.0),
              borderRadius: BorderRadius.circular(8.0),
            ),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey, width: 1.0),
                borderRadius: BorderRadius.circular(8.0)),
            disabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey, width: 1.0),
                borderRadius: BorderRadius.circular(8.0))),
      ),
    );
  }
}

class TextFieldSearch extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final TextInputAction? textInputAction;
  final TextInputType? textInputType;
  final bool? obscureText;
  final bool? enabled;
  final Function? onChanged;
  final TextInputFormatter? inputFormatter;
  final Widget? prefixIcon;
  final Color? hintColor;
  final FocusNode? focusNode;
  final FormFieldValidator<String>? validator;

  TextFieldSearch(
      {this.controller,
      this.hintText,
      this.textInputAction,
      this.textInputType,
      this.obscureText,
      this.enabled,
      this.onChanged,
      this.inputFormatter,
      this.prefixIcon,
      this.hintColor,
      this.focusNode,
      this.validator});

  @override
  Widget build(BuildContext context) {
    return Container(
      //decoration: BoxDecoration(boxShadow: [shadow]),
      width: double.infinity,
      child: TextFormField(
        controller: controller,
        textInputAction: textInputAction ?? TextInputAction.next,
        keyboardType: textInputType ?? TextInputType.text,
        obscureText: obscureText ?? false,
        enabled: enabled ?? true,
        focusNode: focusNode ?? new FocusNode(),
        inputFormatters: inputFormatter != null ? [inputFormatter!] : [],
        decoration: InputDecoration(
            contentPadding: EdgeInsets.only(left: 2, top: 15, bottom: 15),
            filled: true,
            hintText: hintText ?? "HintText",
            prefixIcon: prefixIcon,
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey, width: 1.0),
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey, width: 1.0),
            ),
            disabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey, width: 1.0),
            ),
            border: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey, width: 1.0),
            ),
            errorBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.red, width: 1.0),
            )),
        onChanged: (value) {
          if (onChanged != null) onChanged!(value);
        },
        validator: validator,
      ),
    );
  }
}
