import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseAuthDataSource {
  SupabaseAuthDataSource({required this.supabase});

  final SupabaseClient supabase;

  final List<String> scopes = <String>[
    'email',
    'https://www.googleapis.com/auth/contacts.readonly',
  ];

  //sign out
  Future<void> signOutUser() async {
    await supabase.auth.signOut();
  }

  //google sign in
  Future<Session?> signInWithGoogle() async {
    if (kIsWeb) {
      // only works for local port 3000
      await supabase.auth.signInWithOAuth(
        OAuthProvider.google,
        redirectTo:
            null, // Optionally set the redirect link to bring back the user via deeplink.
        authScreenLaunchMode:
            kIsWeb
                ? LaunchMode.platformDefault
                : LaunchMode
                    .externalApplication, // Launch the auth screen in a new webview on mobile.
      );
      final session = supabase.auth.currentSession;
      if (session == null) return null;
      return session;
    }
    var webClientId = dotenv.env['WEBCLIENT_ID'] ?? 'default';
    final GoogleSignIn googleSignIn =
        kIsWeb
            ? GoogleSignIn(clientId: webClientId)
            : GoogleSignIn(serverClientId: webClientId);
    final googleUser = await googleSignIn.signIn();
    final googleAuth = await googleUser!.authentication;
    final accessToken = googleAuth.accessToken;
    final idToken = googleAuth.idToken;

    if (idToken == null) {
      throw 'No ID Token found.';
    }
    if (accessToken == null) {
      throw 'No Access Token found.';
    }

    await supabase.auth.signInWithIdToken(
      provider: OAuthProvider.google,
      idToken: idToken,
      accessToken: accessToken,
    );

    final session = supabase.auth.currentSession;
    if (session == null) return null;
    return session;
  }
}
