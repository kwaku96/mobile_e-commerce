import 'package:flutter/material.dart';
import '../user_repo/user_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../register/bloc/r_bloc.dart';
import '../authentication/a_bloc.dart';

class RegisterForm extends StatefulWidget {
  final UserRepository _userRepository;

  RegisterForm({Key key,@required UserRepository userRepository}):
      assert(userRepository != null),
      _userRepository = userRepository,
      super(key:key);

  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _numberController = TextEditingController();

  bool get isPopulated =>
       _emailController.text.isNotEmpty &&
        _passwordController.text.isNotEmpty && _nameController.text.isNotEmpty
        && _numberController.text.isNotEmpty;


  bool isSubmitButtonEnabled(RegisterState state){
    return state.isFormValid && !state.isSubmitting && isPopulated;
  }

  RegisterBloc _registerBloc;

  UserRepository get _userRepository => widget._userRepository;

  @override
  void initState() {
    super.initState();
    _registerBloc = RegisterBloc(userRepository: _userRepository);
    _emailController.addListener(_onEmailChanged);
    _passwordController.addListener(_onPasswordChanged);
    _nameController.addListener(_onNameChanged);
    _numberController.addListener(_onNumberChanged);
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener(
      bloc: _registerBloc,
      listener: (BuildContext context,RegisterState state){
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

        if(state.isSuccess){
          BlocProvider.of<AuthenticationBloc>(context).dispatch(LoggedIn());
          Navigator.of(context).pop();
          Navigator.of(context).pop();//TODO check here
        }

      },

      child: BlocBuilder(
        bloc: _registerBloc,
        builder: (BuildContext context,RegisterState state){
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

                TextFormField(
                  controller: _nameController,
                  autovalidate: true,
                  autocorrect: false,
                  decoration: InputDecoration(
                    icon: Icon(Icons.account_circle),
                    labelText: 'Name'
                  ),
                  validator: (_){
                    return !state.isNameValid ? "Enter a valid name" : null;
                  },
                ),

                TextFormField(
                  controller: _numberController,
                  keyboardType: TextInputType.phone,
                  maxLength: 10,
                  autovalidate: true,
                  autocorrect: false,
                  decoration: InputDecoration(
                    icon: Icon(Icons.phone_iphone),
                    labelText: 'Phone Number'
                  ),
                  validator: (_){
                    return !state.isNumberValid ? "Enter a valid phone number":
                        null;
                  },
                ),

                SizedBox(height: 40.0,),

                /* Submit Button */
                RaisedButton(
                  color: Colors.green,
                  onPressed: isSubmitButtonEnabled(state) ?_onSubmitForm : null,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('SIGN UP',style: TextStyle(color: Colors.white),),
                    ],
                  ),
                ),

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
    _nameController.dispose();
    _numberController.dispose();
  }

  void _onSubmitForm(){
    _registerBloc.dispatch(Submitted(
        email: _emailController.text,
        password: _passwordController.text,
        name: _nameController.text,
        number: _numberController.text
    ));
  }

  void _onEmailChanged() {
    _registerBloc.dispatch(EmailChanged(email: _emailController.text));
  }

  void _onPasswordChanged() {
    _registerBloc.dispatch(PasswordChanged(password: _passwordController.text));
  }

  void _onNameChanged() {
    _registerBloc.dispatch(NameChanged(name: _nameController.text));
  }

  void _onNumberChanged() {
    _registerBloc.dispatch(NumberChanged(number: _numberController.text));
  }

}
