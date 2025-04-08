import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_radio_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:ui';
import '/index.dart';
import 'edit_profile_page_widget.dart' show EditProfilePageWidget;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EditProfilePageModel extends FlutterFlowModel<EditProfilePageWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey3 = GlobalKey<FormState>();
  final formKey1 = GlobalKey<FormState>();
  final formKey2 = GlobalKey<FormState>();
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for yourName widget.
  FocusNode? yourNameFocusNode;
  TextEditingController? yourNameTextController;
  String? Function(BuildContext, String?)? yourNameTextControllerValidator;
  String? _yourNameTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Nombre completo requerido';
    }

    return null;
  }

  // State field(s) for region widget.
  int? regionValue;
  FormFieldController<int>? regionValueController;
  // State field(s) for roleRadioButton widget.
  FormFieldController<String>? roleRadioButtonValueController;
  // State field(s) for job widget.
  int? jobValue;
  FormFieldController<int>? jobValueController;
  // State field(s) for myDescription widget.
  FocusNode? myDescriptionFocusNode;
  TextEditingController? myDescriptionTextController;
  String? Function(BuildContext, String?)? myDescriptionTextControllerValidator;
  String? _myDescriptionTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Descripción requerida';
    }

    if (val.length < 20) {
      return 'Requires at least 20 characters.';
    }

    return null;
  }

  // State field(s) for myExperience widget.
  FocusNode? myExperienceFocusNode;
  TextEditingController? myExperienceTextController;
  String? Function(BuildContext, String?)? myExperienceTextControllerValidator;
  String? _myExperienceTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Experiencia requerida';
    }

    if (val.length < 20) {
      return 'Requires at least 20 characters.';
    }

    return null;
  }

  // State field(s) for yourCorporationName widget.
  FocusNode? yourCorporationNameFocusNode;
  TextEditingController? yourCorporationNameTextController;
  String? Function(BuildContext, String?)?
      yourCorporationNameTextControllerValidator;
  String? _yourCorporationNameTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Nombre de corporación requerido';
    }

    if (val.length < 3) {
      return 'Requires at least 3 characters.';
    }

    return null;
  }

  @override
  void initState(BuildContext context) {
    yourNameTextControllerValidator = _yourNameTextControllerValidator;
    myDescriptionTextControllerValidator =
        _myDescriptionTextControllerValidator;
    myExperienceTextControllerValidator = _myExperienceTextControllerValidator;
    yourCorporationNameTextControllerValidator =
        _yourCorporationNameTextControllerValidator;
  }

  @override
  void dispose() {
    yourNameFocusNode?.dispose();
    yourNameTextController?.dispose();

    myDescriptionFocusNode?.dispose();
    myDescriptionTextController?.dispose();

    myExperienceFocusNode?.dispose();
    myExperienceTextController?.dispose();

    yourCorporationNameFocusNode?.dispose();
    yourCorporationNameTextController?.dispose();
  }

  /// Additional helper methods.
  String? get roleRadioButtonValue => roleRadioButtonValueController?.value;
}
