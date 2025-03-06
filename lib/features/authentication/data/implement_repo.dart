import 'package:auto_diary/features/authentication/data/data.dart';
import 'package:auto_diary/features/authentication/domain/repository.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthRepoImplement implements AuthRepo {
  AuthRepoImplement(this.supabaseDataSource);
  final SupaBaseDataSource supabaseDataSource;

  @override
  Future<Session?> nativeGoogleSignIn() {
    return supabaseDataSource.nativeGoogleSignIn();
  }

  @override
  Future<void> signOutUser() {
    return supabaseDataSource.signOutUser();
  }
}