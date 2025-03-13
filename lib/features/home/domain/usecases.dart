import 'package:auto_diary/features/home/domain/repository.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AddEntryUseCase {
  AddEntryUseCase(this.homeRepo);
  final HomeRepo homeRepo;

  //add
  Future<void> call(User user) {
    return homeRepo.addEntry(user);
  }
}

class EditEntryUseCase {
  EditEntryUseCase(this.homeRepo);
  final HomeRepo homeRepo;
  //edit
  Future<void> call() {
    return homeRepo.editEntry();
  }
}

class DeleteEntryUseCase {
  DeleteEntryUseCase(this.homeRepo);
  final HomeRepo homeRepo;
  //delete
  Future<void> call() {
    return homeRepo.deleteEntry();
  }
}

class FetchEntryUseCase {
  FetchEntryUseCase(this.homeRepo);
  final HomeRepo homeRepo;
  //fetch
  Future<Map<String, dynamic>?> call() {
    return homeRepo.fetchEntry();
  }
}

class FetchAllEntriesUseCase {
  FetchAllEntriesUseCase(this.homeRepo);
  final HomeRepo homeRepo;
  //fetch all
  Future<List<Map<String, dynamic>>>call(User user) {
    return homeRepo.fetchAllEntries(user);
  }
}
