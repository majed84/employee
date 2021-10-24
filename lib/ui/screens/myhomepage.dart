import 'package:employee/ui/widgets/menu.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _days = 0;
  int _totdays = 0;
  DateTime _selectedDate = DateTime.now();
  DateTime _selectedDate1 = DateTime.now();
  DateTime _selectedDate2 = DateTime.now();
  void _clear() {
    setState(() {
      _days = 0;
      _totdays = 0;
      _selectedDate1 = DateTime.now();
      _selectedDate2 = DateTime.now();
      _selectedDate = DateTime.now();
    });
  }

  void _getdaysBetweenTwoDates() {
    setState(() {
      _days = _selectedDate2.difference(_selectedDate1).inDays + 1;
      _totdays += _days;
      //_days = daysBetween(selectedDate1, selectedDate2);
    });
  }

  // int daysBetween(DateTime from, DateTime to) {
  //   from = DateTime(from.year, from.month, from.day);
  //   to = DateTime(to.year, to.month, to.day);
  //   return (to.difference(from).inHours / 24).round();
  // }

  Future<void> _selectDate(BuildContext context, String ltype) async {
    if (ltype == "FROM")
      _selectedDate = _selectedDate1;
    else
      _selectedDate = _selectedDate2;

    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: _selectedDate,
        firstDate: DateTime(1980, 8),
        lastDate: DateTime(2201));
    if (picked != null && picked != _selectedDate)
      setState(() {
        if (ltype == "FROM")
          _selectedDate1 = picked;
        else
          _selectedDate2 = picked;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: MyDrawer(),
        appBar: AppBar(
          title: Text(widget.title),
          centerTitle: true,
        ),
        body: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Row(
              textDirection: TextDirection.rtl,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text(
                  "مـــن",
                  style: Theme.of(context).textTheme.headline6,
                ),
                TextButton(
                  onPressed: () => {
                    _selectDate(context, "FROM"),
                  },
                  child: Text(
                    "${_selectedDate1.toLocal()}".split(' ')[0],
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ),
              ],
            ),
            Row(
              textDirection: TextDirection.rtl,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text(
                  "إلـــى",
                  style: Theme.of(context).textTheme.headline6,
                ),
                TextButton(
                  onPressed: () => _selectDate(context, "TO"),
                  child: Text(
                    "${_selectedDate2.toLocal()}".split(' ')[0],
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ),
              ],
            ),
            Row(
                textDirection: TextDirection.rtl,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(
                    'الأيام',
                    style: Theme.of(context).textTheme.headline5,
                  ),
                  Text(
                    '$_days',
                    style: TextStyle(
                      color: Color.fromARGB(255, 100, 200, 20),
                      fontSize: 40,
                    ),
                  ),
                ]),
            Text(
              'اجمالي الأيام',
            ),
            Text(
              '$_totdays',
              style: Theme.of(context).textTheme.headline2,
            ),
          ],
        ),
        // floatingActionButton: FloatingActionButton(
        //   onPressed: _incrementCounter,
        //   tooltip: 'Increment',
        //   child: Icon(Icons.calculate),
        // ),

        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FloatingActionButton(
                backgroundColor: Colors.green,
                heroTag: "btn",
                onPressed: () => _getdaysBetweenTwoDates(),
                child: Icon(Icons.calendar_today),
              ),
              SizedBox(
                width: 40,
              ),
              FloatingActionButton(
                backgroundColor: Colors.red,
                heroTag: "btn2",
                onPressed: () => _clear(),
                child: Icon(Icons.delete_forever),
              )
            ],
          ),
        ));
  }
}
