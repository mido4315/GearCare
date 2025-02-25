import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

import '../core/constants/app_colors.dart';

class CustomDropDownButtonWithSearch extends StatelessWidget {
  const CustomDropDownButtonWithSearch({
    Key? key,
    required this.itemList,
    required this.selectedItem,
    required this.onChanged,
    required this.hintText,
  }) : super(key: key);

  final List<String> itemList;
  final String? selectedItem;
  final ValueChanged<String?> onChanged;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(22),
        color: Colors.white,
      ),
      child: DropdownSearch<String>(
        popupProps: const PopupProps.menu(
          searchFieldProps: TextFieldProps(),
          showSelectedItems: true,
          showSearchBox: true,
        ),
        items: itemList,
        dropdownDecoratorProps: DropDownDecoratorProps(
          dropdownSearchDecoration: InputDecoration(
              labelText: hintText,
              prefixIcon: const Icon(Icons.drive_eta),
              iconColor: AppColors.kPrimaryColor.withOpacity(.3),
            border:  OutlineInputBorder(borderRadius: BorderRadius.circular(12))
          ),
        ),
        onChanged: onChanged,
        selectedItem: selectedItem,
        validator: (String? item) {
          if (item == null) {
            return "Required field";
          } else {
            return null;
          }
        },
      ),
    );
  }
}