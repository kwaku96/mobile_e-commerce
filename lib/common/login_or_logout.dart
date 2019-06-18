import 'package:e_commerce_app/screens/google_auth_screen.dart';
import 'package:e_commerce_app/themes/text_themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../authentication/a_bloc.dart';
import '../user_repo/user_repository.dart';

class LoginLogoutButton extends StatelessWidget {

  final UserRepository _userRepository;

  LoginLogoutButton({Key key,@required UserRepository userRepository}):
    assert(userRepository != null),
    _userRepository = userRepository,
    super(key:key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: BlocProvider.of<AuthenticationBloc>(context),
      builder: (BuildContext context,AuthenticationState state){
        if(state is Authenticated){
          return ListTile(
            leading: Icon(Icons.exit_to_app,color: Colors.redAccent,),
            title: Text('Logout',style: redTextStyle,),
            onTap: (){
              BlocProvider.of<AuthenticationBloc>(context).dispatch(
                LoggedOut()
              );
            },
          );
        }

        if(state is Unauthenticated){
          return ListTile(
            leading: Icon(Icons.exit_to_app,color: Colors.green,),
            title: Text('Giris Yap / Uye Ol',style: greenTextStyle,),
            onTap: (){
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context)=>GoogleAuthScreen(
                    userRepository: _userRepository,
                  ))
              );
            },
          );
        }
      },
    );
  }

}
