import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:watchlur/models/models.dart' as user_model;
import 'package:watchlur/services/services.dart';
import 'package:logger/logger.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  var logger = Logger();

  UserBloc() : super(UserInitial()) {
    on<UserEvent>((event, emit) async {

      if (event is LoadUser) {
        try {
          user_model.User? user = await UserServices.getUser(event.id);

          emit(UserLoaded(user));
        } catch (e) {
          logger.e('Error loading user: $e');
        }
      } else if (event is SignOut) {
        emit(UserInitial());
      }
    });
  }
}
