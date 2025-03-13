
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class HomeRepo {
  Future<void> addEntry(User user);
  Future<void> editEntry();
  Future<void> deleteEntry();
  Future<Map<String, dynamic>?> fetchEntry();
  Future<List<Map<String, dynamic>>> fetchAllEntries(User user);
}