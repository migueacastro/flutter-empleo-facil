import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'not_results_model.dart';
export 'not_results_model.dart';

class NotResultsWidget extends StatefulWidget {
  const NotResultsWidget({super.key});

  @override
  State<NotResultsWidget> createState() => _NotResultsWidgetState();
}

class _NotResultsWidgetState extends State<NotResultsWidget> {
  late NotResultsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NotResultsModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 12.0),
      child: Text(
        'Sin resultados',
        style: FlutterFlowTheme.of(context).bodyMedium.override(
              fontFamily: 'Plus Jakarta Sans',
              color: FlutterFlowTheme.of(context).secondaryText,
              letterSpacing: 0.0,
            ),
      ),
    );
  }
}
