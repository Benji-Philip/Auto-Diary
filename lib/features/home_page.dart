import 'package:auto_diary/features/authentication/presentation/bloc.dart';
import 'package:auto_diary/features/authentication/presentation/events.dart';
import 'package:auto_diary/ui_components/my_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.session});

  final Session session;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(session.user.email ?? "no email"),
            MyButton(
              onTap: () {
                context.read<AuthBloc>().add(SignOutUserEvent());
              },
              color: Theme.of(context).colorScheme.primary,
              child: Text(
                "Sign Out",
                style: GoogleFonts.poppins(
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
