import 'package:e_commerce_app/login/login_screen.dart';
import 'package:e_commerce_app/register/register_screen.dart';
import 'package:e_commerce_app/themes/text_themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../login/bloc/l_bloc.dart';
import '../user_repo/user_repository.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class GoogleAuthScreen extends StatefulWidget {

  final UserRepository _userRepository;

  GoogleAuthScreen({Key key, @required UserRepository userRepository})
      : assert(userRepository != null),
        _userRepository = userRepository,
        super(key: key);

  @override
  _GoogleAuthScreenState createState() => _GoogleAuthScreenState();
}

class _GoogleAuthScreenState extends State<GoogleAuthScreen> {
  LoginBloc _loginBloc;

  UserRepository get _userRepository => widget._userRepository;

  @override
  void initState() {
    super.initState();
    _loginBloc = LoginBloc(userRepository: _userRepository);
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener(
        bloc: _loginBloc,
        listener: (BuildContext context,LoginState state){

          if(state.isFailure){
            Scaffold.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(SnackBar(
                  backgroundColor: Colors.redAccent,
                  content: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text('Log In Failed'),
                      Icon(Icons.error)
                    ],
                  ),
                ));
          }else if(state.isSuccess){
            Navigator.of(context).pop();
            //TODO dispatch Authenticated
          }
        },
        child: BlocProvider(
          bloc: _loginBloc,
          child: Scaffold(
            backgroundColor: Colors.white,
            appBar: _appBar(context),
            body: _body(context),
          ),
        ),
    );
  }

  Widget _appBar(BuildContext context){
    return AppBar(
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      iconTheme: appBarIconTheme,
    );
  }

  Widget _body(BuildContext context){
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Container(
            height: size.height * 0.4,
            child: Image.asset(
              'assets/images/shopper.jpg',
              fit: BoxFit.fitHeight,
            ),
          ),
          Text(
            'Personalized your experience? Login with',
            style: TextStyle(fontSize: 14.0,color: Colors.black.withAlpha(100)),
          ),

          _googleButton(context),

          Text(
            'or use email address',
            style: TextStyle(fontSize: 14.0,color: Colors.black.withAlpha(100)),
          ),
          SizedBox(height: 15.0,),
          Container(
            width: size.width * 0.5,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[

                FlatButton(
                  child: Text(
                    'LOGIN',
                    style: TextStyle(color: Colors.green),
                  ),
                  onPressed:(){
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => LoginScreen(
                        userRepository: _userRepository
                      )
                    ));
                  } ,
                ),
                Text('|',style: TextStyle(fontSize: 20.0),),
                FlatButton(
                  onPressed: (){
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context)=> RegisterScreen(
                        userRepository: _userRepository,
                      )
                    ));
                  },
                  child: Text(
                    'SIGNUP',
                    style: TextStyle(color: Colors.green),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _googleButton(BuildContext context){
    Size size  = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical:25.0),
      child: InkWell(
        onTap: (){
          _loginBloc.dispatch(LoginWithGooglePressed());
        },
        child: Container(
          height: 40.0,
          width: size.width * 0.5,
          color: Colors.redAccent,
          child: Row(
            children: <Widget>[
              Container(
                color: Colors.black.withAlpha(100),
                width: size.width * 0.1,
                height: 40.0,
                child: Icon(FontAwesomeIcons.google,color: Colors.white,),
              ),
              Expanded(
                  child: Container(
                      child: Center(
                          child: Text(
                            'Login with Google',
                            style: TextStyle(color: Colors.white),
                          )
                      )
                  )
              ),

            ],
          ),
        ),
      ),
    );
  }

}
