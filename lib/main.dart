import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_regiester_profile/modules/first_page.dart';
import 'package:login_regiester_profile/modules/mapScreen.dart';
import 'package:login_regiester_profile/modules/verify.dart';
import 'cubit/bloc_observer.dart';
import 'cubit/cubit.dart';
import 'cubit/states.dart';
import 'firebase/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform,);
  Bloc.observer = MyBlocObserver();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent));
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LocationCubit(),
      child: BlocConsumer<LocationCubit, LocationStates>(
        builder: (context, state) {
          return MaterialApp(theme: ThemeData(colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.teal)),
            debugShowCheckedModeBanner: false,
            home: const FirstPage(),
          );
        },
        listener: (context, state) {},
      ),
    );
  }
}