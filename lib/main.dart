import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';


import '../screens/screens.dart';
import '/services/services.dart';
import 'ui/ui.dart';

void main() async{

  await dotenv.load(fileName: ".env"); // cargar archivo env
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => NewsService(),)
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        initialRoute: 'internet_screen',
        routes: {
          'internet_screen' : (_) => InternetScreen(),
          'infinite_scroll': (_) => InfiniteScrollScreen(),
        },
        scaffoldMessengerKey: SnackBarCustom.messengerKey,
        theme: ThemeData(
          textTheme: Theme.of(context).textTheme.apply(
            //fontSizeFactor: 1.2,
            fontSizeDelta: 1.5
          )
        ),
      ),
    );
  }
}