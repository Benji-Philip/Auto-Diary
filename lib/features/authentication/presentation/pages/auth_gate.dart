import 'package:auto_diary/features/authentication/data/data.dart';
import 'package:auto_diary/features/authentication/data/implement_repo.dart';
import 'package:auto_diary/features/authentication/domain/usecases.dart';
import 'package:auto_diary/features/authentication/presentation/bloc.dart';
import 'package:auto_diary/features/authentication/presentation/pages/sign_in.dart';
import 'package:auto_diary/features/authentication/presentation/state.dart';
import 'package:auto_diary/features/home/data/data.dart';
import 'package:auto_diary/features/home/data/implement_repo.dart';
import 'package:auto_diary/features/home/domain/usecases.dart';
import 'package:auto_diary/features/home/presentation/bloc.dart';
import 'package:auto_diary/features/home/presentation/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthGate extends StatelessWidget {
  AuthGate({super.key});

  final SupabaseClient _supabase = Supabase.instance.client;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      // provider
      providers: [
        BlocProvider<AuthBloc>(
          create:
              (context) => AuthBloc(
                SignInWithGoogleUseCase(
                  AuthRepoImplement(
                    SupabaseAuthDataSource(supabase: _supabase),
                  ),
                ),
                SignOutUseCase(
                  AuthRepoImplement(
                    SupabaseAuthDataSource(supabase: _supabase),
                  ),
                ),
                Supabase.instance.client,
              ),
        ),
        BlocProvider(
          create:
              (context) => HomeBloc(
                AddEntryUseCase(
                  HomeRepoImplement(
                    SupabaseHomeDataSource(supabase: _supabase),
                  ),
                ),
                Supabase.instance.client,
              ),
        ),
      ],
      // UI
      child: Scaffold(
        body: SafeArea(
          child: BlocBuilder<AuthBloc, AuthenticationState>(
            builder: (context, state) {
              if (state is AuthLoadingState) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is AuthenticatedState) {
                return MyHomePage(session: state.session);
              } else {
                return SignInPage(state: state);
              }
            },
          ),
        ),
      ),
    );
  }
}
