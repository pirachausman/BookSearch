import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:test_app/model/Book.dart';
import 'package:test_app/pages/formal/book_details_page_formal.dart';
import 'package:test_app/utils/dimensions.dart';
import 'package:test_app/utils/utils.dart';
import 'package:test_app/widgets/stamp.dart';

class CollectionPreview extends StatefulWidget {
  final List<Book> books;

  final Color color;

  final String title;

  final bool loading;

  CollectionPreview(
      {this.color = Colors.white,
      required this.title,
      required this.books,
      this.loading = false});

  @override
  State<StatefulWidget> createState() => _CollectionPreviewState();
}

class _CollectionPreviewState extends State<CollectionPreview> {
  @override
  Widget build(BuildContext context) {
    const textStyle = const TextStyle(
        fontSize: 32.0, fontFamily: 'CrimsonText', fontWeight: FontWeight.w400);
    return Align(
      heightFactor: Dimensions.height0_7,
      alignment: Alignment.topCenter,
      child: Stack(
        children: <Widget>[
          SizedBox(
            height: Dimensions.height1400 ,//Dimensions.height200,
            child: GridView.extent(
              padding: EdgeInsets.zero,
              maxCrossAxisExtent:  Dimensions.height150,
              // crossAxisSpacing:Dimensions.height ,
              mainAxisSpacing: Dimensions.width30,
              shrinkWrap: true,
              physics: BouncingScrollPhysics(),
              children: widget.books
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
              )).toList(),
            )
          ),
          widget.loading
              ? Container(
                child: Center(
                    child: CircularProgressIndicator(),
                  ),
              )
              : Container(),
        ],
      ),
    );
  }
}
