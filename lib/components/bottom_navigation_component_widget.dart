import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import 'dart:math';
import 'dart:ui';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'bottom_navigation_component_model.dart';
export 'bottom_navigation_component_model.dart';

class BottomNavigationComponentWidget extends StatefulWidget {
  const BottomNavigationComponentWidget({
    super.key,
    int? selectedPageIndex,
    bool? hidden,
  })  : this.selectedPageIndex = selectedPageIndex ?? 1,
        this.hidden = hidden ?? false;

  final int selectedPageIndex;
  final bool hidden;

  @override
  State<BottomNavigationComponentWidget> createState() =>
      _BottomNavigationComponentWidgetState();
}

class _BottomNavigationComponentWidgetState
    extends State<BottomNavigationComponentWidget>
    with TickerProviderStateMixin {
  late BottomNavigationComponentModel _model;

  late StreamSubscription<bool> _keyboardVisibilitySubscription;
  bool _isKeyboardVisible = false;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BottomNavigationComponentModel());

    if (!isWeb) {
      _keyboardVisibilitySubscription =
          KeyboardVisibilityController().onChange.listen((bool visible) {
        safeSetState(() {
          _isKeyboardVisible = visible;
        });
      });
    }

    animationsMap.addAll({
      'dividerOnPageLoadAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 150.0.ms,
            begin: Offset(0.6, 1.0),
            end: Offset(1.0, 1.0),
          ),
        ],
      ),
      'dividerOnPageLoadAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 150.0.ms,
            begin: Offset(0.6, 1.0),
            end: Offset(1.0, 1.0),
          ),
        ],
      ),
      'dividerOnPageLoadAnimation3': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 150.0.ms,
            begin: Offset(0.6, 1.0),
            end: Offset(1.0, 1.0),
          ),
        ],
      ),
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    if (!isWeb) {
      _keyboardVisibilitySubscription.cancel();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: !(isWeb
          ? MediaQuery.viewInsetsOf(context).bottom > 0
          : _isKeyboardVisible),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(12.0, 12.0, 12.0, 12.0),
        child: Container(
          width: 360.0,
          height: 90.0,
          decoration: BoxDecoration(),
          child: FutureBuilder<List<ProfilesRow>>(
            future: ProfilesTable().querySingleRow(
              queryFn: (q) => q.eqOrNull(
                'id',
                currentUserUid,
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
              List<ProfilesRow> floatingNavigationContainerProfilesRowList =
                  snapshot.data!;

              final floatingNavigationContainerProfilesRow =
                  floatingNavigationContainerProfilesRowList.isNotEmpty
                      ? floatingNavigationContainerProfilesRowList.first
                      : null;

              return Container(
                width: 360.0,
                height: 90.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).primary,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(15.0),
                    bottomRight: Radius.circular(15.0),
                    topLeft: Radius.circular(15.0),
                    topRight: Radius.circular(15.0),
                  ),
                ),
                child: Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(12.0, 12.0, 12.0, 12.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          FlutterFlowIconButton(
                            borderRadius: 8.0,
                            buttonSize: 40.0,
                            icon: Icon(
                              Icons.home_outlined,
                              color: FlutterFlowTheme.of(context).info,
                              size: 26.0,
                            ),
                            onPressed: () async {
                              context.pushNamed(HomePageWidget.routeName);
                            },
                          ),
                          Text(
                            'Inicio',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Plus Jakarta Sans',
                                  color: Colors.white,
                                  fontSize: 10.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                          Opacity(
                            opacity: widget!.selectedPageIndex == 1 ? 1.0 : 0.0,
                            child: SizedBox(
                              width: 30.0,
                              child: Divider(
                                height: 10.0,
                                thickness: 2.0,
                                color: Colors.white,
                              ),
                            ).animateOnPageLoad(
                                animationsMap['dividerOnPageLoadAnimation1']!),
                          ),
                        ],
                      ),
                      if (floatingNavigationContainerProfilesRow?.roleId == 2)
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            FlutterFlowIconButton(
                              borderRadius: 8.0,
                              buttonSize: 40.0,
                              icon: Icon(
                                Icons.notifications_none_outlined,
                                color: FlutterFlowTheme.of(context).info,
                                size: 26.0,
                              ),
                              onPressed: () async {
                                context.goNamed(
                                  NotificationsPageWidget.routeName,
                                  extra: <String, dynamic>{
                                    kTransitionInfoKey: TransitionInfo(
                                      hasTransition: true,
                                      transitionType: PageTransitionType.fade,
                                      duration: Duration(milliseconds: 0),
                                    ),
                                  },
                                );
                              },
                            ),
                            Text(
                              'Alertas',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Plus Jakarta Sans',
                                    color: Colors.white,
                                    fontSize: 10.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                            Opacity(
                              opacity:
                                  widget!.selectedPageIndex == 2 ? 1.0 : 0.0,
                              child: SizedBox(
                                width: 30.0,
                                child: Divider(
                                  height: 10.0,
                                  thickness: 2.0,
                                  color: Colors.white,
                                ),
                              ).animateOnPageLoad(animationsMap[
                                  'dividerOnPageLoadAnimation2']!),
                            ),
                          ],
                        ),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          FlutterFlowIconButton(
                            borderRadius: 8.0,
                            buttonSize: 40.0,
                            icon: Icon(
                              Icons.person_outlined,
                              color: FlutterFlowTheme.of(context).info,
                              size: 26.0,
                            ),
                            onPressed: () async {
                              context.goNamed(
                                ProfilePageWidget.routeName,
                                extra: <String, dynamic>{
                                  kTransitionInfoKey: TransitionInfo(
                                    hasTransition: true,
                                    transitionType: PageTransitionType.fade,
                                    duration: Duration(milliseconds: 0),
                                  ),
                                },
                              );
                            },
                          ),
                          Text(
                            'Perfil',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Plus Jakarta Sans',
                                  color: Colors.white,
                                  fontSize: 10.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                          Opacity(
                            opacity: widget!.selectedPageIndex == 3 ? 1.0 : 0.0,
                            child: SizedBox(
                              width: 30.0,
                              child: Divider(
                                height: 10.0,
                                thickness: 2.0,
                                color: Colors.white,
                              ),
                            ).animateOnPageLoad(
                                animationsMap['dividerOnPageLoadAnimation3']!),
                          ),
                        ],
                      ),
                    ]
                        .divide(SizedBox(width: 16.0))
                        .addToStart(SizedBox(width: 16.0))
                        .addToEnd(SizedBox(width: 16.0)),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
