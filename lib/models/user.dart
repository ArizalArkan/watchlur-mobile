part of 'models.dart';

class User extends Equatable {
  final String id;
  final String email;
  final String name;
  final String profilePicture;
  final String selectedGenres;
  final String selectedLanguage;
  final int balance;

  const User(
    this.id,
    this.email, {
    this.name = '',
    this.profilePicture = '',
    this.selectedGenres = '',
    this.selectedLanguage = '',
    this.balance = 0,
  });

  @override
  String toString() {
    return "[$id] - $name, $email";
  }

  @override
  List<Object?> get props => [
        id,
        email,
        name,
        profilePicture,
        selectedGenres,
        selectedLanguage,
        balance,
      ];
}