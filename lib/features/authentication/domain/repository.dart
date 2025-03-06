import 'package:supabase_flutter/supabase_flutter.dart';

abstract class AuthRepo {
  Future<void> signOutUser();
  Future<Session?> nativeGoogleSignIn();
}