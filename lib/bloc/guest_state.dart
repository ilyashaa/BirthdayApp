part of 'guest_bloc.dart';

@immutable

// ignore: must_be_immutable
abstract class GuestState {
  List<Guest> guest;
  GuestState({required this.guest});
}

// ignore: must_be_immutable
class GuestInitial extends GuestState {
  GuestInitial({required List<Guest> guest}) : super(guest: guest);
}

// ignore: must_be_immutable
class GuestUpdate extends GuestState {
  GuestUpdate({required List<Guest> guest}) : super(guest: guest);
}
