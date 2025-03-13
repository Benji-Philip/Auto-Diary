import 'package:auto_diary/features/home/data/data.dart';
import 'package:auto_diary/features/home/domain/repository.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class HomeRepoImplement extends HomeRepo {
  HomeRepoImplement(this.supabaseHomeDataSource);
  final SupabaseHomeDataSource supabaseHomeDataSource;

  @override
  Future<void> addEntry(User user) {
    return supabaseHomeDataSource.addEntry(user);
  }

  @override
  Future<void> editEntry() {
    // TODO: implement editEntry
    throw UnimplementedError();
  }

  @override
  Future<void> deleteEntry() {
    // TODO: implement deleteEntry
    throw UnimplementedError();
  }

  @override
  Future<Map<String, dynamic>?> fetchEntry() {
    // TODO: implement fetchEntry
    throw UnimplementedError();
  }

  @override
  Future<List<Map<String, dynamic>>> fetchAllEntries(User user) {
    // TODO: implement fetchAllEntries
    throw UnimplementedError();
  }
}
