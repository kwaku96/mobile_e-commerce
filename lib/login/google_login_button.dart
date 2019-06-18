import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/l_bloc.dart';

class GoogleLoginButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RaisedButton.icon(
      color: Colors.redAccent,
      icon: Icon(FontAwesomeIcons.google,color: Colors.white,),
      label: Text('Sign in with Google', style: TextStyle(color: Colors.white)),
      onPressed: (){
        BlocProvider.of<LoginBloc>(context).dispatch(
          LoginWithGooglePressed()
        );
      },
    );
  }
}
