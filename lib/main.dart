import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shreeji_delivery_app_bloc/screens/splash/splash_screen.dart';
import 'package:shreeji_delivery_app_bloc/theme/colors.dart';
import 'package:shreeji_delivery_app_bloc/utils/route_page.dart';
import 'package:shreeji_delivery_app_bloc/utils/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: ((context, child) => MaterialApp.router(
        debugShowCheckedModeBanner: false,
          builder: (context, child) {
            return const SplashScreen();
          },
            title: 'Flutter Demo',
            // initialRoute: AppRoutes.splashScreen,
            // getPages: AppPages.getPages,
            // home: const SplashScreen(),
            routerConfig: AppPages().router,
            routeInformationParser: AppPages().router.routeInformationParser,
            routerDelegate: AppPages().router.routerDelegate,
            theme: ThemeData(
              primaryColor: primaryColor,
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              // useMaterial3: true,
            ),
            // home: const AssignedOrderScreen(),
          
    )));
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
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
      ), 
    );
  }
}
