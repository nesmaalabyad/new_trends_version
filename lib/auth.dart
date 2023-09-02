import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:new_trends_version/screens/login/login.dart';

import 'layout/news_layout.dart';



class Auth extends StatelessWidget {
  const Auth({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (
            (context,snapshot){
              if(snapshot.hasData){
                return newslayout();
              }else{
                return login();
              }
            }
        ),
      ),
    );
  }
}
