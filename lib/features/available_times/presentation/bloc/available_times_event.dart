abstract class AvailableTimesEvent {}

class GetAvailableTimesEvent extends AvailableTimesEvent {}

class DeleteTimeEvent extends AvailableTimesEvent {
  final String id;
  final int index;

  DeleteTimeEvent(this.id, this.index);
}
class AddTimeEvent extends AvailableTimesEvent {
  final int index;
  final String from;
  final String to;

  AddTimeEvent(this.index, this.from, this.to);
}