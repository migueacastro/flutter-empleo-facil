import '../database.dart';

class JobCategoriesTable extends SupabaseTable<JobCategoriesRow> {
  @override
  String get tableName => 'job_categories';

  @override
  JobCategoriesRow createRow(Map<String, dynamic> data) =>
      JobCategoriesRow(data);
}

class JobCategoriesRow extends SupabaseDataRow {
  JobCategoriesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => JobCategoriesTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);

  bool? get active => getField<bool>('active');
  set active(bool? value) => setField<bool>('active', value);
}
