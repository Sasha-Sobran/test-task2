import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testik/cubit/data_cubit.dart';

class SortDropdown extends StatefulWidget {
  const SortDropdown({super.key});

  @override
  State<SortDropdown> createState() => _SortDropdownState();
}

class _SortDropdownState extends State<SortDropdown> {
  String displayedValue = "name";
  
  @override
  Widget build(BuildContext context) {
    void dropDownCallBack(selectedValue) {
      setState(() {
        displayedValue = selectedValue;
      });

      context.read<DataCubit>().sortDataBy(selectedValue);
    }

    return DropdownButton(
      items: const <DropdownMenuItem>[
        DropdownMenuItem(value: "id", child: Text("Sort by: id")),
        DropdownMenuItem(value: "name", child: Text("Sort by: name")),
      ],
      value: displayedValue,
      onChanged: dropDownCallBack,
    );
  }
}
