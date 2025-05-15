part of 'services.dart';

class UserServices {
  static final CollectionReference _userCollection = FirebaseFirestore.instance.collection('users');

  static Future<void> updateUser(user_model.User user) async {
    // String genres = "";

    // for (var genre in user.selectedGenres) {
    //   genres += genre + (genre != user.selectedGenres.last ? "," : "");
    // }

    _userCollection.doc(user.id).set({
        'email': user.email,
        'name': user.name,
        'balance': user.balance,
        'selectedGenres': user.selectedGenres,
        'selectedLanguage': user.selectedLanguage,
        'profilePicture': user.profilePicture,
      });
  }

  static Future<user_model.User?> getUser(String id) async {

    DocumentSnapshot snapshot = await _userCollection.doc(id).get();

    return user_model.User(
      id,
      snapshot['email'],
      name: snapshot['name'],
      profilePicture: snapshot['profilePicture'],
      selectedGenres: snapshot['selectedGenres'],
      selectedLanguage: snapshot['selectedLanguage'],
      balance: snapshot['balance'],
    );
  }
}
