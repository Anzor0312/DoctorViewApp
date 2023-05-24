part of 'appointments_states.dart';

class AppointmentsCubit extends Cubit<AppointmentsState> {
  AppointmentsCubit() : super(AppointmentsInitialState());

  bool condition = false;
  void upcomingCondition() {
    if (condition) {
      condition = true;
      emit(AppointmentsStatusState(condition = !condition));
    }
  }

  void pastCondition() {
    if (condition = true) {
      condition = false;
      emit(AppointmentsStatusState(condition = !condition));
    }
  }
}
