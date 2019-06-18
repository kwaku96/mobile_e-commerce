import 'package:flutter/material.dart';
import '../user_repo/user_repository.dart';
import 'bloc/l_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../authentication/a_bloc.dart';

class LoginForm extends StatefulWidget {

  final UserRepository _userRepository;

  LoginForm({Key key, @required UserRepository userRepository})
      : assert(userRepository != null),
        _userRepository = userRepository,
        super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();

}

class _LoginFormState extends State<LoginForm> {

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  LoginBloc _loginBloc;

  UserRepository get _userRepository => widget._userRepository;

  bool get isPopulated => _emailController.text.isNotEmpty &&
    _passwordController.text.isNotEmpty;

  bool isLoginButtonEnabled(LoginState state){
    return isPopulated && state.isFormValid && !state.isSubmitting;
  }

  @override
  void initState() {
    super.initState();
    _loginBloc = LoginBloc(userRepository: _userRepository);
    _emailController.addListener(_onEmailChanged);
    _passwordController.addListener(_onPasswordChanged);
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener(
      bloc: _loginBloc,
      listener: (BuildContext context,LoginState state){
        if(state.isSubmitting){
          Scaffold.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                SnackBar(
                  backgroundColor: Colors.black.withAlpha(200),
                  content: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text('Loading...'),
                      CircularProgressIndicator()
                    ],
                  ),
                )
              );
        }

        if(state.isFailure){

          Scaffold.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
                SnackBar(
                  backgroundColor: Colors.redAccent,
                  content: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text('Log In Failed'),
                      Icon(Icons.error)
                    ],
                  ),
                )
            );
        }

        if(state.isSuccess){
          BlocProvider.of<AuthenticationBloc>(context).dispatch(LoggedIn());
          Navigator.of(context).pop();
          Navigator.of(context).pop();//TODO check here
        }
      },
      child: BlocBuilder(
        bloc: _loginBloc,
        builder: (BuildContext context,LoginState state){
          return Form(
            child: ListView(
              padding: EdgeInsets.all(20.0),
              children: <Widget>[

                TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  autovalidate: true,
                  autocorrect: false,
                  decoration: InputDecoration(
                    icon: Icon(Icons.email),
                    labelText: 'Email',
                  ),
                  validator: (_){
                    return !state.isEmailValid ? 'Invalid Email' : null;
                  },
                ),

                TextFormField(
                  controller: _passwordController,
                  obscureText: true,
                  autovalidate: true,
                  autocorrect: false,
                  decoration: InputDecoration(
                    icon: Icon(Icons.lock),
                    labelText: 'Password'
                  ),
                  validator: (_){
                    return !state.isPasswordValid ? 'password must contain at a '
                        'letter\nand a number\nand at least 8 characters'
                        ' long' : null;
                  },
                ),

                Padding(
                  padding: EdgeInsets.symmetric(vertical: 20.0),
                  child: RaisedButton(
                    color: Colors.green,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('Login',style: TextStyle(
                            color: Colors.white,fontSize: 20.0
                        ),)
                      ],
                    ),
                    onPressed: isLoginButtonEnabled(state) ?
                      _onLoginButtonPressed: null,
                  ),
                ),

                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.0),
                  child: FlatButton(
                    child: Text('FORGOT PASSWORD?'),
                    onPressed: (){

                    },
                  ),
                )

              ],
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  void _onLoginButtonPressed(){
    _loginBloc.dispatch(LoginWithCredentialsPressed(
      email: _emailController.text,
      password: _passwordController.text
    ));
  }

  void _onEmailChanged() {
    _loginBloc.dispatch(
      EmailChanged(email: _emailController.text),
    );
  }

  void _onPasswordChanged() {
    _loginBloc.dispatch(
      PasswordChanged(password: _passwordController.text),
    );
  }

}
