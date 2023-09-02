import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../components/components.dart';
import '../cubit/cubit.dart';
import '../cubit/states.dart';


class Trends extends StatelessWidget {
  const Trends({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, Newsstates>(
      listener: (context, states) {},
      builder: (context, states) {
        return Scaffold(

          body:
          ListNewsItem(
              context: context, task: NewsCubit.get(context).general),



        );
      },
    );
  }
}
