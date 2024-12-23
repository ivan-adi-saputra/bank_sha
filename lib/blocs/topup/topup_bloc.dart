import 'package:bank_sha/models/topup_form_model.dart';
import 'package:bank_sha/services/transaction_service.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'topup_event.dart';
part 'topup_state.dart';

class TopupBloc extends Bloc<TopupEvent, TopupState> {
  TopupBloc() : super(TopupInitial()) {
    on<TopupEvent>((event, emit) async {
      if (event is TopupPost) {
        try {
          emit(TopupLoading());

          final res = await TransactionService().topUp(event.data);

          emit(TopupSuccess(res));
        } catch (e) {
          print(e);
          emit(TopupFailed(e.toString()));
        }
      }
    });
  }
}
