import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:list_verbs/src/provider/show_spanish_verb.dart';
import 'package:list_verbs/src/provider/theme_provider.dart';
import 'package:list_verbs/src/provider/filter_verb.dart';
import 'package:list_verbs/src/provider/app_bar_provider.dart';
import 'package:list_verbs/src/provider/search_provider.dart';
import 'package:list_verbs/src/provider/order_provider.dart';
import 'package:list_verbs/src/provider/repeat_verb.dart';

import 'package:list_verbs/src/pages/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return MultiProvider(
      providers: [
        ChangeNotifierProvider( create: (_) => ShowSpanishVerb() ),
        ChangeNotifierProvider( create: (_) => ThemeChanger()    ),
        ChangeNotifierProvider( create: (_) => FilterTypeVerb()  ),
        ChangeNotifierProvider( create: (_) => SelectedAppBar()  ),
        ChangeNotifierProvider( create: (_) => SearchProvider()  ),
        ChangeNotifierProvider( create: (_) => OrderProvider()  ),
        ChangeNotifierProvider( create: (_) => RepeatVerb()  ),
      ],
      child: MaterialAppWithTheme(),
    );
  }
}

class MaterialAppWithTheme extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final theme = Provider.of<ThemeChanger>(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme.getTheme(),
      title: 'Mi Lista de Verbos',
      initialRoute: 'home',
      routes: {
        'home' : (context) => HomePage()
      },
    );
  }
}
