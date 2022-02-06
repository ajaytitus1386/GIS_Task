import 'package:flutter/material.dart';
import 'package:gis_task/features/bulkblock/presentation/styling/color_palettes.dart';

class ClientNameSearchBar extends StatefulWidget {
  const ClientNameSearchBar({Key? key}) : super(key: key);

  @override
  State<ClientNameSearchBar> createState() => _ClientNameSearchBarState();
}

class _ClientNameSearchBarState extends State<ClientNameSearchBar> {
  TextEditingController controller = TextEditingController();
  void filterBulkBlocks(String enteredClientName) {
    if (enteredClientName.isEmpty) {}
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: highlight,
            border: Border.all(color: midGrey)),
        child: ListTile(
          title: TextField(
            onChanged: (value) => filterBulkBlocks(value),
            controller: controller,
            decoration: const InputDecoration(
                border: UnderlineInputBorder(borderSide: BorderSide.none),
                hintText: 'Search Client Name',
                focusedBorder:
                    UnderlineInputBorder(borderSide: BorderSide.none)),
          ),
          trailing: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.close),
          ),
        ),
      ),
    );
  }
}
