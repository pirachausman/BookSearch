import 'package:cached_network_image/cached_network_image.dart';
import 'package:expandable/expandable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_app/data/repository.dart';
import 'package:test_app/mobx/book_store.dart';
import 'package:test_app/mobx/user_store.dart';
import 'package:test_app/model/categories.dart';
import 'package:test_app/pages/abstract/search_book_page_abstract.dart';
import 'package:test_app/pages/formal/book_details_page_formal.dart';
import 'package:test_app/utils/colors.dart';
import 'package:test_app/utils/index_offset_curve.dart';
import 'package:test_app/utils/utils.dart';
import 'package:test_app/widgets/chips_widget.dart';
import 'package:test_app/widgets/collection_preview.dart';
import 'package:test_app/widgets/stamp.dart';

import '../../model/Book.dart';
import '../../utils/dimensions.dart';

class BookScreen extends StatefulWidget {
  BookScreen(this.interfaceType, this.cardFirstOpenController, {Key? key})
      : super(key: key);

  String interfaceType;
  AnimationController? cardFirstOpenController;
  static Repository repository = Repository.get();

  @override
  _BookScreenStateNew createState() => _BookScreenStateNew();
}

class _BookScreenStateNew extends AbstractSearchBookState<BookScreen> {
  BookStore bookStore = BookStore();
  UserStore userStore = UserStore();

  @override
  Widget build(BuildContext context) {
    const textStyle = const TextStyle(
        fontSize: 22.0, fontFamily: 'Segoe UI', fontWeight: FontWeight.w800);
    return Observer(builder: (context) {
      bookStore.category;
      return Scaffold(
        backgroundColor: AppColors.backWhiteColor
        ,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: Dimensions.width10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: Dimensions.height70,
              ),
              ConstrainedBox(
                  constraints: BoxConstraints(
                      maxHeight: Dimensions.heigh80, maxWidth: Dimensions.width85, minHeight: Dimensions.height50, minWidth: Dimensions.width85),
                  child: Image.asset(
                    "assets/stamp.png",
                    height: Dimensions.height65_01,
                    width: Dimensions.width65_01,
                  )),
              SizedBox(height: Dimensions.height10,),
              Expanded(
                child: CustomScrollView(
                  slivers: <Widget>[
                    SliverList(
                        delegate: SliverChildListDelegate(
                      [
                        wrapInAnimation(
                            Padding(
                              padding:  EdgeInsets.symmetric(horizontal: Dimensions.height10, vertical: Dimensions.width10),
                              child: Observer(builder: (context) {
                                return Text(
                                  "${userStore.user?.displayName!.split(' ')[0] ?? ''}",
                                  style: textStyle.copyWith(
                                      fontWeight: FontWeight.w700,
                                      fontSize: Dimensions.height26,
                                      // fontFamily: 'Segoe UI',
                                  ));
                              }),
                            ),
                            0),
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
                            ? Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                    wrapInAnimation(
                                        Padding(
                                          padding:  EdgeInsets.only(
                                              left: Dimensions.width10, right: Dimensions.width10, top: Dimensions.height20, bottom:Dimensions.height20 ),
                                          child: Text(
                                            "Top books ",
                                            style: textStyle.copyWith(

                                               fontSize: Dimensions.height20,
                                              fontWeight: FontWeight.w400
                                            ),
                                          ),
                                        ),
                                        0),
                                    wrapInAnimation(
                                        collectionPreview(
                                            Color(0xffffffff), "Biographies", [
                                          "wO3PCgAAQBAJ",
                                          "_LFSBgAAQBAJ",
                                          "8U2oAAAAQBAJ",
                                          "yG3PAK6ZOucC",
                                          "OsUPDgAAQBAJ",
                                          "3e-dDAAAQBAJ",
                                          "-ITZDAAAQBAJ",
                                          "rmBeDAAAQBAJ",
                                          "vgzJCwAAQBAJ",
                                          "1Y9gDQAAQBAJ",
                                          "Pz4YDQAAQBAJ",
                                          "UXARDgAAQBAJ",
                                          "JMYUDAAAQBAJ",
                                          "PzhQydl-QD8C",
                                          "nkalO3OsoeMC",
                                          "VO8nDwAAQBAJ",
                                          "Nxl0BQAAQBAJ"
                                        ]),
                                        1),
                                  ])
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
        ),
      );
    });
  }

  Widget wrapInAnimation(Widget child, int index) {
    Animation<double> offsetAnimation = CurvedAnimation(
        parent: widget.cardFirstOpenController!,
        curve: IndexOffsetCurve(index));
    Animation<double> fade =
        CurvedAnimation(parent: offsetAnimation, curve: Curves.ease);
    return SlideTransition(
        position: Tween<Offset>(begin: Offset(0.5, 0.0), end: Offset(0.0, 0.0))
            .animate(fade),
        child: FadeTransition(
          opacity: fade,
          child: child,
        ));
  }

  Widget collectionPreview(Color color, String name, List<String> ids) {
    return FutureBuilder<List<Book>>(
      future: Repository.get().getBooksByIdFirstFromDatabaseAndCache(ids),
      builder: (BuildContext context, AsyncSnapshot<List<Book>> snapshot) {
        if (snapshot.data != null) bookStore.loadedBooks = snapshot.data!;
        return CollectionPreview(
          books: bookStore.books,
          color: color,
          title: name,
          loading: snapshot.data == null,
        );
      },
    );
  }

  Widget getGridForCategories() {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: Dimensions.width8, vertical: Dimensions.height8),
      child: Wrap(
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
          }).toList()),
    );
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
