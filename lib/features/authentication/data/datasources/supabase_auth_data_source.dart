import 'package:easacc/features/authentication/data/datasources/auth_repo_data_source.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseAuthDataSource extends AuthRepoDatasource {
  final SupabaseClient supabaseClient;
  const SupabaseAuthDataSource({required this.supabaseClient});

  @override
  Future<void> googleLogin() async {
    await supabaseClient.auth.signInWithOAuth(
      OAuthProvider.google,
      redirectTo: "com.karimelabasy.easacc://login-callback/",
    );

    final session = supabaseClient.auth.currentSession;

    if (session == null) {
      throw Exception("Google login failed: No active session.");
    }
  }

  @override
  Future<void> facebookLogin() async {
    // Start Facebook OAuth
    await supabaseClient.auth.signInWithOAuth(
      OAuthProvider.facebook,
      redirectTo: "com.karimelabasy.easacc://login-callback/",
    );
    final session = supabaseClient.auth.currentSession;

    if (session == null) {
      throw Exception("Facebook login failed: No active session.");
    }
  }
}
