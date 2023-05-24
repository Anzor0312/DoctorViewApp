import 'package:bloc/bloc.dart';
part 'appointments_cubit.dart';

abstract class AppointmentsState {
  AppointmentsState();
}

class AppointmentsInitialState extends AppointmentsState {
  AppointmentsInitialState();
}

class AppointmentsStatusState extends AppointmentsState {
  bool condition;
  AppointmentsStatusState(this.condition);
}
