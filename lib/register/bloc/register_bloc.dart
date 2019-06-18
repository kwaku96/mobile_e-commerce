import 'package:meta/meta.dart';
import 'package:rxdart/rxdart.dart';
import 'r_bloc.dart';
import 'package:bloc/bloc.dart';
import '../../user_repo/user_repository.dart';
import '../../validators.dart';


class RegisterBloc extends Bloc<RegisterEvent,RegisterState>{

  final UserRepository _userRepository;

  RegisterBloc({@required UserRepository userRepository}):
      assert(userRepository != null),
      _userRepository = userRepository;

  @override
  RegisterState get initialState => RegisterState.empty();

  @override
  Stream<RegisterState> transform(
      Stream<RegisterEvent> events,
      Stream<RegisterState> Function(RegisterEvent event) next) {

    final observableStream = events as Observable<RegisterEvent>;

    final nonDebounceStream = observableStream.where((event) {
      return (event is! EmailChanged && event is! PasswordChanged &&
      event is! NameChanged && event is! NumberChanged);
    });
    final debounceStream = observableStream.where((event) {
      return (event is EmailChanged || event is PasswordChanged || event
        is NameChanged || event is NumberChanged);
    }).debounceTime(Duration(milliseconds: 300));

    return super.transform(nonDebounceStream.mergeWith([debounceStream]), next);
  }

  @override
  Stream<RegisterState> mapEventToState(RegisterEvent event) async* {
    if(event is EmailChanged){
      yield* _mapEmailChangedToState(event.email);
    }else if(event is PasswordChanged){
      yield* _mapPasswordChangedToState(event.password);
    }else if(event is NameChanged){
      yield* _mapNameChangedToState(event.name);
    }else if(event is NumberChanged){
      yield* _mapNumberChangedToState(event.number);
    }else if(event is Submitted){
      yield* _mapSubmittedToState(event.email,event.password,
      event.name,event.number);
    }
  }

  Stream<RegisterState> _mapEmailChangedToState(String email) async* {
    yield currentState.update(isEmailValid: Validators.isValidEmail(email));
  }

  Stream<RegisterState> _mapPasswordChangedToState(String password) async* {
    yield currentState.update(
        isPasswordValid: Validators.isValidPassword(password)
    );
  }

  Stream<RegisterState> _mapNameChangedToState(String name) async* {
    yield currentState.update(
      isNameValid: Validators.isValidName(name)
    );
  }

  Stream<RegisterState> _mapNumberChangedToState(String number) async* {
    yield currentState.update(
      isNumberValid: Validators.isValidNumber(number)
    );
  }

  Stream<RegisterState> _mapSubmittedToState(
      String email, String password, String name, String number) async* {
    yield RegisterState.loading();
    try{
      await _userRepository.signUp(email: email,password: password);
      await _userRepository.addUserToDB(name, number);
      yield RegisterState.success();
    }catch(_){
      yield RegisterState.failure();
    }
  }

}