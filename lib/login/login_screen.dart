import 'package:e_commerce_app/themes/text_themes.dart';
import 'package:flutter/material.dart';
import '../user_repo/user_repository.dart';
import 'bloc/l_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'login_form.dart';

class LoginScreen extends StatefulWidget {
  final UserRepository _userRepository;

  LoginScreen({Key key, @required UserRepository userRepository})
      : assert(userRepository != null),
        _userRepository = userRepository,
        super(key: key);
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LoginBloc _loginBloc;

  UserRepository get _userRepository => widget._userRepository;

  @override
  void initState() {
    super.initState();
    _loginBloc = LoginBloc(userRepository: _userRepository);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        iconTheme: appBarIconTheme,
      ),
      body: BlocProvider<LoginBloc>(
        bloc: _loginBloc,
        child: LoginForm(userRepository: _userRepository),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _loginBloc.dispose();
  }
}
