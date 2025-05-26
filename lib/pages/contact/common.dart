import 'package:flutter/material.dart';

class OutlinedTextField extends StatelessWidget {
  const OutlinedTextField({
    super.key,
    this.controller,
    this.suffixIcon,
    this.prefixIcon,
    this.hintText,
    this.keyboardType,
    this.height,
    this.maxLines = 1,
    this.onChanged,
    this.enabled = true,
    this.borderColor = Colors.blue,
    this.obscureText = false,
    this.hintStyle,
  });

  final TextEditingController? controller;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? hintText;
  final TextInputType? keyboardType;
  final double? height;
  final int? maxLines;
  final void Function(String)? onChanged;
  final bool? enabled;
  final Color? borderColor;
  final bool? obscureText;
  final TextStyle? hintStyle;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      //height: height ?? 40,
      child: TextFormField(
        style: TextStyle(fontSize: 14, color: Colors.black),
        enabled: enabled,
        controller: controller,
        onChanged: onChanged,
        onTapOutside: (event) {
          hideKyBoard(context);
        },
        keyboardType: keyboardType,
        maxLines: maxLines,
        obscureText: obscureText!,
        decoration: InputDecoration(
          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon,
          hintText: hintText,
          contentPadding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5.0),
          // hintStyle: hintStyle?? size14w400(color: AppColor.colorBlack.withValues(alpha: 0.44)),
          hintStyle: TextStyle(fontSize: 14, color: Colors.black),
          border: OutlineInputBorder(
            borderSide: BorderSide(width: 1, color: borderColor!),
            borderRadius: BorderRadius.circular(5),
          ),
          errorBorder:  OutlineInputBorder(
            borderSide: BorderSide(width: 1, color: borderColor!),
            borderRadius: BorderRadius.circular(5),
          ),
          enabledBorder:  OutlineInputBorder(
            borderSide: BorderSide(width: 1, color: Colors.red),
            borderRadius: BorderRadius.circular(5),
          ),
          focusedBorder:enabled==false? OutlineInputBorder(
            borderSide: BorderSide(width: 1, color: borderColor!),
            borderRadius: BorderRadius.circular(5),
          ):null,
          disabledBorder: enabled==false? OutlineInputBorder(
            borderSide: BorderSide(width: 1, color: borderColor!.withValues(alpha: 0.12)),
            borderRadius: BorderRadius.circular(5),
          ): OutlineInputBorder(
            borderSide: BorderSide(width: 1, color: borderColor!),
            borderRadius: BorderRadius.circular(5),
          ),
        ),
      ),
    );
  }
}

hideKyBoard(BuildContext context) {
  FocusScope.of(context).unfocus();
  FocusManager.instance.primaryFocus!.unfocus();
}