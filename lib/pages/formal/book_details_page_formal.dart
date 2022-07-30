import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:test_app/data/repository.dart';
import 'package:test_app/model/Book.dart';
import 'package:test_app/pages/abstract/book_details_page_abstract.dart';
import 'package:test_app/utils/dimensions.dart';



class BookDetailsPageFormal extends StatefulWidget {


  BookDetailsPageFormal(this.book);

  final Book book;

  @override
  State<StatefulWidget> createState() => new _BookDetailsPageFormalState();

}


class _BookDetailsPageFormalState extends AbstractBookDetailsPageState<BookDetailsPageFormal> {

  GlobalKey<ScaffoldState> key = new GlobalKey();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      key: key,
      appBar: new AppBar(
        title: new Text("Stamp Collection"),
        backgroundColor: Colors.white,
        elevation: 1.0,
        iconTheme: new IconThemeData(color: Colors.black),
      ),
      body: new SingleChildScrollView(
        child: new Padding(
          padding: EdgeInsets.symmetric(horizontal: Dimensions.width32, vertical: Dimensions.height32 ),
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new Padding(
                padding: EdgeInsets.symmetric(horizontal: Dimensions.width8, vertical: Dimensions.height8 ),
                child: new Center(
                  child: new Hero(
                    tag: widget.book.id!,
                    child: new Image.network(widget.book.url!, fit: BoxFit.cover,),
                  ),
                ),
              ),
              new SizedBox(height: Dimensions.height16),
              new Text(widget.book.title!, style: TextStyle(fontSize: Dimensions.height24, fontFamily: "CrimsonText"),),
              new SizedBox(height: Dimensions.height8,),
              new Text("${widget.book.author} - Sience Ficition", style: TextStyle(fontSize: Dimensions.height16, fontFamily: "CrimsonText", fontWeight: FontWeight.w400),),
              new Divider(height: Dimensions.height32, color: Colors.black38,),
              new Row(
                children: <Widget>[
                  new Expanded(
                      child: new IconButtonText(
                        onClick: (){},
                        iconData: Icons.store,
                        text: "Search store",
                        selected: false,
                      ),
                  ),
                  new Expanded(
                    child: new IconButtonText(
                      onClick: (){
                        print("The id is: ${widget.book.id}");
                        Clipboard.setData(new ClipboardData(text: widget.book.id));
                        key.currentState?.showSnackBar( SnackBar(content:  Text("Copied: \"${widget.book.id}\" to clipboard")));
                      },
                      iconData: Icons.bookmark,
                      text: "Bookmark",
                      selected: false,
                    ),
                  ),
                  new Expanded(
                    child: new IconButtonText(
                      onClick: (){
                        setState(() {
                          widget.book.starred = !widget.book.starred!;
                        });
                        Repository.get().updateBook(widget.book);
                      },
                      iconData: widget.book.starred!? Icons.remove : Icons.add,
                      text: widget.book.starred!? "Remove"  :"Mark as read",
                      selected: widget.book.starred!,
                    ),
                  ),
                ],
              ),
              new Divider(height: Dimensions.height32, color: Colors.black38,),
              new Text("Description", style: TextStyle(fontSize: Dimensions.height20, fontFamily: "CrimsonText"),),
              new SizedBox(height: Dimensions.height8,),
              new Text(widget.book.description!, style: TextStyle(fontSize: Dimensions.height16),),
            ],
          ),
        ),
      ),
    );
  }

}

class IconButtonText extends StatelessWidget {



  IconButtonText({required this.onClick, required this.iconData, required this.text, required this.selected});


  final VoidCallback onClick;

  final IconData iconData;
  final String text;

  bool selected = false;

  final Color selectedColor = new Color(0xff283593);

  @override
  Widget build(BuildContext context) {
    return new InkResponse(
      onTap: onClick,
      child: new Column(
        children: <Widget>[
          new Icon(iconData, color: selected? selectedColor: Colors.black,),
          new Text(text, style: new TextStyle(color: selected? selectedColor: Colors.black),)
        ],
      ),
    );
  }

}