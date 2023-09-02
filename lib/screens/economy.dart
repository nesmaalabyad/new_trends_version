import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../components/components.dart';
import '../cubit/cubit.dart';
import '../cubit/states.dart';


class economy extends StatelessWidget {
  const economy({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, Newsstates>(
      listener: (context, states) {},
      builder: (context, states) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.blue,
            elevation: 0.0,
            title: Text(
              "Economy", style: TextStyle(fontSize: 43, color: Colors.white,fontStyle: FontStyle.italic),),
            centerTitle: true,
          ),
          body:
          ListNewsItem(
              context: context, task: NewsCubit.get(context).economy),



        );
      },
    );
  }
}
