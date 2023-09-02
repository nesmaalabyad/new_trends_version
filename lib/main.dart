

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_trends_version/screens/splash_screen.dart';

import 'cubit/bloc_observer/my_bloc_observer.dart';
import 'cubit/cubit.dart';

import 'cubit/states.dart';
import 'dio_helper/dio_helper.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  DioHelper.init();

  BlocOverrides.runZoned(
        () {
      runApp( MyApp());
    },
    blocObserver: MyBlocObserver(),
  );
}

class MyApp extends StatelessWidget {


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create:( context)=>NewsCubit(),),
        BlocProvider(
          create: (BuildContext context)=>NewsCubit()..getSports()..getBuisness()..getEconomy()..gethealth()..getScience()..getTechnology()..getgeneral(),),

      ],
      child: BlocConsumer<NewsCubit,Newsstates>(
          listener: (context,states){},
          builder:(context,states) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'shop',
              theme: ThemeData(

              ),
              home: SplashScreen(),
              //804946c446d74bc897d25f4e04d5482f
            );
          }

      ),
    );
  }
}


