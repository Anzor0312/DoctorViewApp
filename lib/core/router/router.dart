import 'package:doctorapp/data/model/doctors_model.dart';
import 'package:doctorapp/view/screens/current_screen.dart';
import 'package:doctorapp/view/screens/doctors_screen.dart';
import 'package:doctorapp/view/screens/favorites_screen.dart';
import 'package:doctorapp/view/screens/specialists_screen.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  // Singleton
  static final RouteGenerator _generator = RouteGenerator._init();

  static RouteGenerator get router => _generator;

  RouteGenerator._init();

  Route<dynamic>? onGenerate(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return _navigate(const CurrentScreen());
      case 'favorite':
        return _navigate(const FavoriteDoctorsScreen());
      case 'specialist':
        return _navigate(SpecialistsScreen(
          specialists: settings.arguments as List<Specialists>,
        ));
      case 'topDoctors':
        return _navigate(DoctorsScreen(
          doctors: settings.arguments as List<Doctors>,
        ));
      default:
        return _navigate(const CurrentScreen());
    }
  }

  MaterialPageRoute _navigate(Widget page) {
    return MaterialPageRoute(
      builder: (context) => page,
    );
  }
}
