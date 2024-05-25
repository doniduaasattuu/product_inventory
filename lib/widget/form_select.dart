import 'package:flutter/material.dart';

// const List<String> list = <String>['One', 'Two', 'Three', 'Four'];
enum ColorLabel {
  blue('Blue', Colors.blue),
  pink('Pink', Colors.pink),
  green('Green', Colors.green),
  yellow('Orange', Colors.orange),
  grey('Grey', Colors.grey);

  const ColorLabel(this.label, this.color);
  final String label;
  final Color color;
}

class FormSelect extends StatelessWidget {
  const FormSelect({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownMenu(
      dropdownMenuEntries: ColorLabel.values
          .map<DropdownMenuEntry<ColorLabel>>((ColorLabel color) {
        return DropdownMenuEntry<ColorLabel>(
          value: color,
          label: 'Color',
          // enabled: color.label != 'Grey',
          // style: MenuItemButton.styleFrom(
          //   foregroundColor: color.color,
          // ),
        );
      }).toList(),
      inputDecorationTheme: const InputDecorationTheme(
        contentPadding: EdgeInsets.all(12),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
        ),
      ),
    );
  }
}


// return DropdownButton(
//       items: list.map<DropdownMenuItem<String>>((String value) {
//         return DropdownMenuItem<String>(
//           value: value,
//           child: Text(value),
//         );
//       }).toList(),
//       onChanged: (String? value) {},
//       // style:
//     );
