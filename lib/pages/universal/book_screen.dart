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
// import '../../utils/dimensions.dart';

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
    double pageWidth = MediaQuery.of(context).size.width;
    double pageHeight = MediaQuery.of(context).size.height;
    double height20 = pageHeight /40.3;
    double height12 = pageHeight /67.16;
    double width8 = pageWidth / 49;
    double height8 = pageHeight /100.75;
    double width10 = pageWidth / 39.2;
    double heigh80 = pageHeight /10.075;
    double width85 = pageWidth / 4.6;
    double height50 = pageHeight /16.12;
    double height65_01 = pageHeight /12.39;
    double width65_01 = pageWidth /6.029841562836487;
    double height10 = pageHeight /80.6;
    double height26 = pageHeight /31;
    double height5 = pageHeight /161.2;
    double width6 = pageWidth / 65.33333333333333 ;
    double height14 = pageHeight /57.57;
    double height16_4 = pageHeight /49.14634146341463;
    double height16 = pageHeight /50.375;
    double height150 = pageHeight /5.37;
    double width30 = pageWidth / 13;
    double width90 = pageWidth / 4.1;
    double height100 = pageHeight /8.06;
    double height70 = pageHeight /11.51;


    const textStyle = const TextStyle(
        fontSize: 22.0, fontFamily: 'Segoe UI', fontWeight: FontWeight.w800);
    return Observer(builder: (context) {
      bookStore.category;
      return  Padding(
          padding: EdgeInsets.symmetric(horizontal: width10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: height70,
              ),
              ConstrainedBox(
                  constraints: BoxConstraints(
                      maxHeight: heigh80, maxWidth: width85, minHeight: height50, minWidth: width85),
                  child: Image.asset(
                    "assets/stamp.png",
                    height: height65_01,
                    width: width65_01,
                  )),
              SizedBox(height: height10,),
              Expanded(
                child: CustomScrollView(
                  slivers: <Widget>[
                    SliverList(
                        delegate: SliverChildListDelegate(
                      [
                        wrapInAnimation(
                            Padding(
                              padding:  EdgeInsets.symmetric(horizontal: height10, vertical: width10),
                              child: Observer(builder: (context) {
                                return Text(
                                  "${userStore.user?.displayName!.split(' ')[0] ?? ''}",
                                  style: textStyle.copyWith(
                                      fontWeight: FontWeight.w700,
                                      fontSize: height26,
                                      // fontFamily: 'Segoe UI',
                                  ));
                              }),
                            ),
                            0),
                        SizedBox(height: height5),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: width6),
                          child: Card(
                            shadowColor: Colors.grey[200] ,
                              color: AppColors.searchBarColor,
                              elevation: height12,
                              child: Padding(
                                padding: EdgeInsets.all(0),
                                child: TextField(
                                  decoration: InputDecoration(
                                      hintText: "Search your favourite book",
                                      hintStyle: TextStyle(
                                          color: AppColors.mainBlackColor,

                                          fontSize: height14,
                                          fontWeight: FontWeight.w400
                                      ),
                                      prefixIcon: Padding(
                                        padding: EdgeInsets.symmetric(horizontal: width8, vertical: height8),
                                        child: Icon(Icons.search, size: height16_4, color: AppColors.mainBlackColor,),
                                      ),
                                      border: InputBorder.none),
                                  onChanged: (string) => (subject.add(string)),
                                ),
                              )),
                        ),
                        SizedBox(height: height16),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: height10),
                          child: Text(
                              "Popular Genre",
                            style: textStyle.copyWith(

                            fontSize: height20,
                            fontWeight: FontWeight.w400),
                          ),
                        ),
                        SizedBox(height: height8),
                        // getGridForCategories(),
                        _buildExpandable(),
                        SizedBox(height: height20,),

                        items.isNotEmpty
                            ? Column(
                              children: [
                                Padding(
                                  padding:  EdgeInsets.only(
                                      left: width10, right: width10, top: height20, bottom:height20 ),
                                  child: Container(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      "${bookStore.currentCategory?.title ?? 'Top books' }",
                                      style: textStyle.copyWith(

                                          fontSize: height20,
                                          fontWeight: FontWeight.w400
                                      ),
                                    ),
                                  ),
                                ),
                                GridView.extent(
                                    padding: EdgeInsets.zero,
                                    maxCrossAxisExtent: height150,
                                    mainAxisSpacing: width30,
                                    shrinkWrap: true,
                                    physics: BouncingScrollPhysics(),
                                    children: items
                                        .map((Book book) => Stamp(
                                          book.url!,
                                          width:  width90,
                                          onClick: () {
                                            Navigator.of(context).push(FadeRoute(
                                              builder: (BuildContext context) =>
                                                  Padding(
                                                padding:
                                                     EdgeInsets.symmetric(horizontal: width8,vertical: height8),
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
                                              left: width10, right: width10, top: height20, bottom:height20 ),
                                          child: Text(
                                            "Top books ",
                                            style: textStyle.copyWith(

                                               fontSize: height20,
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
                                      SizedBox(height: height100),
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
    double pageWidth = MediaQuery.of(context).size.width;
    double pageHeight = MediaQuery.of(context).size.height;
    double width8 = pageWidth / 49;
    double height8 = pageHeight /100.75;

    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: width8, vertical: height8),
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

    double pageWidth = MediaQuery.of(context).size.width;
    double width10 = pageWidth / 39.2;
    return Wrap(
      runSpacing: width10,
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
    double pageWidth = MediaQuery.of(context).size.width;
    double pageHeight = MediaQuery.of(context).size.height;
    double height8 = pageHeight /100.75;
    double width24 = pageWidth /16.3;
    double height18 = pageHeight /44.77;
    double width16 = pageWidth /24.5;
    return ExpandableNotifier(
      child: Expandable(
        collapsed: Wrap(
          // mainAxisAlignment: MainAxisAlignment.start,
          children: [
            getExpandedCategories(bookStore.allCategories.sublist(0, 5)),
            Padding(
              padding:  EdgeInsets.only(right: width24, top: height8),
              child: Align(
                alignment: Alignment.centerRight,
                child: ExpandableButton(
                  child: Text(
                    "see all >",
                    textAlign: TextAlign.end,
                    style: TextStyle(
                      fontSize: height18,
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
                padding:  EdgeInsets.only(right: width16),
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
