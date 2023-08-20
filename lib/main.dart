import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:news_app_flutter/res/color.dart';

import 'package:news_app_flutter/utils/hive/news_adapter.dart';
import 'package:news_app_flutter/utils/routes/routes.dart';
import 'package:news_app_flutter/view_model/auth_view_model.dart';
import 'package:news_app_flutter/view_model/theme_model.dart';
import 'package:news_app_flutter/view_model/user_view_model.dart';
import 'package:provider/provider.dart';
import 'model/news_article_model.dart';
import 'utils/routes/routes_name.dart'; // Import your RoutesName

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();

  // Register Hive adapters
  Hive.registerAdapter<News>(NewsAdapter());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => AuthViewModel()),
        ChangeNotifierProvider(create: (_) => UserViewModel()),
      ],
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) {
          return MaterialApp(
            title: 'Flutter Demo',
            theme: themeProvider.isDarkMode ? darkTheme : lightTheme,
            initialRoute: RoutesName.splash,
            debugShowCheckedModeBanner: false,
            onGenerateRoute: Routes.generateRoute,
          );
        },
      ),
    );
  }
}
