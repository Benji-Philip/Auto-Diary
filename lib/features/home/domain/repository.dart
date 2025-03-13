
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class HomeRepo {
  Future<void> addEntry(User user);
  Future<void> editEntry();
  Future<void> deleteEntry();
  Future<Map?> fetchEntry();
  Future<List<Map>> fetchAllEntries(User user);
}