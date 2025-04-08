import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/components/bottom_navigation_component_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'notifications_page_model.dart';
export 'notifications_page_model.dart';

class NotificationsPageWidget extends StatefulWidget {
  const NotificationsPageWidget({super.key});

  static String routeName = 'NotificationsPage';
  static String routePath = '/notificationsPage';

  @override
  State<NotificationsPageWidget> createState() =>
      _NotificationsPageWidgetState();
}

class _NotificationsPageWidgetState extends State<NotificationsPageWidget> {
  late NotificationsPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NotificationsPageModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    // On page dispose action.
    () async {
      await InteractionsTable().update(
        data: {
          'read': true,
        },
        matchingRows: (rows) => rows.eqOrNull(
          'to_user_id',
          currentUserUid,
        ),
      );
    }();

    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          automaticallyImplyLeading: false,
          title: Text(
            'Notificaciones',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Urbanist',
                  letterSpacing: 0.0,
                ),
          ),
          actions: [],
          centerTitle: false,
          elevation: 0.0,
        ),
        body: Stack(
          children: [
            FutureBuilder<List<InteractionsRow>>(
              future: InteractionsTable().queryRows(
                queryFn: (q) => q
                    .eqOrNull(
                      'to_user_id',
                      currentUserUid,
                    )
                    .eqOrNull(
                      'active',
                      true,
                    ),
              ),
              builder: (context, snapshot) {
                // Customize what your widget looks like when it's loading.
                if (!snapshot.hasData) {
                  return Center(
                    child: SizedBox(
                      width: 50.0,
                      height: 50.0,
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(
                          FlutterFlowTheme.of(context).primary,
                        ),
                      ),
                    ),
                  );
                }
                List<InteractionsRow> listViewInteractionsRowList =
                    snapshot.data!;

                return ListView.builder(
                  padding: EdgeInsets.zero,
                  scrollDirection: Axis.vertical,
                  itemCount: listViewInteractionsRowList.length,
                  itemBuilder: (context, listViewIndex) {
                    final listViewInteractionsRow =
                        listViewInteractionsRowList[listViewIndex];
                    return Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 1.0),
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: !listViewInteractionsRow.read!
                              ? FlutterFlowTheme.of(context).primaryBackground
                              : Color(0x00000000),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 0.0,
                              color: FlutterFlowTheme.of(context).alternate,
                              offset: Offset(
                                0.0,
                                1.0,
                              ),
                            )
                          ],
                          borderRadius: BorderRadius.circular(0.0),
                          shape: BoxShape.rectangle,
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              if (!listViewInteractionsRow.read!)
                                Container(
                                  width: 4.0,
                                  height: 50.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context).primary,
                                    borderRadius: BorderRadius.circular(2.0),
                                  ),
                                ),
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      12.0, 0.0, 0.0, 0.0),
                                  child: FutureBuilder<List<ProfilesRow>>(
                                    future: ProfilesTable().querySingleRow(
                                      queryFn: (q) => q.eqOrNull(
                                        'id',
                                        listViewInteractionsRow.fromUserId,
                                      ),
                                    ),
                                    builder: (context, snapshot) {
                                      // Customize what your widget looks like when it's loading.
                                      if (!snapshot.hasData) {
                                        return Center(
                                          child: SizedBox(
                                            width: 50.0,
                                            height: 50.0,
                                            child: CircularProgressIndicator(
                                              valueColor:
                                                  AlwaysStoppedAnimation<Color>(
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                              ),
                                            ),
                                          ),
                                        );
                                      }
                                      List<ProfilesRow> textProfilesRowList =
                                          snapshot.data!;

                                      final textProfilesRow =
                                          textProfilesRowList.isNotEmpty
                                              ? textProfilesRowList.first
                                              : null;

                                      return Text(
                                        '${valueOrDefault<String>(
                                          textProfilesRow?.corporationName,
                                          'La empresa',
                                        )} está interesada en ti'
                                            .maybeHandleOverflow(
                                          maxChars: 25,
                                          replacement: '…',
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyLarge
                                            .override(
                                              fontFamily: 'Plus Jakarta Sans',
                                              letterSpacing: 0.0,
                                            ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    12.0, 0.0, 0.0, 0.0),
                                child: Text(
                                  valueOrDefault<String>(
                                    dateTimeFormat(
                                      "yMMMd",
                                      listViewInteractionsRow.updatedAt,
                                      locale: FFLocalizations.of(context)
                                          .languageCode,
                                    ),
                                    'Feb 32, 2025',
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        fontFamily: 'Plus Jakarta Sans',
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ),
                              FlutterFlowIconButton(
                                borderRadius: 8.0,
                                buttonSize: 40.0,
                                icon: Icon(
                                  Icons.remove,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  size: 24.0,
                                ),
                                onPressed: () async {
                                  await InteractionsTable().update(
                                    data: {
                                      'active': false,
                                    },
                                    matchingRows: (rows) => rows.eqOrNull(
                                      'id',
                                      listViewInteractionsRow.id,
                                    ),
                                  );

                                  safeSetState(() {});
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
            Align(
              alignment: AlignmentDirectional(0.0, 1.0),
              child: wrapWithModel(
                model: _model.bottomNavigationComponentModel,
                updateCallback: () => safeSetState(() {}),
                child: BottomNavigationComponentWidget(
                  selectedPageIndex: 2,
                  hidden: false,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
