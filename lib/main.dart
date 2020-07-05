import 'package:components/src/pages/alert_page.dart';
import 'package:components/src/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      localizationsDelegates: [
        // ... app-specific localization delegate[s] here
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en'), // English
        const Locale('es'), // Hebrew
      ],
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      // home:HomePage()
      initialRoute: '/',
      routes: getAplicationRoutes(),
      onGenerateRoute: (setting) {
        print('routes....... $setting');
        return MaterialPageRoute(builder: (context) => AlertPage());
      },
    );
  }
}
