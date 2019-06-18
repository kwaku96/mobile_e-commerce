import 'register_form.dart';
import 'package:e_commerce_app/themes/text_themes.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import '../user_repo/user_repository.dart';
import 'bloc/r_bloc.dart';

class RegisterScreen extends StatefulWidget {
  final UserRepository _userRepository;

  RegisterScreen({Key key,@required UserRepository userRepository}):
      assert(userRepository != null),
      _userRepository = userRepository,
      super(key:key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  RegisterBloc _registerBloc;

  UserRepository get _userRepository => widget._userRepository;

  @override
  void initState() {
    super.initState();
    _registerBloc = RegisterBloc(userRepository: _userRepository);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: appBarIconTheme,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: BlocProvider(
        bloc: _registerBloc,
        child: RegisterForm(userRepository: _userRepository),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _registerBloc.dispose();
  }
}
