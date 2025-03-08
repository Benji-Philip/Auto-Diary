import 'package:auto_diary/features/authentication/presentation/bloc.dart';
import 'package:auto_diary/features/authentication/presentation/events.dart';
import 'package:auto_diary/features/authentication/presentation/state.dart';
import 'package:auto_diary/ui_components/my_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key, required this.state});
  final AuthenticationState state;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Login",
          style: GoogleFonts.poppins(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        MyButton(
          onTap: () {
            context.read<AuthBloc>().add(GoogleSignInEvent());
          },
          color: Theme.of(context).colorScheme.primary,
          child: Text(
            "Sign In",
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.onPrimary,
            ),
          ),
        ),
      ],
    );
  }
}
