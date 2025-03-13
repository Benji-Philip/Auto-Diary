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

  Future<void> editEntry() async {
    await supabase
        .from('diary_entries')
        .update({
          'title': 'Test Title',
          'original_content': 'Test OG content',
          'content': 'Test Content',
          'updated_at': DateTime.now().toIso8601String(),
        })
        .eq('id', 'id');
  }

  Future<void> deleteEntry() async {
    await supabase.from('diary_entries').delete().eq('id', 'id');
  }

  Future<Map?> fetchEntry() async {
    return await supabase.from('diary_entries').select().eq('id', 'id').maybeSingle();
  }

  Future<List> fetchAllEntries(User user) async {
    return await supabase.from('diary_entries').select().eq('user_id', user.id);
  }
}
