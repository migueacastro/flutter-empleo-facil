import 'package:flutter/material.dart';
import '/backend/api_requests/api_manager.dart';
import 'backend/supabase/supabase.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _categoryId = prefs.getInt('ff_categoryId') ?? _categoryId;
    });
    _safeInit(() {
      _jobId = prefs.getInt('ff_jobId') ?? _jobId;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  int _categoryId = 0;
  int get categoryId => _categoryId;
  set categoryId(int value) {
    _categoryId = value;
    prefs.setInt('ff_categoryId', value);
  }

  int _jobId = 0;
  int get jobId => _jobId;
  set jobId(int value) {
    _jobId = value;
    prefs.setInt('ff_jobId', value);
  }

  bool _isFormActive = false;
  bool get isFormActive => _isFormActive;
  set isFormActive(bool value) {
    _isFormActive = value;
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
