import 'package:auto_diary/features/authentication/data/data.dart';
import 'package:auto_diary/features/authentication/domain/repository.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthRepoImplement implements AuthRepo {
  AuthRepoImplement(this.supabaseAuthDataSource);
  final SupabaseAuthDataSource supabaseAuthDataSource;

  @override
  Future<Session?> signInWithGoogle() {
    return supabaseAuthDataSource.signInWithGoogle();
  }

  @override
  Future<void> signOutUser() {
    return supabaseAuthDataSource.signOutUser();
  }
}