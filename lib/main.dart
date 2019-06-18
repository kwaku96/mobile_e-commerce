import 'package:flutter/material.dart';
import 'bloc_delegate.dart';
import 'package:bloc/bloc.dart';
import 'authentication/a_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'screens/home_screen.dart';
import 'user_repo/user_repository.dart';
import 'screens/splash_screen.dart';

void main(){
  BlocSupervisor().delegate = SimpleBlocDelegate();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  AuthenticationBloc _authenticationBloc;
  final UserRepository _userRepository = UserRepository();

  @override
  void initState() {
    super.initState();
    _authenticationBloc = AuthenticationBloc(userRepository: _userRepository);
    _authenticationBloc.dispatch(AppStarted());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthenticationBloc>(
      bloc: _authenticationBloc,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Pazarcim',
        home: BlocBuilder<AuthenticationEvent,AuthenticationState>(
          bloc: _authenticationBloc,
          builder: (context,state){
            if(state is Uninitialized){
              return SplashScreen();
            }
            if(state is Authenticated || state is Unauthenticated){
              return HomeScreen(
                userRepository: _userRepository,
              );
            }
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _authenticationBloc.dispose();
  }
}
