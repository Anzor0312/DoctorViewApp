import 'package:doctorapp/core/router/router.dart';
import 'package:doctorapp/cubit/home/home_states.dart';
import 'package:doctorapp/view/screens/current_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main(List<String> args) async{
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MultiBlocProvider(providers: [
    BlocProvider(
      create: (context) => HomeCubit(),
    )
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: RouteGenerator.router.onGenerate,
      initialRoute: '/',
      debugShowCheckedModeBanner: false,
      home: const CurrentScreen(),
    );
  }
}

