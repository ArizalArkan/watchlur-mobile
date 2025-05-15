part of 'extensions.dart';

extension FirebaseUserExtension on auth.User {
  User convertToUser({
    String name = "Arkan",
    String selectedGenres = '',
    String selectedLanguage = "en",
    int balance = 70000,
  }) => User(
    uid,
    email ?? '',
    name: name,
    balance: balance,
    selectedGenres: selectedGenres,
    selectedLanguage: selectedLanguage,
  );

  Future<User?> fromFireStore() async => await UserServices.getUser(uid);

}
