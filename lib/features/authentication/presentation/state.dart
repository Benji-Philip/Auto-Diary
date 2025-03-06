import 'package:supabase_flutter/supabase_flutter.dart';

abstract class AuthenticationState{}

class AuthInitialState extends AuthenticationState{}

class AuthLoadingState extends AuthenticationState{}

class AuthenticatedState extends AuthenticationState{
  AuthenticatedState({required this.session});
  final Session session;
}

class UnauthenticatedState extends AuthenticationState{}

class AuthErrorState extends AuthenticationState{
  AuthErrorState(this.message);
  final String message;
}