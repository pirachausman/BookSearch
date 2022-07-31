import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_app/model/Book.dart';
import 'package:test_app/pages/abstract/stamp_collection_page_abstract.dart';
import 'package:test_app/pages/formal/book_details_page_formal.dart';
import 'package:test_app/utils/colors.dart';
import 'package:test_app/utils/dimensions.dart';
import 'package:test_app/utils/utils.dart';
import 'package:test_app/widgets/stamp.dart';

class StampCollectionFormalPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _StampCollectionPageFormalState();
}

class _StampCollectionPageFormalState
    extends StampCollectionPageAbstractState<StampCollectionFormalPage> {
  @override
  Widget build(BuildContext context) {
    const textStyle = const TextStyle(
        fontSize: 34.0, fontFamily: 'Segoe UI', fontWeight: FontWeight.w800);

    Widget body;

    if (items.isEmpty) {
      body = Center(child: Text("You have no collection yet"));
    }

    body = GridView.extent(
      padding: EdgeInsets.zero,
      maxCrossAxisExtent:  Dimensions.height150,
      // crossAxisSpacing:Dimensions.height5 ,
      mainAxisSpacing: Dimensions.width30,
      shrinkWrap: true,
      physics: ScrollPhysics(),
      children: items
          .map((Book book) => Stamp(
                book.url!,
                width:  Dimensions.width90,
                onClick: () {
                  Navigator.of(context).push(FadeRoute(
                    builder: (BuildContext context) =>
                        BookDetailsPageFormal(book),
                    settings: RouteSettings(name: '/book_detais_formal'),
                  ));
                },
              ))
          .toList(),
    );

    body = Container(
      padding: EdgeInsets.symmetric(horizontal: Dimensions.width16, vertical: Dimensions.height16),
      child: body,
      color: AppColors.backWhiteColor,
    );

    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: Dimensions.heigh80,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: Dimensions.width16),
            child: Text(
              "My Stamps",
              style: textStyle.copyWith(
                  //fontFamily: GoogleFonts.ibarraRealNova().fontFamily,
                  fontSize: Dimensions.height26),
            ),
          ),
          Expanded(
              child: CustomScrollView(slivers: <Widget>[
            SliverList(
                delegate: SliverChildListDelegate([
              body,
            ]))
          ]))
        ],
      );
  }
}
