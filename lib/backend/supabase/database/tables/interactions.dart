import '../database.dart';

class InteractionsTable extends SupabaseTable<InteractionsRow> {
  @override
  String get tableName => 'interactions';

  @override
  InteractionsRow createRow(Map<String, dynamic> data) => InteractionsRow(data);
}

class InteractionsRow extends SupabaseDataRow {
  InteractionsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => InteractionsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get fromUserId => getField<String>('from_user_id');
  set fromUserId(String? value) => setField<String>('from_user_id', value);

  String? get toUserId => getField<String>('to_user_id');
  set toUserId(String? value) => setField<String>('to_user_id', value);

  String? get type => getField<String>('type');
  set type(String? value) => setField<String>('type', value);

  DateTime? get updatedAt => getField<DateTime>('updated_at');
  set updatedAt(DateTime? value) => setField<DateTime>('updated_at', value);

  bool? get active => getField<bool>('active');
  set active(bool? value) => setField<bool>('active', value);

  bool? get read => getField<bool>('read');
  set read(bool? value) => setField<bool>('read', value);
}
