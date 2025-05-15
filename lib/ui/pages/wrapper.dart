part of 'pages.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final auth.User? authUser = Provider.of<auth.User?>(context);

    if (authUser == null) {
      if (prevPageEvent is! GoToSplashPage) {
        prevPageEvent = GoToSplashPage();
        context.read<PageBloc>().add(prevPageEvent!);
      }
      context.read<PageBloc>().add(GoToSplashPage());
    } else {
      if (prevPageEvent is! GoToMainPage) {
        context.read<UserBloc>().add(LoadUser(authUser.uid));
      
        prevPageEvent = GoToMainPage();
        context.read<PageBloc>().add(prevPageEvent!);
      }
    }

    return BlocBuilder<PageBloc, PageState>(
      builder:
          (_, pageState) =>
              (pageState is OnSplashPage)
                  ? SplashPage()
                  : (pageState is OnLoginPage)
                  ? SignInPage()
                  : MainPage(),
    );
  }
}
