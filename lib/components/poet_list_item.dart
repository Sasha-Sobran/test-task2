import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testik/cubit/data_cubit.dart';
import 'package:testik/models/poet.dart';

class PoetListItem extends StatelessWidget {
  final Poet poet;
  const PoetListItem({super.key, required this.poet});

  @override
  Widget build(BuildContext context) {
    DataCubit dataCubit = context.read<DataCubit>();

    return Container(
      width: double.infinity,
      height: 60,
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.black, width: 1),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Text(
              poet.name,
            ),
          ),
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text("Confirm delete a poet"),
                    content: const Text("Are u sure?"),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text("Cancel"),
                      ),
                      TextButton(
                        onPressed: () {
                          dataCubit.deletePoet(poet.id);
                          Navigator.of(context).pop();
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text("${poet.name} succesfully deleted"),
                            ),
                          );
                        },
                        child: const Text("Confirm"),
                      )
                    ],
                  );
                },
              );
            },
            icon: const Icon(
              Icons.delete,
            ),
          ),
        ],
      ),
    );
  }
}
