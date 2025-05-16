import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:watchlur/bloc/page_bloc.dart';
import 'package:watchlur/bloc/theme_bloc.dart';
import 'package:watchlur/bloc/user_bloc.dart';
import 'package:watchlur/services/services.dart';
import 'package:watchlur/ui/pages/pages.dart';

void main() async {
  // This is crucial for Firebase initialization
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Firebase first
  await Firebase.initializeApp();

  // Initialize Supabase
  await Supabase.initialize(
    url: 'https://ysejujoqtgartoedbrgx.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InlzZWp1am9xdGdhcnRvZWRicmd4Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDY4OTY2NTUsImV4cCI6MjA2MjQ3MjY1NX0.Y04YvKcbj36bTzahmlcX0mNTTllP2n531jBZZGFm9J4',
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamProvider.value(
      value: AuthServices.userStream,
      initialData: null,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => PageBloc()),
          BlocProvider(create: (_) => UserBloc()),
          BlocProvider(create: (_) => ThemeBloc())
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Wrapper()
        ),
      ),
    );
  }
}
