import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'screens/splash/view.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {


  dynamic subscription;

  @override
  void initState() {
    super.initState();

    subscription = Connectivity().onConnectivityChanged.listen(
          (ConnectivityResult result) {
        if (result == ConnectivityResult.none) {
          showDialog(
            context: context,
            builder: (context) =>
                AlertDialog(
                  title: const Text('No Internet'),
                  content: const Text('Please check your internet connection.'),
                  actions: [
                    TextButton(
                      child: const Text('OK'),
                      onPressed: () => Navigator.of(context).pop(),
                    )
                  ],
                ),
          );
        } else if (result == ConnectivityResult.mobile ||
            result == ConnectivityResult.wifi) {
          Navigator.of(context).pop();
        }
      },
    );
  }

  @override
  void dispose() {
    super.dispose();

    subscription
        .cancel(); // cancel the listener when not in use to avoid memory leak and battery drain issues.
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => child!,
      child: MaterialApp(
        theme: ThemeData(),
        debugShowCheckedModeBanner: false,
        home: const SplashScreen(),
      ),
    );
  }
}

