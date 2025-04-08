import '../database.dart';

class JobsTable extends SupabaseTable<JobsRow> {
  @override
  String get tableName => 'jobs';

  @override
  JobsRow createRow(Map<String, dynamic> data) => JobsRow(data);
}

class JobsRow extends SupabaseDataRow {
  JobsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => JobsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);

  int? get categoryId => getField<int>('category_id');
  set categoryId(int? value) => setField<int>('category_id', value);

  bool? get active => getField<bool>('active');
  set active(bool? value) => setField<bool>('active', value);
}
