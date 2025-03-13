import 'package:auto_diary/features/home/domain/usecases.dart';
import 'package:auto_diary/features/home/presentation/events.dart';
import 'package:auto_diary/features/home/presentation/state.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase/supabase.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final AddEntryUseCase addEntry;
  final EditEntryUseCase editEntry;
  final DeleteEntryUseCase deleteEntry;
  final FetchEntryUseCase fetchEntry;
  final FetchAllEntriesUseCase fetchAllEntries;
  final Session session;

  HomeBloc(
    this.addEntry,
    this.editEntry,
    this.deleteEntry,
    this.fetchEntry,
    this.fetchAllEntries,
    this.session,
    dynamic supabase,
  ) : super(HomeInitState([])) {
    supabase.from('diary_entries').stream(primaryKey: ['id']).listen((
      List<Map<String, dynamic>> data,
    ) {
      add(FetchAllEntriesEvent());
    });
    final User user = session.user;
    //TODO: add error handling
    on<AddEntryEvent>((event, emit) async {
      HapticFeedback.heavyImpact();
      try {
        await addEntry(user);
      } catch (e) {
        if (kDebugMode) {
          print(e.toString());
        }
      }
    });
    on<EditEntryEvent>((event, emit) async {
      HapticFeedback.heavyImpact();
      try {
        await editEntry();
      } catch (e) {
        if (kDebugMode) {
          print(e.toString());
        }
      }
    });
    on<DeleteEntryEvent>((event, emit) async {
      HapticFeedback.heavyImpact();
      try {
        await deleteEntry();
      } catch (e) {
        if (kDebugMode) {
          print(e.toString());
        }
      }
    });
    on<FetchEntryEvent>((event, emit) async {
      HapticFeedback.heavyImpact();
      try {
        await fetchEntry();
      } catch (e) {
        if (kDebugMode) {
          print(e.toString());
        }
      }
    });
    on<FetchAllEntriesEvent>((event, emit) async {
      HapticFeedback.heavyImpact();
      try {
        final List<Map<String, dynamic>> allEntries = await fetchAllEntries(user);
        emit(HomeSuccessState(allEntries));
      } catch (e) {
        if (kDebugMode) {
          print(e.toString());
        }
      }
    });
  }
}
