import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_app/main.dart';
import 'package:test_app/mobx/user_store.dart';
import 'package:test_app/pages/abstract/profile_page_abstract.dart';
import 'package:test_app/utils/colors.dart';
import 'package:test_app/utils/dimensions.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends ProfilePageAbstractState {
  UserStore userStore = UserStore();

  @override
  Widget build(BuildContext context) {
    const textStyle = const TextStyle(
        fontSize: 34.0, fontFamily: 'Segoe UI', fontWeight: FontWeight.w800);

    return Scaffold(
      backgroundColor: AppColors.backWhiteColor,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: Dimensions.width10),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: Dimensions.heigh80,
                ),
                Text(
                  "My Profile",
                  style: textStyle.copyWith(
                    fontWeight: FontWeight.w700,
                      // fontFamily: GoogleFonts.ibarraRealNova().fontFamily,
                      fontSize: Dimensions.height24),
                ),
                SizedBox(
                  height: Dimensions.height24,
                ),
                Card(
                  shadowColor: AppColors.backWhiteColor,
                  color: Color(0XFFF6F6F6),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(Dimensions.radius6)),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 3,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: Dimensions.width16, vertical: Dimensions.height16),
                          child: Container(
                            // width: Dimensions.width85,
                            // height: Dimensions.height85,
                            decoration: new BoxDecoration(
                              color: Color(0XFF3B56FF),
                              shape: BoxShape.circle,
                            ),
                            child: Center(child: Observer(builder: (context) {
                              return userStore.user?.photoUrl == null
                                  ? Text(
                                      userStore.user?.displayName?.substring(0, 1).toUpperCase() ??
                                          "",
                                      style: TextStyle(
                                          fontSize: Dimensions.height45,
                                          color: Colors.white,
                                          // fontFamily: GoogleFonts.openSans()
                                          //     .fontFamily),
                                      ))
                                  : CachedNetworkImage(
                                      imageUrl: userStore.user!.photoUrl!,
                                      fit: BoxFit.fill,
                                      imageBuilder: (context, imageProvider) =>
                                          Container(
                                            width: Dimensions.width66,
                                            height: Dimensions.height66,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              image: DecorationImage(
                                                  image: imageProvider,
                                                  fit: BoxFit.cover),
                                            ),
                                          ),
                                      placeholder: (context, url) =>
                                          CircularProgressIndicator());
                            })),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 7,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Observer(builder: (context) {
                              return Text(
                                userStore.user?.displayName?.toUpperCase() ?? "",
                                style: TextStyle(
                                    fontSize: Dimensions.height21,
                                    color: AppColors.mainBlackColor,
                                    fontWeight: FontWeight.w400,
                                    // fontFamily:
                                    //     GoogleFonts.openSans().fontFamily),
                                ));
                            }),
                            SizedBox(
                              height: Dimensions.height6,
                            ),
                            Observer(builder: (context) {
                              return Text(
                                "${userStore.user?.email}",
                                style: TextStyle(
                                    fontSize: Dimensions.height12,
                                    color: Color(0XFF31A7FB),
                                    // fontFamily:
                                    //     GoogleFonts.openSans().fontFamily),
                                ));
                            }),
                          ],
                        ),
                      )
                    ],
                  ),
                  elevation: 0,
                ),
                SizedBox(
                  height: Dimensions.height16,
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 5,
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                            maxWidth: Dimensions.width166,
                            minWidth: Dimensions.width166,
                            maxHeight: Dimensions.height98,
                            minHeight: Dimensions.height98),
                        child: Card(
                          color: Color(0XFFF6F6F6),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(Dimensions.radius6)),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Expanded(
                                flex: 5,
                                child: Padding(
                                  padding:  EdgeInsets.symmetric(horizontal: Dimensions.width5, vertical: Dimensions.height10),
                                  child: Center(
                                      child: Text(
                                    "$count",
                                    style: TextStyle(
                                        fontSize: Dimensions.height54,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.black,
                                        // fontFamily:
                                        //     GoogleFonts.openSans().fontFamily
                                    ),
                                  )),
                                ),
                              ),
                              Expanded(
                                flex: 4,
                                child: Text(
                                  "book(s) reading",
                                  style: TextStyle(
                                      fontSize: Dimensions.height17,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w400,
                                      // fontFamily:
                                      //     GoogleFonts.openSans().fontFamily
                                  ),
                                ),
                              )
                            ],
                          ),
                          elevation: 0,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: Dimensions.width10,
                    ),
                    Expanded(
                      flex: 5,
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                            maxWidth: Dimensions.width166,
                            minWidth: Dimensions.width166,
                            maxHeight: Dimensions.height98,
                            minHeight: Dimensions.height98),
                        child: Card(
                          color: Color(0XFFF6F6F6),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(Dimensions.radius6)),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Expanded(
                                flex: 5,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                                  child: Center(
                                      child: Text(
                                    "$count",
                                    style: TextStyle(
                                        fontSize: Dimensions.height54,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.black,
                                        // // fontFamily:
                                        // //     GoogleFonts.openSans().fontFamily
                                    ),
                                  )),
                                ),
                              ),
                              Expanded(
                                flex: 4,
                                child: Text(
                                  "book stamps collected",
                                  style: TextStyle(
                                      fontSize: Dimensions.height17,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w400,
                                      // fontFamily:
                                      //     GoogleFonts.openSans(). ),
                                  )),
                              )
                            ],
                          ),
                          elevation: 0,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: Dimensions.height36),
                child: ElevatedButton.icon(

                  style: ButtonStyle(
                    minimumSize: MaterialStateProperty.all(Size(Dimensions.width105, Dimensions.height44)),
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Color(0XFFFB4A59)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(Dimensions.radius40),
                      ),
                    ),
                  ),
                  icon: Padding(
                    padding: EdgeInsets.symmetric(horizontal: Dimensions.width8, vertical: Dimensions.height8),
                    child: Image.asset(
                      "assets/logout.png",
                      height: Dimensions.height13,
                      width: Dimensions.width15,
                    ),
                  ),
                  label: Padding(
                    padding: EdgeInsets.symmetric(horizontal: Dimensions.width8, vertical: Dimensions.height8),
                    child: Text("Logout", style: TextStyle(
                      fontSize: Dimensions.height14,
                      fontWeight: FontWeight.w700
                    ),),
                  ),
                  onPressed: () async {
                    await userStore.handleSignOut().then((value) {
                      Navigator.pushNamedAndRemoveUntil(context, "/login", (r) => false);
                    });

                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
