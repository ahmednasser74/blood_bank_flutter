import 'package:flutter/material.dart';

class ArticleItem extends StatelessWidget {
  final NetworkImage networkImage;
  final String title;
  final IconData icon;
  final Function onPressedFavorite;
  final Function onTapItem;

  ArticleItem(
      {this.networkImage,
      this.title,
      this.icon,
      this.onPressedFavorite,
      this.onTapItem});

  @override
  Widget build(BuildContext context) {

    double screenHeight = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: onTapItem,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          children: <Widget>[
            Container(
              height: screenHeight * .23,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black12,
                ),
//              boxShadow: BoxShadow(color: color, offset: offset, blurRadius: blurRadius),
                borderRadius: BorderRadius.circular(20),
                color: Colors.black,
                image: DecorationImage(
                  image: networkImage,
                  fit: BoxFit.fill,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
//          ToggleButtons(children: null, isSelected: null),
                  Expanded(
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          child: IconButton(
                            icon: Icon(
                              icon,
                              color: Colors.red,
                            ),
                            onPressed: onPressedFavorite,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Color(0xFF9a0b0b)
                              .withOpacity(0.7)),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Text(
                            title,
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
