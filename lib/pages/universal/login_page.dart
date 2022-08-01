import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:test_app/mobx/user_store.dart';
import 'package:test_app/pages/navigation.dart';
import 'package:test_app/utils/colors.dart';

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
    double pageWidth = MediaQuery.of(context).size.width;
    double pageHeight = MediaQuery.of(context).size.height;
    double height597 = pageHeight /1.35;
    double width597 = pageWidth / 0.65 ;
    double width412 = pageWidth / 0.9514563106796117 ;
    double height230 = pageHeight /3.50;
    double radius25 = pageHeight / 34;
    double height18 = pageHeight /44.77;
    double height20 = pageHeight /40.3;
    double height23_91 = pageHeight /33.7;
    double height63 = pageHeight /12.79365079365079;
    double width364 = pageWidth / 1.07 ;
    double radius6 = pageWidth / 65.33333333333333;
    double width3 = pageWidth / 130.6 ;
    double height30 = pageHeight /26.86;
    double height12 = pageHeight /67.16;
    double width8 = pageWidth / 49;
    double height8 = pageHeight /100.75;

    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: height597,
            width: width597,
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
              width: width412,
              height: height230,
              alignment: Alignment.bottomCenter,
              decoration: BoxDecoration(
                color: AppColors.backWhiteColor,
                  borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(radius25),
                            topRight: Radius.circular(radius25)),
              ),

                child: ConstrainedBox(
                  constraints: BoxConstraints(
                      minHeight: height230,
                      maxHeight: height230,
                      minWidth:double.infinity, //Dimensions.width412,
                      maxWidth:double.infinity,), //Dimensions.width412),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Collect book as you read them,virtually.",
                        style: TextStyle(
                            fontSize: height18,
                            fontFamily: GoogleFonts.openSans().fontFamily,
                            fontWeight: FontWeight.w700),
                      ),
                      SizedBox(
                        height: height30,
                      ),

                      Text(
                        "Get started",
                        style: TextStyle(
                            fontSize: height18,
                            fontFamily: GoogleFonts.openSans().fontFamily,
                            fontWeight: FontWeight.w700),
                      ),
                      SizedBox(
                        height: height20,
                      ),
                      ElevatedButton.icon(

                          icon: Padding(
                            padding: EdgeInsets.symmetric(horizontal: height8, vertical: width8),
                            child: Image.asset(
                              "assets/google.png",
                              width: height23_91,
                              height: height23_91,
                            ),
                          ),
                          label: Padding(
                            padding: EdgeInsets.symmetric(vertical: height12),
                            child: Text(
                              "Continue with Google",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: height18,
                                  fontWeight: FontWeight.w700,
                                  fontFamily:
                                      GoogleFonts.montserrat().fontFamily),
                            ),
                          ),
                          style: ButtonStyle(
                            minimumSize: MaterialStateProperty.all(Size(width364, height63)),
                              foregroundColor:
                                  MaterialStateProperty.all<Color>(Colors.white),
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  AppColors.gButtonColor),
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(radius6),
                                      side: BorderSide(
                                          color: AppColors.mainBlackColor, width: width3)))),
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
