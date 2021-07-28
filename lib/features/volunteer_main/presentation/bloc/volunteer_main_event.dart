abstract class VolunteerMainEvent {}

class AddNewHelpRequestEvent extends VolunteerMainEvent {
  final String id;

  AddNewHelpRequestEvent(this.id);
}

class CancelHelpRequestEvent extends VolunteerMainEvent {
  final String id;

  CancelHelpRequestEvent(this.id);
}