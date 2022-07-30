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

import '../../utils/colors.dart';
import '../../utils/dimensions.dart';

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
      return Scaffold(
        key: scaffoldKey,
        backgroundColor: AppColors.backWhiteColor,
        body: Column(
          children: [
            SizedBox(
              height: Dimensions.height60,
            ),
            Expanded(
              child: CustomScrollView(
                slivers: <Widget>[
                  SliverPadding(
                    padding:  EdgeInsets.symmetric(horizontal: Dimensions.width16, vertical: Dimensions.height16),
                    sliver: SliverToBoxAdapter(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(
                            height: Dimensions.height8,
                          ),
                          Text(
                            "Explore",
                            style: textStyle.copyWith(
                                // fontFamily:
                                //     GoogleFonts.ibarraRealNova().fontFamily,
                                fontSize: Dimensions.height26,
                              fontWeight: FontWeight.w700
                            ),
                          ),
                          SizedBox(height: Dimensions.height16),
                          Card(
                              color: AppColors.searchBarColor,
                              elevation: Dimensions.height16,
                              child: Padding(
                                padding:  EdgeInsets.all(0),
                                child: TextField(
                                  decoration: InputDecoration(
                                      hintText: "Search your favourite book",
                                      hintStyle: TextStyle(
                                          color: AppColors.mainBlackColor,
                                          // fontFamily: GoogleFonts.ibarraRealNova()
                                          //     .fontFamily,
                                          fontSize: Dimensions.height14,
                                          fontWeight: FontWeight.w400
                                      ),
                                      prefixIcon: Padding(
                                        padding:  EdgeInsets.symmetric(horizontal: Dimensions.width8, vertical: Dimensions.height8),
                                        child: Icon(Icons.search, size: Dimensions.height16_4, color: AppColors.mainBlackColor,),
                                      ),
                                      border: InputBorder.none),
                                  onChanged: (string) => (subject.add(string)),
                                ),
                              )),
                          SizedBox(
                            height: Dimensions.height16,
                          ),
                          Padding(
                            padding:
                                 EdgeInsets.symmetric(horizontal: Dimensions.height6),
                            child: Text(
                              bookStore.currentCategory?.title == null
                                  ? "Popular Genre"
                                  : bookStore.currentCategory!.title!,
                              style: textStyle.copyWith(
                                // fontFamily:
                                //     GoogleFonts.ibarraRealNova().fontFamily,
                                fontSize: Dimensions.height20,
                                fontWeight: FontWeight.w400
                              ),
                            ),
                          ),
                          SizedBox(height: Dimensions.height8),
                          getGridForCategories(),
                          _buildExpandable(),
                        ],
                      ),
                    ),
                  ),
                  isLoading
                      ? SliverToBoxAdapter(
                          child: Center(child: CircularProgressIndicator()),
                        )
                      : SliverToBoxAdapter(),
                  SliverList(
                      delegate: SliverChildBuilderDelegate(
                          (BuildContext context, int index) {
                    return BookCardCompact(
                      items[index],
                      onClick: () {
                        Navigator.of(context).push(FadeRoute(
                          builder: (BuildContext context) =>
                              BookDetailsPageFormal(items[index]),
                          settings: RouteSettings(name: '/book_detais_formal'),
                        ));
                      },
                    );
                  }, childCount: items.length))
                ],
              ),
            ),
          ],
        ),
      );
    });
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
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Dimensions.width6, vertical: Dimensions.height6),
      child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
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
          }).toList())),
    );
  }

  _buildExpandable() {
    return ExpandableNotifier(
      child: Expandable(
        collapsed: Padding(
          padding:  EdgeInsets.only(right: Dimensions.width24, top: Dimensions.height8),
          child: Align(
            alignment: Alignment.centerRight,
            child: ExpandableButton(
              child: Icon(
                Icons.keyboard_arrow_down,
              ),
            ),
          ),
        ),
        expanded: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              getExpandedCategories(bookStore.allCategories.sublist(0, 3)),
              getExpandedCategories(bookStore.allCategories.sublist(3, 6)),
              getExpandedCategories(bookStore.allCategories.sublist(6, 9)),
              Padding(
                padding:  EdgeInsets.only(right: Dimensions.width16, top: Dimensions.height8),
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
