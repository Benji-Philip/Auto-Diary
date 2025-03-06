import 'package:supabase_flutter/supabase_flutter.dart';

abstract class AuthEvent {}

class SignOutUserEvent extends AuthEvent {}

class NativeGoogleSignInEvent extends AuthEvent {}

class AuthStateChangedEvent extends AuthEvent {
  final Session? session;
  AuthStateChangedEvent(this.session);
}