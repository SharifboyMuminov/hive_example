import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_example/blocs/notes/notes_bloc.dart';
import 'package:hive_example/screens/splesh/splash_screen.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => NotesBloc(),
        ),
      ],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) {
        ScreenUtil.init(context);
        return MaterialApp(
          theme: ThemeData(
            useMaterial3: false,
            appBarTheme: const AppBarTheme(
              backgroundColor: Colors.white,
              systemOverlayStyle: SystemUiOverlayStyle(
                statusBarBrightness: Brightness.light,
                statusBarColor: Colors.transparent,
                statusBarIconBrightness: Brightness.light,
              ),
            ),
          ),
          debugShowCheckedModeBanner: false,
          home: child,
        );
      },
      child: const SplashScreen(),
    );
  }
}
