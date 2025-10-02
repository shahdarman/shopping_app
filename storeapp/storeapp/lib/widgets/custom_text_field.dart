import 'package:flutter/material.dart';
import 'package:storeapp/utils/app_color.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final bool hideInput;
  final String? Function(String?)? validator;
  final String? Function(String?)? onChanged;
  final TextInputType keyBoardType ;
  final IconData prefixIcon;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.hintText,
    this.hideInput = false,
    required this.keyBoardType,
    required this.prefixIcon,
    this.validator,
    this.onChanged
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late bool _isObscured;
  @override
  void initState(){
    super.initState();
    _isObscured=widget.hideInput;
  }
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 350,
      child: TextFormField(
        style: TextStyle(
            color: Colors.black,

        ),
        controller: widget.controller,
        obscureText:_isObscured,
        validator: widget.validator,
        onChanged: widget.onChanged,
        keyboardType:widget.keyBoardType,
        decoration:InputDecoration(
          hintText: widget.hintText,
          hintStyle: TextStyle(
              color: AppColor.textFormFillColor,
              fontSize: 14
          ),
          errorStyle: TextStyle(
              fontSize: 16,
              color: AppColor.errorColor
          ),
          prefixIcon: Icon(
            widget.prefixIcon,
            size: 16,
            color: AppColor.textFormFillColor,
          ),
          suffixIcon: widget.hideInput
              ? IconButton(
            icon: Icon(
              _isObscured ? Icons.visibility_off : Icons.visibility,
              color: AppColor.textFormFillColor,
            ),
            onPressed: () {
              setState(() {
                _isObscured = !_isObscured;
              });
            },
          )
              : null,
          filled: true,
          fillColor: AppColor.textFormStrokeColor.withOpacity(0.3),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: AppColor.errorColor)
          ),
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: AppColor.errorColor)
          ) ,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color:AppColor.textFormStrokeColor),
          ),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color:AppColor.textFormStrokeColor)
          ),
        ),
      ),
    );
  }
}
