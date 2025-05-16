import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  var logger = Logger();
  ThemeBloc() : super(ThemeState(ThemeData())) {
    on<ThemeEvent>((event, emit) {
      logger.i('Theme event: $event');
      if (event is ChangeTheme) {

        logger.i('Theme changed to: ${event.themeData}');
        emit(ThemeState(event.themeData));
      }
    });
  }
}
