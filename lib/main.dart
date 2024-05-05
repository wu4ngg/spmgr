import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:spmgr/components/spending_card.dart';
import 'package:spmgr/components/stats.dart';
import 'package:spmgr/models/purpose.dart';
import 'package:spmgr/models/spending.dart';
import 'package:spmgr/pages/unrouted/add_item_screen.dart';
import 'package:spmgr/prodivders/spending_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
        textTheme: TextTheme(titleLarge: GoogleFonts.inter(), bodyMedium: GoogleFonts.inter()),
        buttonTheme: const ButtonThemeData(buttonColor: Colors.amber),
      
      ),
      home: const MyHomePage(title: 'Trang chủ'),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(113, 98, 161, 255), brightness: Brightness.dark),
        useMaterial3: true,
        textTheme: TextTheme(titleLarge: GoogleFonts.inter(fontSize: 20), bodyMedium: GoogleFonts.inter(fontSize: 16)),

      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  String _result = "";
  List<Spending> mockData = List.generate(10, (index) => Spending(id: index, title: "Test", moneyAmount: index * Random().nextDouble() * index * 1000, purpose: Purpose(id: index * 10, name: "Test", icon: Icons.two_wheeler)));
  DateTime _dateTime = DateTime.now();
  void _incrementCounter() {
    setState(() {
      _counter+=10;
    });
  }
  void _setResult(String newResult) {
    setState(() {
      _result = newResult;
    });
  }
  void _changeDate(DateTime dateTime){
    setState(() {
      _dateTime = dateTime;
    });
  }
  Future<void> _addItem(BuildContext context, SpendingProvider provider) async{
    provider.generateList(1);
    if(!context.mounted) return;
  }
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return ChangeNotifierProvider(
      create: (context) => SpendingProvider(),
      child: Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.surface,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use xxit to set our appbar title.
        title: const Text("Trang chủ"),
        actions: [
          TextButton.icon(onPressed: () {}, icon: const Icon(Icons.calendar_month), label: Text("${_dateTime.day.toString().padLeft(2, '0')}/${_dateTime.month.toString().padLeft(2, '0')}/${(_dateTime.year % 2000).toString().padLeft(2, '0')}")),
          Consumer<SpendingProvider>(builder:(context, value, child) => IconButton(onPressed: () {_addItem(context, value);}, icon: const Icon(Icons.add))),
          IconButton(onPressed: () {}, icon: const Icon(Icons.settings))
        ],
        elevation: 0,
      ),
      body:
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            
            StatsWidget(currentSpending: _counter),
            Consumer<SpendingProvider>(builder: (context, value, child) => Expanded(
              child: 
              ListView.builder(itemCount: value.spendingList.length, itemBuilder: (context, index) {
              final item = value.spendingList[index];
              return SpendingCard(spending: item);
            },)))
            
            
          ],
        ),
    )
    );
  }
}
