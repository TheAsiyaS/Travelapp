import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:travelapp/Application/Hotel&Place_Bloc/hotel_place_bloc.dart';
import 'package:travelapp/Application/Hotel1_Bloc/hotel1_bloc.dart';
import 'package:travelapp/Application/HotelBloc/hotel_bloc.dart';
import 'package:travelapp/Domain/DB/Infrastructure/Auhentication/UserAuthentication.dart';
import 'package:travelapp/Domain/DB/Model/UserModel.dart';
import 'package:travelapp/Domain/DependencyInjection/Injection.dart';
import 'package:travelapp/common/colours.dart';
import 'package:travelapp/presentation/NavigationBar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelapp/presentation/UserAuthentication/SignIn/SignIn.dart';
import 'package:flutter/scheduler.dart';

import 'package:firebase_core/firebase_core.dart';

ValueNotifier<UserData> currentuserdata = ValueNotifier(UserData(
    phoneNumber: '',
    bookedhotels: [],
    favhotels: [],
    dateJoin: '',
    photoUrl: '',
    username: '',
    email: '',
    password: '',
    bio: '',
    changeUsername: 0,
    favplaces: [],
    bookedplaces: [],
    name: '',
    scondaryImage: '',
    additionalImfo: ''));
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
      options: const FirebaseOptions(
    apiKey: 'AIzaSyAlLArPu-3rEUhDNKtblvWOiBflDet0aLg',
    appId: '1:1001590474082:web:389a0ab48b539fcb9e183b',
    messagingSenderId: '1001590474082',
    projectId: 'travel-app-b239a',
    storageBucket: 'gs://travel-app-b239a.appspot.com',
  ));

  await Firebase.initializeApp(); //

  await configInjection();

  runApp(const MyApp()); //flower@#
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
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primaryColor: kSubDominantcolor,
            scaffoldBackgroundColor: isDarkMode ? kblack : kwhite,
            brightness: isDarkMode ? Brightness.dark : Brightness.light),
        home: StreamBuilder<User?>(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.active) {
                if (snapshot.hasData) {
                  return const SplashScreen();
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text('${snapshot.error}'),
                  );
                }
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator(
                  strokeWidth: 2,
                  color: kwhite,
                );
              }
              return const SplashScreentoSignIn();
            }),
      ),
    );
  }
}

class SplashScreentoSignIn extends StatelessWidget {
  const SplashScreentoSignIn({super.key}); //

  @override
  Widget build(BuildContext context) {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      Future.delayed(const Duration(seconds: 3), () {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (ctx) {
          return const SignIn();
        }));
      });
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

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key}); //

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () async {
      currentuserdata.value = await AuthMethod().getUserDetail();

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
