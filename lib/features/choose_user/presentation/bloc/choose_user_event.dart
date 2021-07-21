
abstract class UserEvent {}

///
/// [ScreenAppeared] class, dispatched when the screen is appeared for the first time
///
class ChooseUserEvent extends UserEvent {
  final String language;

  ChooseUserEvent(this.language);
}
