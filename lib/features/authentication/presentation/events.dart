import 'package:supabase_flutter/supabase_flutter.dart';

abstract class AuthEvent {}

class SignOutUserEvent extends AuthEvent {}

class GoogleSignInEvent extends AuthEvent {}

class AuthStateChangedEvent extends AuthEvent {
  final Session? session;
  AuthStateChangedEvent(this.session);
}