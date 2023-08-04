part of 'guest_bloc.dart';

@immutable
abstract class GuestState {
  List<Guest> guest;
  GuestState({required this.guest});
}

class GuestInitial extends GuestState {
  GuestInitial({required List<Guest> guest}) : super(guest: guest);
}

class GuestUpdate extends GuestState {
  GuestUpdate({required List<Guest> guest}) : super(guest: guest);
}
