import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class TermsandconditionsWidget extends StatefulWidget {
  const TermsandconditionsWidget({Key? key}) : super(key: key);

  @override
  _TermsandconditionsWidgetState createState() =>
      _TermsandconditionsWidgetState();
}

class _TermsandconditionsWidgetState extends State<TermsandconditionsWidget> {
  bool? switchListTileValue1;
  bool? switchListTileValue2;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Title(
        title: 'termsandconditions',
        color: FlutterFlowTheme.of(context).primaryColor,
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          appBar: AppBar(
            backgroundColor: FlutterFlowTheme.of(context).primaryColor,
            automaticallyImplyLeading: false,
            title: Text(
              'Terms and Conditions',
              style: FlutterFlowTheme.of(context).title2.override(
                    fontFamily: 'Overpass',
                    color: Colors.white,
                    fontSize: 22,
                  ),
            ),
            actions: [],
            centerTitle: false,
            elevation: 2,
          ),
          body: SafeArea(
            child: GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    width: 400,
                    height: 200,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        SwitchListTile(
                          value: switchListTileValue1 ??= false,
                          onChanged: (newValue) async {
                            setState(() => switchListTileValue1 = newValue!);
                          },
                          title: Text(
                            'Create Chat',
                            style: FlutterFlowTheme.of(context).title3,
                          ),
                          subtitle: Text(
                            'Subtitle',
                            style: FlutterFlowTheme.of(context).subtitle2,
                          ),
                          tileColor: Color(0xFFF5F5F5),
                          dense: false,
                          controlAffinity: ListTileControlAffinity.trailing,
                        ),
                        SwitchListTile(
                          value: switchListTileValue2 ??= false,
                          onChanged: (newValue) async {
                            setState(() => switchListTileValue2 = newValue!);
                          },
                          title: Text(
                            'Title',
                            style: FlutterFlowTheme.of(context).title3,
                          ),
                          subtitle: Text(
                            'Subtitle',
                            style: FlutterFlowTheme.of(context).subtitle2,
                          ),
                          tileColor: Color(0xFFF5F5F5),
                          dense: false,
                          controlAffinity: ListTileControlAffinity.trailing,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
