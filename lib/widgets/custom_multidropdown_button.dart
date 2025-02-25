import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

import '../core/constants/app_colors.dart';

class CustomMultiDropDownButton extends StatelessWidget {
  const CustomMultiDropDownButton({
    Key? key,
    required this.itemList,
    required this.selectedItems,
    required this.onChanged,
    required this.hintText,
  }) : super(key: key);

  final List<String> itemList;
  final List<String> selectedItems;
  final ValueChanged<List<String>> onChanged;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 8, bottom: 8, left: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: DropdownSearch<String>.multiSelection(
          popupProps: const PopupPropsMultiSelection.menu(
            searchFieldProps: TextFieldProps(),
            showSelectedItems: true,
            showSearchBox: false,
          ),
          items: itemList,
          dropdownDecoratorProps: DropDownDecoratorProps(
            dropdownSearchDecoration: InputDecoration(
                labelText: hintText,
                icon: const Icon(Icons.drive_eta),
                iconColor: AppColors.kPrimaryColor.withOpacity(.3),
                border: const OutlineInputBorder()),
          ),
          onChanged: onChanged,
          selectedItems: selectedItems,
          validator: (value) {
            if (value != null && value.isNotEmpty) {
              return null;
            } else {
              return "Required field";
            }
          },
        ),
      ),
    );
  }
}