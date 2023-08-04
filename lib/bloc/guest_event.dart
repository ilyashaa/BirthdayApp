part of 'guest_bloc.dart';

@immutable
abstract class GuestEvent {}

class AddGuest extends GuestEvent {
  late final Guest guest;

  AddGuest({required this.guest});
}

class DeleteGuest extends GuestEvent {
  late final Guest guest;

  DeleteGuest({required this.guest});
}

class UpdateGuest extends GuestEvent {
  late final Guest guest;

  UpdateGuest({required this.guest});
}
