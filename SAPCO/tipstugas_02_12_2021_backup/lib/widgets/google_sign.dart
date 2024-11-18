import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tipstugas/Server.dart';

class FirebaseService
{
	final FirebaseAuth _auth = FirebaseAuth.instance;
  	final GoogleSignIn _googleSignIn = GoogleSignIn();

	Future<GoogleSignInAccount?> signInwithGoogle() async
  	{
    	try
		{
			final GoogleSignInAccount googleSignInAccount = await _googleSignIn.signIn();
			final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount.authentication;
			final AuthCredential credential = GoogleAuthProvider.credential
			(
				accessToken: googleSignInAuthentication.accessToken,
				idToken: googleSignInAuthentication.idToken,
      		);

      		await _auth.signInWithCredential(credential);

			var response = await Server.login(googleSignInAccount.email, googleSignInAccount.displayName, googleSignInAuthentication.accessToken);

			return googleSignInAccount;
    	}
		on FirebaseAuthException catch (e)
		{
			print(e.message);
			throw e;
    	}
  	}

  	Future<void> signOutFromGoogle() async
	{
		await _googleSignIn.signOut();
		await _auth.signOut();
  	}
}