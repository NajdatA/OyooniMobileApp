import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:senior_project/core/util/generate_screen.dart';
import 'package:senior_project/features/splash/presentation/bloc/splash_bloc.dart';
import 'package:senior_project/features/splash/presentation/bloc/splash_state.dart';
import 'package:senior_project/injection.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final SplashBloc bloc = sl<SplashBloc>();

  @override
  void initState() {
    Future.delayed(Duration(seconds: 2), () {
      bloc.onScreenAppeared();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener(
        cubit: bloc,
        listener: (BuildContext context, SplashState state) {
          if (state.user != null) {
            if (state.user == 'blind') {
              Navigator.of(context).pushReplacementNamed(NameScreen.HOME_PAGE);
            } else if (state.user == 'volunteer') {
              Navigator.of(context).pushReplacementNamed(NameScreen.LOGIN_PAGE);
            } else {
              Navigator.of(context).pushReplacementNamed(NameScreen.CHOOSE_USER_PAGE);
            }
          }
        },
        child: Scaffold(
            backgroundColor: Colors.orange[50],
            body: Center(child: Image.asset('assets/images/oyooni.png', scale: 7,))));
  }
}
