part of 'user_bloc.dart';

sealed class UserState extends Equatable {
  const UserState();
  
  @override
  List<Object> get props => [];
}

final class UserInitial extends UserState {}

final class UserLoaded extends UserState {
  final user_model.User? user;

  const UserLoaded(this.user);

  @override
  List<Object> get props => [user!];
}

