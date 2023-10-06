import 'package:flutter/material.dart';
import 'package:travelapp/Application/Hotel&Place_Bloc/hotel_place_bloc.dart';
import 'package:travelapp/Application/Hotel1_Bloc/hotel1_bloc.dart';
import 'package:travelapp/Application/HotelBloc/hotel_bloc.dart';
import 'package:travelapp/Domain/DependencyInjection/Injection.dart';
import 'package:travelapp/common/colours.dart';
import 'package:travelapp/presentation/NavigationBar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configInjection();
  runApp(const MyApp());
}

//flutter packages pub run build_runner watch --use-polling-watcher --delete-conflicting-outputs

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Brightness brightness = MediaQuery.of(context).platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (ctx) => getIt<HotelBloc>()),
        BlocProvider(create: (ctx) => getIt<Hotel1Bloc>()),
        BlocProvider(create: (ctx) => getIt<HotelPlaceBloc>()),
      ],
      child: MaterialApp(
        theme: ThemeData(
            primaryColor: kSubDominantcolor,
            scaffoldBackgroundColor: isDarkMode ? kblack : kwhite,
            brightness: isDarkMode ? Brightness.dark : Brightness.light),
        home: const SplashScreen(),
      ),
    );
  }
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key}); //

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return const NavigationBarScreen();
      }));
    });
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        color: kDominantcolor,
        child: SafeArea(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Container(
                height: 250,
                width: 250,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                          'asset/logo2.png',
                        ),
                        fit: BoxFit.cover)),
              ),
            ),
          ],
        )),
      ),
    );
  }
}
