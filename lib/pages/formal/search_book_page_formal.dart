import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_app/mobx/book_store.dart';
import 'package:test_app/model/categories.dart';
import 'package:test_app/pages/abstract/search_book_page_abstract.dart';
import 'package:test_app/pages/formal/book_details_page_formal.dart';
import 'package:test_app/utils/utils.dart';
import 'package:test_app/widgets/book_card_compact.dart';
import 'package:test_app/widgets/chips_widget.dart';

import '../../model/Book.dart';
import '../../utils/colors.dart';
import '../../utils/dimensions.dart';
import '../../widgets/stamp.dart';

class SearchBookPageNew extends StatefulWidget {
  @override
  _SearchBookStateNew createState() => _SearchBookStateNew();
}

class _SearchBookStateNew extends AbstractSearchBookState<SearchBookPageNew> {
  BookStore bookStore = BookStore();

  @override
  Widget build(BuildContext context) {
    const textStyle = const TextStyle(
        fontSize: 22.0, fontFamily: 'Segoe UI', fontWeight: FontWeight.bold);
    return Observer(builder: (context) {
      bookStore.category;
      return Padding(
          padding: EdgeInsets.symmetric(horizontal: Dimensions.width10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: Dimensions.height70,
              ),
              Expanded(
                child: CustomScrollView(
                  slivers: <Widget>[
                    SliverList(
                        delegate: SliverChildListDelegate(
                          [
                                Padding(
                                  padding:  EdgeInsets.symmetric(horizontal: Dimensions.height10, vertical: Dimensions.width10),
                                  child: Observer(builder: (context) {
                                    return Text(
                                        "Explore",
                                        style: textStyle.copyWith(
                                          fontWeight: FontWeight.w700,
                                          fontSize: Dimensions.height26,
                                          // fontFamily: 'Segoe UI',
                                        ));
                                  }),
                                ),

                            SizedBox(height: Dimensions.height5),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: Dimensions.width6),
                              child: Card(
                                  shadowColor: Colors.grey[200] ,
                                  color: AppColors.searchBarColor,
                                  elevation: Dimensions.height12,
                                  child: Padding(
                                    padding: EdgeInsets.all(0),
                                    child: TextField(
                                      decoration: InputDecoration(
                                          hintText: "Search your favourite book",
                                          hintStyle: TextStyle(
                                              color: AppColors.mainBlackColor,

                                              fontSize: Dimensions.height14,
                                              fontWeight: FontWeight.w400
                                          ),
                                          prefixIcon: Padding(
                                            padding: EdgeInsets.symmetric(horizontal: Dimensions.width8, vertical: Dimensions.height8),
                                            child: Icon(Icons.search, size: Dimensions.height16_4, color: AppColors.mainBlackColor,),
                                          ),
                                          border: InputBorder.none),
                                      onChanged: (string) => (subject.add(string)),
                                    ),
                                  )),
                            ),
                            SizedBox(height: Dimensions.height16),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: Dimensions.height10),
                              child: Text(
                                "Popular Genre",
                                // bookStore.currentCategory?.title == null
                                //     ? "Popular Genre"
                                //     : bookStore.currentCategory!.title!,
                                style: textStyle.copyWith(

                                    fontSize: Dimensions.height20,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                            SizedBox(height: Dimensions.height8),
                            // getGridForCategories(),
                            _buildExpandable(),
                            SizedBox(height: Dimensions.height20,),

                            items.isNotEmpty
                                ? Column(
                              children: [
                                Padding(
                                  padding:  EdgeInsets.only(
                                      left: Dimensions.width10, right: Dimensions.width10, top: Dimensions.height20, bottom:Dimensions.height20 ),
                                  child: Container(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      "${bookStore.currentCategory?.title ?? 'Top books' }",
                                      style: textStyle.copyWith(

                                          fontSize: Dimensions.height20,
                                          fontWeight: FontWeight.w400
                                      ),
                                    ),
                                  ),
                                ),
                                GridView.extent(
                                  padding: EdgeInsets.zero,
                                  maxCrossAxisExtent: Dimensions.height150,
                                  mainAxisSpacing: Dimensions.width30,
                                  shrinkWrap: true,
                                  physics: BouncingScrollPhysics(),
                                  children: items
                                      .map((Book book) => Stamp(
                                    book.url!,
                                    width:  Dimensions.width90,
                                    onClick: () {
                                      Navigator.of(context).push(FadeRoute(
                                        builder: (BuildContext context) =>
                                            Padding(
                                              padding:
                                              EdgeInsets.symmetric(horizontal: Dimensions.width8,vertical: Dimensions.height8),
                                              child:
                                              BookDetailsPageFormal(book),
                                            ),
                                        settings: RouteSettings(
                                            name: '/book_detais_formal'),
                                      ));
                                    },
                                  ))
                                      .toList(),
                                ),
                              ],
                            )
                                : SizedBox.shrink(),
                            items.isEmpty && isLoading == false
                                ? Container()
                                : isLoading == true
                                ? Column(
                              children: [
                                SizedBox(height: Dimensions.height100),
                                Center(
                                  child: CircularProgressIndicator(),
                                )
                              ],
                            )
                                : SizedBox.shrink(),
                          ],
                        ))
                  ],
                ),
              ),
            ],
          ),
        );
    }
    );
  }

  Widget getGridForCategories() {
    return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: bookStore.category.map((e) {
              return Observer(builder: (context) {
                bookStore.category;
                return ChipsWidget(e, () {
                  bookStore.updateCurrentCategory(e);
                  subject.add(e.title!);
                },
                    bookStore.currentCategory == e
                        ? Color(0xff31A7FB)
                        : Colors.white);
              });
            }).toList()));
  }

  Widget getExpandedCategories(List<Category> categories) {
    return Wrap(
        runSpacing: 10,
        // spacing: 5,
        children: categories.map((e) {
          return Observer(builder: (context) {
            bookStore.allCategories;
            return ChipsWidget(e, () {
              bookStore.updateCurrentCategory(e);
              subject.add(e.title!);
            },
                bookStore.currentCategory == e
                    ? Color(0xff31A7FB)
                    : Colors.white);
          });
        }).toList());
  }
  _buildExpandable() {
    return ExpandableNotifier(
      child: Expandable(
        collapsed: Wrap(
          // mainAxisAlignment: MainAxisAlignment.start,
          children: [
            getExpandedCategories(bookStore.allCategories.sublist(0, 5)),
            Padding(
              padding:  EdgeInsets.only(right: Dimensions.width24, top: Dimensions.height8),
              child: Align(
                alignment: Alignment.centerRight,
                child: ExpandableButton(
                  child: Text(
                    "see all >",
                    textAlign: TextAlign.end,
                    style: TextStyle(
                      fontSize: Dimensions.height18,
                      fontWeight: FontWeight.w400,
                      //fontFamily: GoogleFonts.ibarraRealNova().fontFamily,
                      color: AppColors.lightBlueColor,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        expanded: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              getExpandedCategories(bookStore.allCategories),
              // getExpandedCategories(bookStore.allCategories.sublist(5, )),
              // getExpandedCategories(bookStore.allCategories.sublist(6, 9)),
              Padding(
                padding:  EdgeInsets.only(right: Dimensions.width16),
                child: Align(
                    alignment: Alignment.bottomRight,
                    child: ExpandableButton(
                        child: Icon(
                          Icons.keyboard_arrow_up,
                        ))),
              )
            ]),
      ),
    );
  }
}
