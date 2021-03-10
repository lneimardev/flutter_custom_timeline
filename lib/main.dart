import 'package:custom_timeline/components/custom-timeline.dart';
import 'package:custom_timeline/util/util.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Custom Timeline'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();

    initializeDateFormatting();
  }

  @override
  Widget build(BuildContext context) {
    // Change here for your own list
    List<Event> events = List();
    events.add(Event("ABC1", DateTime.now(), "Evento de testes 1", 10, false));
    events.add(Event("ABC2", DateTime.now(), "Evento de testes 2", 10, false));
    events.add(Event("ABC3", DateTime.now(), "Evento de testes 3", 10, false));
    events.add(Event("ABC4", DateTime.now(), "Evento de testes 4", -10, false));
    events.add(Event("ABC5", DateTime.now(), "Evento de testes 5", 10, false));
    events.add(Event("ABC6", DateTime.now(), "Evento de testes 6", 10, false));
    events.add(Event("ABC7", DateTime.now(), "Evento de testes 7", -10, false));

    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CustomTimeline(
                blockHeight: 600,
                blockWidth: 400,
                bottonLine: TimelineLine(
                    key: Key(getRandomString(50)),
                    timeRef: DateTime.now(),
                    title: "Yooo! primeira linha",
                    subTile: ""),
                lines: events
                    .map((e) => TimelineLine(
                        key: Key(e.id),
                        timeRef: e.dtEvento,
                        //refColor: Colors.redAccent, // You can instance with your own color here
                        title: e.descricaoEvento,
                        refColor: e.valorEvento > 0
                            ? colorFromHex("#009540")
                            : colorFromHex("#CE6161"),
                        titleColor: e.valorEvento > 0
                            ? colorFromHex("#009540")
                            : colorFromHex("#CE6161"),
                        subTile: formatNumberToStr(e.valorEvento),
                        subTitleColor: e.valorEvento > 0
                            ? colorFromHex("#009540")
                            : colorFromHex("#CE6161")))
                    .toList(),
              )
            ],
          ),
        ));
  }
}

class Event {
  String id;
  DateTime dtEvento;
  String descricaoEvento;
  double valorEvento;
  bool isFirst;

  Event(this.id, this.dtEvento, this.descricaoEvento, this.valorEvento,
      this.isFirst);
}
