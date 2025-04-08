import '../database.dart';

class ProfilesTable extends SupabaseTable<ProfilesRow> {
  @override
  String get tableName => 'profiles';

  @override
  ProfilesRow createRow(Map<String, dynamic> data) => ProfilesRow(data);
}

class ProfilesRow extends SupabaseDataRow {
  ProfilesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ProfilesTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  DateTime? get updatedAt => getField<DateTime>('updated_at');
  set updatedAt(DateTime? value) => setField<DateTime>('updated_at', value);

  String? get username => getField<String>('username');
  set username(String? value) => setField<String>('username', value);

  String? get fullName => getField<String>('full_name');
  set fullName(String? value) => setField<String>('full_name', value);

  String? get avatarUrl => getField<String>('avatar_url');
  set avatarUrl(String? value) => setField<String>('avatar_url', value);

  String? get email => getField<String>('email');
  set email(String? value) => setField<String>('email', value);

  String? get description => getField<String>('description');
  set description(String? value) => setField<String>('description', value);

  String? get experience => getField<String>('experience');
  set experience(String? value) => setField<String>('experience', value);

  bool? get active => getField<bool>('active');
  set active(bool? value) => setField<bool>('active', value);

  int? get jobId => getField<int>('job_id');
  set jobId(int? value) => setField<int>('job_id', value);

  int? get regionId => getField<int>('region_id');
  set regionId(int? value) => setField<int>('region_id', value);

  String? get status => getField<String>('status');
  set status(String? value) => setField<String>('status', value);

  String? get corporationName => getField<String>('corporation_name');
  set corporationName(String? value) =>
      setField<String>('corporation_name', value);

  int? get roleId => getField<int>('role_id');
  set roleId(int? value) => setField<int>('role_id', value);
}
