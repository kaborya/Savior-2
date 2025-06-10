import 'package:flutter/material.dart';
import 'package:grad_project/pages/abdominallist.dart';
import 'package:grad_project/pages/ambroxol.dart';
import 'package:grad_project/pages/aspirin.dart';
import 'package:grad_project/pages/brufen.dart';
import 'package:grad_project/pages/centrum.dart';
import 'package:grad_project/pages/coldandflu.dart';
import 'package:grad_project/pages/congestal.dart';
import 'package:grad_project/pages/danset.dart';
import 'package:grad_project/pages/dentistatef.dart';
import 'package:grad_project/pages/Ophthalmologistlist.dart';
import 'package:grad_project/pages/SaviorScreen.dart';
import 'package:grad_project/pages/bites.dart';
import 'package:grad_project/pages/cardiologistahmed.dart';
import 'package:grad_project/pages/cardiologistgeorge.dart';
import 'package:grad_project/pages/cardiologistkhaled.dart';
import 'package:grad_project/pages/cardiologistmichael.dart';
import 'package:grad_project/pages/cardiologistslist.dart';
import 'package:grad_project/pages/categories.dart';
import 'package:grad_project/pages/choking.dart';
import 'package:grad_project/pages/cpr.dart';
import 'package:grad_project/pages/dentistatef.dart';
import 'package:grad_project/pages/dentistmina.dart';
import 'package:grad_project/pages/dentistmohamed.dart';
import 'package:grad_project/pages/dentistslist.dart';
import 'package:grad_project/pages/dentistusama.dart';
import 'package:grad_project/pages/diseaseprediction.dart';
import 'package:grad_project/pages/disflatyl.dart';
import 'package:grad_project/pages/dompy.dart';
import 'package:grad_project/pages/dryeyelist.dart';
import 'package:grad_project/pages/feroglobin.dart';
import 'package:grad_project/pages/feverlist.dart';
import 'package:grad_project/pages/florestn.dart';
import 'package:grad_project/pages/flulist.dart';
import 'package:grad_project/pages/gaviscon.dart';
import 'package:grad_project/pages/headachelist.dart';
import 'package:grad_project/pages/hyfresh.dart';
import 'package:grad_project/pages/maalox.dart';
import 'package:grad_project/pages/megafen.dart';
import 'package:grad_project/pages/motilium.dart';
import 'package:grad_project/pages/nutrilist.dart';
import 'package:grad_project/pages/optive.dart';
import 'package:grad_project/pages/oserocare.dart';
import 'package:grad_project/pages/otcmedications.dart';
import 'package:grad_project/pages/doctorscategories.dart';
import 'package:grad_project/pages/edit_profile.dart';
import 'package:grad_project/pages/fainting.dart';
import 'package:grad_project/pages/fever.dart';
import 'package:grad_project/pages/firstaid.dart';
import 'package:grad_project/pages/firstaidkit.dart';
import 'package:grad_project/pages/fractures.dart';
import 'package:grad_project/pages/generalsurgeryahmedabdel.dart';
import 'package:grad_project/pages/generalsurgeryahmedmohamed.dart';
import 'package:grad_project/pages/generalsurgerylist.dart';
import 'package:grad_project/pages/generalsurgeryromany.dart';
import 'package:grad_project/pages/generalsurgerysamir.dart';
import 'package:grad_project/pages/heartattack.dart';
import 'package:grad_project/pages/home.dart';
import 'package:grad_project/pages/internalahmed.dart';
import 'package:grad_project/pages/internalbaha.dart';
import 'package:grad_project/pages/internalnour.dart';
import 'package:grad_project/pages/internalwael.dart';
import 'package:grad_project/pages/landing.dart';
import 'package:grad_project/pages/loginscreen.dart';
import 'package:grad_project/pages/ophthhani.dart';
import 'package:grad_project/pages/ophthmagdy.dart';
import 'package:grad_project/pages/ophthpeter.dart';
import 'package:grad_project/pages/ophthwael.dart';
import 'package:grad_project/pages/orthoessam.dart';
import 'package:grad_project/pages/orthofawzy.dart';
import 'package:grad_project/pages/orthohatem.dart';
import 'package:grad_project/pages/orthomohamed.dart';
import 'package:grad_project/pages/painkillerslist.dart';
import 'package:grad_project/pages/panadol.dart';
import 'package:grad_project/pages/paracetamol.dart';
import 'package:grad_project/pages/pediatricianidris.dart';
import 'package:grad_project/pages/pediatricianihab.dart';
import 'package:grad_project/pages/pediatricianismael.dart';
import 'package:grad_project/pages/pediatricianmohamed.dart';
import 'package:grad_project/pages/poisoning.dart';
import 'package:grad_project/pages/profile.dart';
import 'package:grad_project/pages/redoxon.dart';
import 'package:grad_project/pages/refresh.dart';
import 'package:grad_project/pages/result.dart';
import 'package:grad_project/pages/sign_up.dart';
import 'package:grad_project/pages/sunburnpage.dart';
import 'package:grad_project/pages/systane.dart';
import 'package:grad_project/pages/vomittinglist.dart';
import 'package:grad_project/pages/zofran.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Saviorscreen(),
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

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          //
          // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
          // action in the IDE, or press "p" in the console), to see the
          // wireframe for each widget.
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
