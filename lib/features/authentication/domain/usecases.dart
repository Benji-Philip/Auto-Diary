import 'package:auto_diary/features/authentication/domain/repository.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SignInWithGoogleUseCase {
  SignInWithGoogleUseCase(this.authRepo);
  final AuthRepo authRepo;

  Future<Session?> call(){
    return authRepo.signInWithGoogle();
  }
}

class SignOutUseCase {
  SignOutUseCase(this.authRepo);
  final AuthRepo authRepo;

  Future<void> call(){
    return authRepo.signOutUser();
  }
}