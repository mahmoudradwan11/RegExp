import 'package:flutter/material.dart';
class DefaultButton extends StatelessWidget {
  Widget buttonWidget;
  Function() function;
  double width;
  Color backgroundColor;
  bool isUpperCase;
  double radius;
  double height;
  Color borderColor;
  DefaultButton({
    super.key,
    this.height = 50,
    required this.buttonWidget,
    required this.function,
    this.width = double.infinity,
    this.backgroundColor = Colors.blue,
    this.isUpperCase = true,
    this.radius = 10.0,
    this.borderColor = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        border: Border.all(color: borderColor),
        borderRadius: BorderRadius.circular(radius),
        color: backgroundColor,
      ),
      child: MaterialButton(
        onPressed: function,
        child: buttonWidget,
      ),
    );
  }
}
class DefaultFieldForm extends StatelessWidget {
  TextEditingController controller;
  TextInputType keyboard;
  var valid;
  String? label;
  String? hint;
  IconData? prefix;
  bool show;
  var tap;
  var onchange;
  var onSubmit;
  IconData? suffix;
  Function()? suffixPress;
  TextStyle? labelStyle;
  TextStyle? hintStyle;

  DefaultFieldForm({
    super.key,
    required this.controller,
    required this.keyboard,
    required this.valid,
    this.hint,
    this.label,
    this.prefix,
    this.show = false,
    this.tap,
    this.onchange,
    this.onSubmit,
    this.suffix,
    this.suffixPress,
    this.labelStyle,
    this.hintStyle,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTapOutside: (event)=>FocusScope.of(context).unfocus(),
      validator: valid,
      controller: controller,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: hintStyle,
        labelText: label,
        labelStyle: labelStyle,
        contentPadding: const EdgeInsets.all(16),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.indigo),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.black),
        ),
        errorStyle:const TextStyle(color: Colors.red,fontSize: 15),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.black),
        ),
        // borderRadius: BorderRadius.circular(30
        prefixIcon: Icon(
          prefix,
          color: Colors.grey[500],
        ),
        suffixIcon: suffix != null
            ? IconButton(
          icon: Icon(suffix),
          onPressed: suffixPress,
          color: Colors.grey[500],
        )
            : null,
      ),

      keyboardType: keyboard,
      onFieldSubmitted: onSubmit,
      onChanged:onchange,
      obscureText: show,
      onTap: tap,
    );
  }
}
void navigateTo(context, widget) =>
    Navigator.push(context, MaterialPageRoute(builder: (context) => widget));

void navigateAndFinish(context, widget) => Navigator.pushAndRemoveUntil(
  context,
  MaterialPageRoute(builder: (context) => widget),
      (Route<dynamic> route) => false,
);
void navigateAndReplace(context, widget) => Navigator.pushReplacement(
    context, MaterialPageRoute(builder: (context) => widget));

