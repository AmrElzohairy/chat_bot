import 'package:chat_bot/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomPasswordField extends StatefulWidget {
  const CustomPasswordField({
    super.key,
    required this.labelText,
    required this.controller,
    this.hintText,
    this.validator,
    this.onChanged,
    this.onFieldSubmitted,
    this.keyboardType = TextInputType.visiblePassword,
    this.textInputAction = TextInputAction.done,
    this.enabled = true,
    this.readOnly = false,
    this.maxLines = 1,
    this.maxLength,
    this.focusNode,
    this.prefixIcon,
    this.inputFormatters,
    this.textCapitalization = TextCapitalization.none,
    this.textAlign = TextAlign.start,
    this.textStyle,
    this.autofocus = false,
    this.autocorrect = false,
    this.enableSuggestions = false,
    this.autovalidateMode,
    this.onSaved,
    this.visibilityIcon,
    this.visibilityOffIcon,
    this.initiallyObscured = true,
  });

  // Required fields
  final String labelText;
  final TextEditingController controller;

  // Optional commonly used fields
  final String? hintText;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final void Function(String)? onFieldSubmitted;
  final void Function(String?)? onSaved;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final bool enabled;
  final bool readOnly;
  final int? maxLines;
  final int? maxLength;
  final FocusNode? focusNode;
  final Widget? prefixIcon;
  final List<TextInputFormatter>? inputFormatters;
  final TextCapitalization textCapitalization;
  final TextAlign textAlign;
  final TextStyle? textStyle;
  final bool autofocus;
  final bool autocorrect;
  final bool enableSuggestions;
  final AutovalidateMode? autovalidateMode;

  // Password specific fields
  final Widget? visibilityIcon;
  final Widget? visibilityOffIcon;
  final bool initiallyObscured;

  @override
  State<CustomPasswordField> createState() => _CustomPasswordFieldState();
}

class _CustomPasswordFieldState extends State<CustomPasswordField> {
  late bool _isObscured;

  @override
  void initState() {
    super.initState();
    _isObscured = widget.initiallyObscured;
  }

  void _toggleVisibility() {
    setState(() {
      _isObscured = !_isObscured;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      keyboardType: widget.keyboardType,
      textInputAction: widget.textInputAction,
      validator: widget.validator,
      onSaved: widget.onSaved,
      onChanged: widget.onChanged,
      onFieldSubmitted: widget.onFieldSubmitted,
      focusNode: widget.focusNode,
      enabled: widget.enabled,
      readOnly: widget.readOnly,
      obscureText: _isObscured,
      maxLines: widget.maxLines,
      maxLength: widget.maxLength,
      inputFormatters: widget.inputFormatters,
      textCapitalization: widget.textCapitalization,
      textAlign: widget.textAlign,
      style: widget.textStyle,
      autofocus: widget.autofocus,
      autocorrect: widget.autocorrect,
      enableSuggestions: widget.enableSuggestions,
      autovalidateMode: widget.autovalidateMode,
      decoration: InputDecoration(
        labelText: widget.labelText,
        hintText: widget.hintText,
        prefixIcon: widget.prefixIcon,
        suffixIcon: IconButton(
          icon:
              _isObscured
                  ? (widget.visibilityOffIcon ??
                      const Icon(Icons.visibility_off, color: AppColors.grey))
                  : (widget.visibilityIcon ??
                      const Icon(Icons.visibility, color: AppColors.grey)),
          onPressed: _toggleVisibility,
        ),
      ),
    );
  }
}
