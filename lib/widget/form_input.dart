import 'package:flutter/material.dart';
import 'package:product_inventory/utility/bootstrap_colors.dart';
import 'package:flutter/cupertino.dart';

class FormInput extends StatefulWidget {
  const FormInput({
    super.key,
    required this.inputLabel,
    required this.inputController,
    this.inputValidator,
    this.secure = false,
    this.keyboardType,
  });

  final String inputLabel;
  final TextEditingController inputController;
  final String? Function(String?)? inputValidator;
  final bool secure;
  final TextInputType? keyboardType;

  @override
  State<StatefulWidget> createState() => _FormInputState();
}

class _FormInputState extends State<FormInput> {
  bool obscureText = true;

  void toggle() {
    setState(() {
      obscureText = !obscureText;
    });
  }

  showSuffixIcon(bool secure) {
    if (secure) {
      return IconButton(
        onPressed: toggle,
        icon: obscureText
            ? const Icon(CupertinoIcons.eye_slash_fill)
            : const Icon(CupertinoIcons.eye_fill),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: widget.keyboardType,
      obscureText: obscureText == true ? widget.secure : obscureText,
      controller: widget.inputController,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(12),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: BootstrapColors().light),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: BootstrapColors().danger),
        ),
        labelText: widget.inputLabel,
        suffixIcon: showSuffixIcon(widget.secure),
      ),
      validator: widget.inputValidator,
    );
  }
}


// import 'package:flutter/material.dart';
// import 'package:product_inventory/utility/bootstrap_colors.dart';

// class FormInput extends StatelessWidget {
//   const FormInput({
//     super.key,
//     required this.inputLabel,
//     required this.inputController,
//     this.inputValidator,
//     this.keyboardType,
//     this.suffixIcon,
//   });

//   final String inputLabel;
//   final TextEditingController inputController;
//   final String? Function(String?)? inputValidator;

//   final TextInputType? keyboardType;
//   final Icon? suffixIcon;

//   @override
//   Widget build(BuildContext context) {
//     bool obscureText = false;

//     showPassword() {
//       if (obscureText) {
//         obscureText = false;
//       } else {
//         obscureText = true;
//       }
//     }

//     return TextFormField(
//       keyboardType: keyboardType,
//       obscureText: obscureText,
//       controller: inputController,
//       decoration: InputDecoration(
//         contentPadding: const EdgeInsets.all(12),
//         border: const OutlineInputBorder(
//           borderRadius: BorderRadius.all(
//             Radius.circular(8),
//           ),
//         ),
//         focusedBorder: OutlineInputBorder(
//           borderSide: BorderSide(color: BootstrapColors().light),
//         ),
//         errorBorder: OutlineInputBorder(
//           borderSide: BorderSide(color: BootstrapColors().danger),
//         ),
//         labelText: inputLabel,
//         suffixIcon: IconButton(
//           onPressed: showPassword,
//           icon: const Icon(Icons.remove_red_eye),
//         ),
//       ),
//       validator: inputValidator,
//     );
//   }
// }
