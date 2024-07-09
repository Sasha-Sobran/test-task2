import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testik/cubit/data_cubit.dart';

class InsertForm extends StatefulWidget {
  const InsertForm({super.key});

  @override
  State<InsertForm> createState() => _InsertFormState();
}

class _InsertFormState extends State<InsertForm> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  void _addPoet() {
    DataCubit dataCubit = context.read<DataCubit>();
    final String name = _controller.value.text;
    name.trim();
    if (name.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Text field must be filled"),
        ),
      );
      return;
    }
    dataCubit.addPoet(name);

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text("$name succesfully added"),
    ));

    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.8,
          child: TextField(
            decoration:
                const InputDecoration(label: Text("enter name u want to add")),
            controller: _controller,
          ),
        ),
        TextButton(
          onPressed: _addPoet,
          child: const Text("Add"),
        ),
      ],
    );
  }
}
