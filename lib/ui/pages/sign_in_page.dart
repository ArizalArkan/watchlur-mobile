part of 'pages.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool isEmailValid = false;
  bool isPasswordValid = false;
  bool isSigningIn = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: defaultMargin),
        child: ListView(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 45),
                SizedBox(height: 70, child: Image.asset("assets/logo.png")),
                Container(
                  margin: EdgeInsets.only(top: 70, bottom: 40),
                  child: Text(
                    'Welcome Back, \nCinephiles!',
                    style: blackText.copyWith(fontSize: 20),
                  ),
                ),
                TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: anccentColor2),
                    ),
                    floatingLabelStyle: TextStyle(color: anccentColor2),
                    labelText: 'Email Address',
                    hintText: 'Email Address',
                  ),
                ),
                SizedBox(height: 16),
                TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: anccentColor2),
                    ),
                    floatingLabelStyle: TextStyle(color: anccentColor2),
                    labelText: 'Password',
                    hintText: 'Password',
                  ),
                ),

                Row(
                  children: [
                    Text(
                      'Forgot Your password?',
                      style: greyText.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'Reset Here!',
                        style: purpleText.copyWith(fontSize: 14),
                      ),
                    ),
                  ],
                ),
                Center(
                  child: Container(
                    margin: EdgeInsets.only(top: 30, bottom: 50),
                    child: FloatingActionButton(
                      onPressed: () {},
                      shape: CircleBorder(),
                      backgroundColor: primaryColor,
                      child: const Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'New Here?',
                        style: greyText.copyWith(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'Sign Up Now!',
                          style: purpleText.copyWith(fontSize: 14),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
