import 'package:birthday_app/domain/entity/guest/guest.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'guest_event.dart';
part 'guest_state.dart';

class GuestBloc extends Bloc<GuestEvent, GuestState> {
  GuestBloc(context) : super(GuestInitial(guest: [])) {
    on<AddGuest>(_addGuest);
    on<DeleteGuest>(_deleteGuest);
    on<UpdateGuest>(_updateGuest);
  }

  void _addGuest(AddGuest event, Emitter<GuestState> emit) {
    state.guest.add(event.guest);
    emit(GuestUpdate(guest: state.guest));
  }

  void _deleteGuest(DeleteGuest event, Emitter<GuestState> emit) {
    state.guest.remove(event.guest);
    emit(GuestUpdate(guest: state.guest));
  }

  void _updateGuest(UpdateGuest event, Emitter<GuestState> emit) {
    for (int i = 0; i < state.guest.length; i++) {
      if (event.guest.name == state.guest[i].name) {
        state.guest[i] = event.guest;
      }
    }
    emit(GuestUpdate(guest: state.guest));
  }
}
