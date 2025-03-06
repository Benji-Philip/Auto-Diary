import 'package:google_sign_in/google_sign_in.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupaBaseDataSource {
  SupaBaseDataSource({required this.supabase});

  final SupabaseClient supabase;

  //sign out
  Future<void> signOutUser() async {
    await supabase.auth.signOut();
  }

  //google sign in
  Future<Session?> nativeGoogleSignIn() async {
    const webClientId =
        '1012943339256-95g1jj88i0ph93g5ec5vr2bojng44v7r.apps.googleusercontent.com';
    final GoogleSignIn googleSignIn = GoogleSignIn(serverClientId: webClientId);
    final googleUser = await googleSignIn.signIn();
    final googleAuth = await googleUser!.authentication;
    final accessToken = googleAuth.accessToken;
    final idToken = googleAuth.idToken;

    if (accessToken == null) {
      throw 'No Access Token found.';
    }
    if (idToken == null) {
      throw 'No ID Token found.';
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
