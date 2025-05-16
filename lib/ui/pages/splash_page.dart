part of 'pages.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: defaultMargin),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 136,
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage('assets/logo.png')),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 70, bottom: 20),
              child: Text(
                'New Experience',
                style: blackText.copyWith(fontSize: 20),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: SizedBox(
                  width: 200,
                  child: Text(
                    'Watch a new movie much easier than any before',
                    style: greyText.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.w300,
                    ),
                    textAlign:
                        TextAlign
                            .center, // Ensure text is centered within the SizedBox
                  ),
                ),
              ),
            ),
            Container(
              width: 250,
              height: 46,
              margin: EdgeInsets.only(top: 70, bottom: 20),
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                child: Text(
                  'Get Started',
                  style: whiteText.copyWith(fontSize: 16),
                ),
              ),
            ),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already Have an accout? ',
                    style: greyText.copyWith(fontWeight: FontWeight.w400),
                  ),
                  TextButton(onPressed: () {context.read<PageBloc>().add(GoToLoginPage());}, child: Text('Sign In', style: purpleText),)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
