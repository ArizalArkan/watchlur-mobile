part of 'services.dart';

class AuthServices {
  static final auth.FirebaseAuth _auth = auth.FirebaseAuth.instance;

  static Future<SignInSignUpResult> signUp(
    String email,
    String password,
    String name,
    String selectedGenres,
    String selectedLanguage,
  ) async {
    try {
      auth.UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);

      user_model.User? user = userCredential.user?.convertToUser(
        name: name,
        selectedGenres: selectedGenres,
        selectedLanguage: selectedLanguage,
      );

      if (user == null) {
        return SignInSignUpResult(message: "User creation failed.");
      }

      await UserServices.updateUser(user);

      return SignInSignUpResult(user: user);
    } on auth.FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return SignInSignUpResult(
          message: "The password provided is too weak.",
        );
      } else if (e.code == 'email-already-in-use') {
        return SignInSignUpResult(
          message: "The account already exists for that email.",
        );
      }
    } catch (e) {
      return SignInSignUpResult(message: e.toString());
    }

    // Default return statement to handle any unexpected cases
    return SignInSignUpResult(message: "An unknown error occurred.");
  }

  static Future<SignInSignUpResult> signIn(String email, String password) 
    async {
      try {
        auth.UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email,
          password: password,
        );

        user_model.User? user = await userCredential.user?.fromFireStore();

        if (user == null) {
          return SignInSignUpResult(message: "User not found.");
        }

        return SignInSignUpResult(user: user);

      } catch (e) {
        return SignInSignUpResult(message: e.toString());
      }
  }

  static Future<void> signOut() async {
    await _auth.signOut();
  }

  static Stream<auth.User?> get userStream => _auth.authStateChanges();

  
}

class SignInSignUpResult {
  final user_model.User? user;
  final String message;

  SignInSignUpResult({this.user, this.message = ""});
}
