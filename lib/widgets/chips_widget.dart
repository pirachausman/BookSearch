import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_app/model/categories.dart';
import 'package:test_app/utils/dimensions.dart';

class ChipsWidget extends StatelessWidget {
   ChipsWidget(this.category, this.callback, this.color, {Key? key})
      : super(key: key);
  final Category category;
  final VoidCallback callback;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: Dimensions.width6),
      child: Card(
        color: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Dimensions.height26),
          side: BorderSide(
            color: Colors.black,
            width: 2,
          ),
        ),
        child: InkWell(
          splashColor: Colors.blue.shade900,
          highlightColor: Colors.blue.shade200,
          borderRadius: BorderRadius.circular(Dimensions.height15),
          onTap: () {
            callback();
          },
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: Dimensions.width20, vertical: Dimensions.height8),
            child: Text(
              category.title ?? "chip",
              style: TextStyle(
                  fontFamily: GoogleFonts.openSans().fontFamily,
                  fontWeight: FontWeight.w400,
                  fontSize: Dimensions.height15),
            ),
          ),
        ),
      ),
    );
  }
}
