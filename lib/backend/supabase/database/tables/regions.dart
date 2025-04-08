import '../database.dart';

class RegionsTable extends SupabaseTable<RegionsRow> {
  @override
  String get tableName => 'regions';

  @override
  RegionsRow createRow(Map<String, dynamic> data) => RegionsRow(data);
}

class RegionsRow extends SupabaseDataRow {
  RegionsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => RegionsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);

  bool? get active => getField<bool>('active');
  set active(bool? value) => setField<bool>('active', value);
}
