import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:test_app/mobx/user_store.dart';
import 'package:test_app/pages/navigation.dart';
import 'package:test_app/utils/colors.dart';

import '../../utils/dimensions.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  UserStore? userStore;

  @override
  void initState() {
    userStore = UserStore();
    super.initState();
  }

  @override
  void didChangeDependencies() {


    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: Dimensions.height597,
            width: Dimensions.width597,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/welcome.png"),
                fit: BoxFit.fill
              )
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: Dimensions.width412,
              height: Dimensions.height230,
              alignment: Alignment.bottomCenter,
              decoration: BoxDecoration(
                color: AppColors.backWhiteColor,
                  borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(Dimensions.radius25),
                            topRight: Radius.circular(Dimensions.radius25)),
              ),

                child: ConstrainedBox(
                  constraints: BoxConstraints(
                      minHeight: Dimensions.height230,
                      maxHeight: Dimensions.height230,
                      minWidth:double.infinity, //Dimensions.width412,
                      maxWidth:double.infinity,), //Dimensions.width412),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Collect book as you read them,virtually.",
                        style: TextStyle(
                            fontSize: Dimensions.height18,
                            fontFamily: GoogleFonts.openSans().fontFamily,
                            fontWeight: FontWeight.w700),
                      ),
                      SizedBox(
                        height: Dimensions.height30,
                      ),
                      Text(
                        "Get started",
                        style: TextStyle(
                            fontSize: Dimensions.height18,
                            fontFamily: GoogleFonts.openSans().fontFamily,
                            fontWeight: FontWeight.w700),
                      ),
                      SizedBox(
                        height: Dimensions.height20,
                      ),
                      ElevatedButton.icon(

                          icon: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset(
                              "assets/google.png",
                              width: Dimensions.height23_91,
                              height: Dimensions.height23_91,
                            ),
                          ),
                          label: Padding(
                            padding: EdgeInsets.symmetric(vertical: Dimensions.height12),
                            child: Text(
                              "Continue with Google",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: Dimensions.height18,
                                  fontWeight: FontWeight.w700,
                                  fontFamily:
                                      GoogleFonts.montserrat().fontFamily),
                            ),
                          ),
                          style: ButtonStyle(
                            minimumSize: MaterialStateProperty.all(Size(Dimensions.width364, Dimensions.height63)),
                              foregroundColor:
                                  MaterialStateProperty.all<Color>(Colors.white),
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  AppColors.gButtonColor),
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(Dimensions.radius6),
                                      side: BorderSide(
                                          color: AppColors.mainBlackColor, width: Dimensions.width3)))),
                          onPressed: () async {
                            if (userStore?.user?.id == null) {
                              await userStore?.handleSignIn().then((value) {
                                if (value == 0) {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              NavigationScreen()));
                                }
                              });
                            }
                            else {
                              print(userStore?.user?.id);
                              print(userStore?.currentUser?.displayName);
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => NavigationScreen()));
                            }
                          })
                    ],
                  ),
                )),
          )
        ],
      ),
    );
  }
}
