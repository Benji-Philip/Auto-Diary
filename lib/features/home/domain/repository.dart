
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class HomeRepo {
  Future<void> addEntry(User user);
}