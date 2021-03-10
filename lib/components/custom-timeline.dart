import 'package:custom_timeline/util/util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTimeline extends StatelessWidget {
  final List<TimelineLine> lines;
  final TimelineLine bottonLine;
  final double blockWidth;
  final double blockHeight;

  CustomTimeline({
    this.lines,
    this.bottonLine,
    this.blockWidth,
    this.blockHeight,
  });

  @override
  Widget build(BuildContext context) {
    double safeBlockHorizontal = 5;

    List<Widget> timeline = <Widget>[];
    timeline.add(timelineTopRow(Key(getRandomString(50)), bottonLine.refColor));
    timeline.addAll(lines
        .map((l) => timelineRow(l.key, l.timeRef, l.title, l.subTile,
            l.refColor, l.titleColor, l.subTitleColor))
        .toList());
    timeline.add(timelineBottonRow(
        bottonLine.key,
        bottonLine.timeRef,
        bottonLine.title,
        bottonLine.subTile,
        bottonLine.titleColor,
        bottonLine.subTitleColor));

    return Container(
      width: blockWidth,
      height: blockHeight,
      padding: EdgeInsets.only(
        top: safeBlockHorizontal * 3,
        left: safeBlockHorizontal * 1,
        right: safeBlockHorizontal * 0.5,
        bottom: safeBlockHorizontal * 2,
      ),
      child: Scrollbar(
        child: ListView(children: timeline),
      ),
    );
  }

  Widget timelineTopRow(Key key, Color refColor) {
    return Row(
      key: key,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(
          flex: 1,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 1.5,
                height: 15,
                margin: EdgeInsets.only(top: 4, bottom: 4),
                decoration: new BoxDecoration(
                  color: refColor,
                  shape: BoxShape.rectangle,
                ),
                child: Text(""),
              ),
            ],
          ),
        ),
        Expanded(flex: 5, child: Text("")),
        Expanded(flex: 2, child: Text("")),
      ],
    );
  }

  Widget timelineRow(Key key, DateTime timeRef, String title, String subTile,
      Color refColor, Color titleColor, Color subTitleColor) {
    return Row(
      key: key,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(
          flex: 1,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 16,
                height: 16,
                decoration: new BoxDecoration(
                  color: refColor,
                  shape: BoxShape.circle,
                ),
                child: Text(""),
              ),
              Container(
                width: 1.5,
                height: 75,
                margin: EdgeInsets.only(top: 2, bottom: 2),
                decoration: new BoxDecoration(
                  color: Colors.black38, //refColor,
                  shape: BoxShape.rectangle,
                ),
                child: Text(""),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 5,
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('${title}',
                  style: TextStyle(
                      fontFamily: "regular",
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: titleColor)),
              SizedBox(
                height: 4,
              ),
              Text('${subTile}',
                  style: TextStyle(
                      fontFamily: "regular",
                      fontSize: 15,
                      color: subTitleColor)),
            ],
          ),
        ),
        Expanded(
          flex: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(right: 5),
                child: Text(formatDateToStr(timeRef, "dd MMM yy"),
                    style: TextStyle(
                        fontFamily: "regular",
                        fontSize: 14,
                        color: Colors.black45)),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget timelineBottonRow(Key key, DateTime startRef, String title,
      String subTile, Color titleColor, Color subTitleColor) {
    return Row(
      key: key,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Expanded(
          flex: 1,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 36,
                height: 36,
                decoration: new BoxDecoration(
                  image: new DecorationImage(
                    image: new ExactAssetImage('assets/flag.png'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Text(""),
              ),
              Container(
                width: 1,
                height: 10,
                decoration: new BoxDecoration(
                  color: Colors.transparent,
                  shape: BoxShape.rectangle,
                ),
                child: Text(""),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 5,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('${title}',
                  style: TextStyle(
                      fontFamily: "regular",
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: titleColor)),
              SizedBox(
                height: 4,
              ),
              Text('${subTile}',
                  style: TextStyle(
                      fontFamily: "regular",
                      fontSize: 15,
                      color: subTitleColor)),
            ],
          ),
        ),
        Expanded(
          flex: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(right: 5),
                child: Text(formatDateToStr(startRef, "dd MMM yy"),
                    style: TextStyle(
                        fontFamily: "regular",
                        fontSize: 14,
                        color: Colors.black45)),
              )
            ],
          ),
        ),
      ],
    );
  }
}

class TimelineLine {
  Key key;
  DateTime timeRef;
  String title;
  String subTile;
  Color refColor;
  Color titleColor;
  Color subTitleColor;
  Future<bool> afterDismiss;

  TimelineLine(
      {this.key,
      this.timeRef,
      this.title,
      this.subTile,
      this.refColor = Colors.black45,
      this.subTitleColor = Colors.black45,
      this.titleColor = Colors.black87,
      this.afterDismiss});
}
