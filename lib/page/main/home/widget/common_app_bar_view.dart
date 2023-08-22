import 'package:flutter/material.dart';
import 'package:rapicredito/style/index.dart';

class MainAppBarView extends StatefulWidget {
  final String? title;
  const MainAppBarView({
    Key? key,
    this.title
  }) : super(key: key);

  @override
  MainAppBarViewState createState() => MainAppBarViewState();
}

class MainAppBarViewState extends State<MainAppBarView> {
  Widget get leftView =>  Row(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(widget.title??'',
              textAlign: TextAlign.left,
              style: const TextStyle(
                color: Colour.text33,
                fontSize: 15,
              )),
        ],
      );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 14.0),
      child: AppBar(
        titleSpacing: 0,
        title: leftView,
      ),
    );
  }
}
