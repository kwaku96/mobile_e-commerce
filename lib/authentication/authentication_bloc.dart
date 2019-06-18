import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'a_bloc.dart';
import '../user_repo/user_repository.dart';

class AuthenticationBloc extends Bloc<AuthenticationEvent,AuthenticationState>{

  final UserRepository _userRepository;

  AuthenticationBloc({@required UserRepository userRepository}):
      assert(userRepository != null),
      _userRepository = userRepository;

  @override
  AuthenticationState get initialState => Uninitialized();

  @override
  Stream<AuthenticationState> mapEventToState(AuthenticationEvent event) async*{

    if(event is AppStarted){
      yield* _mapAppStartedToState();
    }

    if(event is LoggedIn){
      yield* _mapLoggedInToState();
    }

    if(event is LoggedOut){
      yield* _mapLoggedOutToState();
      _userRepository.signOut();
    }

  }

  Stream<AuthenticationState> _mapAppStartedToState() async* {
    final bool isSignedIn  = await _userRepository.isSignedIn();
    try{
      if(isSignedIn){
        final displayName = (await _userRepository.getUser()).email;
        yield Authenticated(displayName: displayName);
      }else{
        yield Unauthenticated();
      }
    }catch(_){
      yield Unauthenticated();
    }
  }

  Stream<AuthenticationState> _mapLoggedInToState() async* {
    final displayName = (await _userRepository.getUser()).email;
    yield Authenticated(displayName: displayName);
  }

  Stream<AuthenticationState> _mapLoggedOutToState() async* {
    yield Unauthenticated();
  }

}