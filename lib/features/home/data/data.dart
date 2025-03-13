import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:uuid/uuid.dart';

class SupabaseHomeDataSource {
  SupabaseHomeDataSource({required this.supabase});

  final SupabaseClient supabase;

  // add entry
  Future<void> addEntry(User user) async {
    await supabase.from('diary_entries').insert([
      {
        'title': 'Test Title',
        'original_content': 'Test OG content',
        'content': 'Test Content',
        'created_at': DateTime.now().toIso8601String(),
        'updated_at': DateTime.now().toIso8601String(),
        'id': const Uuid().v4(),
        'user_id': user.id,
      },
    ]);
  }
}
