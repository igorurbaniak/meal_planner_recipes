part of 'auth_cubit.dart';

class AuthenticationState extends Equatable {
  const AuthenticationState({required this.isSignedIn});

  final bool isSignedIn;
  
  @override
  List<Object> get props => [isSignedIn];

  AuthenticationState copyWith({required bool isSignedIn}) {
    return AuthenticationState(isSignedIn: isSignedIn);
  }
}
