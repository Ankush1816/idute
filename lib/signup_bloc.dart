import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';


abstract class SignUpEvent extends Equatable {
  const SignUpEvent();
}

class SignUpWithEmailAndPassword extends SignUpEvent {
  final String email;
  final String password;

  const SignUpWithEmailAndPassword({required this.email, required this.password});

  @override
  List<Object> get props => [email, password];
}


abstract class SignUpState extends Equatable {
  const SignUpState();

  @override
  List<Object> get props => [];
}

class SignUpInitial extends SignUpState {}

class SignUpLoading extends SignUpState {}

class SignUpSuccess extends SignUpState {}

class SignUpFailure extends SignUpState {
  final String errorMessage;

  const SignUpFailure(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}

// BLoC
class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final FirebaseAuth _firebaseAuth;

  SignUpBloc(this._firebaseAuth) : super(SignUpInitial());

  @override
  Stream<SignUpState> mapEventToState(SignUpEvent event) async* {
    if (event is SignUpWithEmailAndPassword) {
      yield SignUpLoading();
      try {
        await _firebaseAuth.createUserWithEmailAndPassword(
          email: event.email,
          password: event.password,
        );
        yield SignUpSuccess();
      } catch (e) {
        yield SignUpFailure(e.toString());
      }
    }
  }
}