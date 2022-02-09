import 'package:flutter/material.dart';
import 'package:gis_task/features/bulkblock/presentation/styling/color_palettes.dart';

class ClientNameSearchBar extends StatelessWidget {
  const ClientNameSearchBar({
    Key? key,
    required this.clientNameFromTextField,
    required this.controller,
    required this.changeClientName,
  }) : super(key: key);

  final String clientNameFromTextField;
  final TextEditingController controller;
  final void Function(String enteredClientName) changeClientName;

  @override
  Widget build(BuildContext context) {
    var isInputEmpty = clientNameFromTextField != '';
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: highlight,
            border: Border.all(color: midGrey)),
        child: ListTile(
          title: TextField(
            onChanged: (value) => changeClientName(value),
            controller: controller,
            decoration: InputDecoration(
                border: const UnderlineInputBorder(borderSide: BorderSide.none),
                hintText: 'Search Client Name',
                hintStyle:
                    TextStyle(color: midGrey, fontWeight: FontWeight.w500),
                focusedBorder:
                    const UnderlineInputBorder(borderSide: BorderSide.none)),
          ),
          trailing: Visibility(
            visible: isInputEmpty,
            child: IconButton(
              onPressed: () {
                controller.clear();
                changeClientName('');
              },
              icon: const Icon(Icons.close),
            ),
          ),
        ),
      ),
    );
  }
}
