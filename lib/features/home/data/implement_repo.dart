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
}
