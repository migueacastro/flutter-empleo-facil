import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/components/bottom_navigation_component_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:math';
import 'dart:ui';
import '/index.dart';
import 'profile_view_page_widget.dart' show ProfileViewPageWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class ProfileViewPageModel extends FlutterFlowModel<ProfileViewPageWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Query Rows] action in ProfileViewPage widget.
  List<ProfilesRow>? profileQuery;
  // Stores action output result for [Backend Call - Query Rows] action in ProfileViewPage widget.
  List<InteractionsRow>? profileQueryCopy2;
  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController;
  String? get choiceChipsValue =>
      choiceChipsValueController?.value?.firstOrNull;
  set choiceChipsValue(String? val) =>
      choiceChipsValueController?.value = val != null ? [val] : [];
  // Stores action output result for [Backend Call - Query Rows] action in ChoiceChips widget.
  List<JobCategoriesRow>? jobCategory;
  // State field(s) for field widget.
  FocusNode? fieldFocusNode1;
  TextEditingController? fieldTextController1;
  String? Function(BuildContext, String?)? fieldTextController1Validator;
  // State field(s) for field widget.
  FocusNode? fieldFocusNode2;
  TextEditingController? fieldTextController2;
  String? Function(BuildContext, String?)? fieldTextController2Validator;
  // State field(s) for field widget.
  FocusNode? fieldFocusNode3;
  TextEditingController? fieldTextController3;
  String? Function(BuildContext, String?)? fieldTextController3Validator;
  // Model for BottomNavigationComponent component.
  late BottomNavigationComponentModel bottomNavigationComponentModel;

  @override
  void initState(BuildContext context) {
    bottomNavigationComponentModel =
        createModel(context, () => BottomNavigationComponentModel());
  }

  @override
  void dispose() {
    fieldFocusNode1?.dispose();
    fieldTextController1?.dispose();

    fieldFocusNode2?.dispose();
    fieldTextController2?.dispose();

    fieldFocusNode3?.dispose();
    fieldTextController3?.dispose();

    bottomNavigationComponentModel.dispose();
  }
}
