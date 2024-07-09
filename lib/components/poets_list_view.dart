import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testik/components/poet_list_item.dart';
import 'package:testik/cubit/data_cubit.dart';

class PoetsListView extends StatefulWidget {
  const PoetsListView({super.key});

  @override
  State<PoetsListView> createState() => _PoetsListViewState();
}

class _PoetsListViewState extends State<PoetsListView> {
  @override
  void initState() {
    super.initState();
    DataCubit dataCubit = context.read<DataCubit>();
    dataCubit.setPoets();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DataCubit, DataState>(
      builder: (context, state) {
        if (state is DataLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is DataLoaded) {
          int count = state.data.length;
          var data = state.data;
          return ListView.builder(
            itemCount: count,
            itemBuilder: (context, index) {
              return PoetListItem(poet: data[index]);
            },
          );
        } else {
          return const Center(
            child: Text('No data available'),
          );
        }
      },
    );
  }
}
