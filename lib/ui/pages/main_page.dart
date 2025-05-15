part of 'pages.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Main Page'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              // Handle sign out
              AuthServices.signOut();
            },
          ),
        ],
      ),
      body: Center(
        child: BlocBuilder<UserBloc, UserState>(
          builder:
              (_, userState) =>
                  (userState is UserLoaded)
                      ? Text('Hallo, ${userState.user?.name}')
                      : SizedBox(),
        ),
      ),
    );
  }
}
