import 'package:auto_diary/features/home/domain/usecases.dart';
import 'package:auto_diary/features/home/presentation/events.dart';
import 'package:auto_diary/features/home/presentation/state.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase/supabase.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final AddEntryUseCase addEntry;

  HomeBloc(this.addEntry, dynamic supabase) : super(HomeInitState()) {
    final Session session = supabase.auth.currentSession;
    final User user = session.user;
    //TODO: add error handling
    on<AddEntryEvent>((emit, event) async {
      HapticFeedback.heavyImpact();
      try {
        await addEntry(user);
      } catch (e) {
        if (kDebugMode) {
          print(e.toString());
        }
      }
    });
  }
}
