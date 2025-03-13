import 'package:auto_diary/features/home/domain/repository.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AddEntryUseCase {
  AddEntryUseCase(this.homeRepo);
  final HomeRepo homeRepo;

  Future<void> call(User user) {
    return homeRepo.addEntry(user);
  }
  //TODO: add read update and delete methods
}
