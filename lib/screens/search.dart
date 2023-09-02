import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../components/components.dart';
import '../cubit/cubit.dart';
import '../cubit/states.dart';


class searchScreen extends StatelessWidget {
  final searchController = TextEditingController();

  void _performSearch(BuildContext context) {
    final searchQuery = searchController.text;
    NewsCubit.get(context).getSearch(searchQuery);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, Newsstates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(title: Text('Search')),
          body: Column(
            children: [
              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: TextFormFieldCusstom(
                        controller: searchController,
                        label: 'Search',
                        type: TextInputType.text,

                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.search),
                      onPressed: () {
                        _performSearch(context);
                      },
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListNewsItem(
                  context: context,
                  task: NewsCubit.get(context).search,
                  isSearch: true,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}