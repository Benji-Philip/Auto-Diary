import 'package:auto_diary/features/authentication/domain/usecases.dart';
import 'package:auto_diary/features/authentication/presentation/events.dart';
import 'package:auto_diary/features/authentication/presentation/state.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthBloc extends Bloc<AuthEvent, AuthenticationState> {
  final NativeSignInWithGoogleUseCase nativeSignInWithGoogle;
  final SignOutUseCase signOut;
  final SupabaseClient supabase;

  AuthBloc(this.nativeSignInWithGoogle, this.signOut, this.supabase)
    : super(AuthInitialState()) {
    supabase.auth.onAuthStateChange.listen((data) {
      final session = supabase.auth.currentSession;
      if (session != null) {
        add(AuthStateChangedEvent(session));
      } else {
        add(AuthStateChangedEvent(null));
      }
    });

    on<AuthStateChangedEvent>((event, emit) {
      if (event.session == null) {
        emit(UnauthenticatedState());
      } else {
        emit(AuthenticatedState(session: event.session!));
      }
    });

    on<NativeGoogleSignInEvent>((event, emit) async {
      HapticFeedback.heavyImpact();
      emit(AuthLoadingState());
      try {
        final session = await nativeSignInWithGoogle();
        if (session != null) {
          emit(AuthenticatedState(session: session));
        } else {
          emit(UnauthenticatedState());
          emit(AuthErrorState("Failed to sign in"));
        }
      } catch (e) {
        emit(AuthErrorState(e.toString()));
      }
    });
    on<SignOutUserEvent>((event, emit) async {
      HapticFeedback.heavyImpact();
      emit(AuthLoadingState());
      try {
        signOut();
        emit(UnauthenticatedState());
      } catch (e) {
        emit(AuthErrorState(e.toString()));
      }
    });
  }
}
