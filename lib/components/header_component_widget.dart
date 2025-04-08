import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'header_component_model.dart';
export 'header_component_model.dart';

class HeaderComponentWidget extends StatefulWidget {
  const HeaderComponentWidget({super.key});

  @override
  State<HeaderComponentWidget> createState() => _HeaderComponentWidgetState();
}

class _HeaderComponentWidgetState extends State<HeaderComponentWidget> {
  late HeaderComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HeaderComponentModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: FlutterFlowTheme.of(context).primary,
      automaticallyImplyLeading: false,
      title: Text(
        'EmpleoFacil',
        style: FlutterFlowTheme.of(context).headlineMedium.override(
              fontFamily: 'Urbanist',
              color: Colors.white,
              fontSize: 22.0,
              letterSpacing: 0.0,
              fontWeight: FontWeight.w800,
            ),
      ),
      actions: [
        FlutterFlowIconButton(
          borderRadius: 8.0,
          buttonSize: 50.0,
          fillColor: FlutterFlowTheme.of(context).primary,
          icon: Icon(
            Icons.person,
            color: FlutterFlowTheme.of(context).info,
            size: 31.0,
          ),
          onPressed: () async {
            context.pushNamed(ProfilePageWidget.routeName);
          },
        ),
      ],
      centerTitle: true,
      elevation: 2.0,
    );
  }
}
