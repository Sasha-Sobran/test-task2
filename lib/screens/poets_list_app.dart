import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testik/components/insert_form.dart';
import 'package:testik/components/poets_list_view.dart';
import 'package:testik/components/sort_dropdown.dart';

import 'package:testik/cubit/data_cubit.dart';

class PoetsListApp extends StatelessWidget {
  const PoetsListApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DataCubit(),
      child: MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: const Text("Poets"),
          ),
          body: const Column(
            children: [
              InsertForm(),
              SortDropdown(),
              Expanded(
                child: PoetsListView(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
