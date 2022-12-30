import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class SelectSportsWidget extends StatefulWidget {
  const SelectSportsWidget({
    Key? key,
    this.listsporty,
  }) : super(key: key);

  final List<String>? listsporty;

  @override
  _SelectSportsWidgetState createState() => _SelectSportsWidgetState();
}

class _SelectSportsWidgetState extends State<SelectSportsWidget> {
  Map<SportNamesRecord, bool> checkboxListTileValueMap = {};
  List<SportNamesRecord> get checkboxListTileCheckedItems =>
      checkboxListTileValueMap.entries
          .where((e) => e.value)
          .map((e) => e.key)
          .toList();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(0),
          bottomRight: Radius.circular(0),
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      child: Container(
        width: double.infinity,
        height: 800,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(0),
            bottomRight: Radius.circular(0),
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
        ),
        child: Stack(
          children: [
            Stack(
              children: [
                StreamBuilder<List<SportNamesRecord>>(
                  stream: querySportNamesRecord(
                    queryBuilder: (sportNamesRecord) =>
                        sportNamesRecord.orderBy('sportName'),
                  ),
                  builder: (context, snapshot) {
                    // Customize what your widget looks like when it's loading.
                    if (!snapshot.hasData) {
                      return Center(
                        child: SizedBox(
                          width: 50,
                          height: 50,
                          child: SpinKitRotatingCircle(
                            color: Color(0xFFF25454),
                            size: 50,
                          ),
                        ),
                      );
                    }
                    List<SportNamesRecord> columnSportNamesRecordList =
                        snapshot.data!;
                    return SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: List.generate(
                            columnSportNamesRecordList.length, (columnIndex) {
                          final columnSportNamesRecord =
                              columnSportNamesRecordList[columnIndex];
                          return Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 10, 0, 10),
                            child: Theme(
                              data: ThemeData(
                                checkboxTheme: CheckboxThemeData(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                ),
                                unselectedWidgetColor: Color(0xFF95A1AC),
                              ),
                              child: CheckboxListTile(
                                value: checkboxListTileValueMap[
                                    columnSportNamesRecord] ??= false,
                                onChanged: (newValue) async {
                                  setState(() => checkboxListTileValueMap[
                                      columnSportNamesRecord] = newValue!);
                                },
                                title: Text(
                                  columnSportNamesRecord.sportName!,
                                  style: FlutterFlowTheme.of(context).title3,
                                ),
                                tileColor: Color(0xFFF5F5F5),
                                activeColor:
                                    FlutterFlowTheme.of(context).primaryColor,
                                dense: false,
                                controlAffinity:
                                    ListTileControlAffinity.trailing,
                                contentPadding: EdgeInsetsDirectional.fromSTEB(
                                    30, 0, 40, 0),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50),
                                ),
                              ),
                            ),
                          );
                        }),
                      ),
                    );
                  },
                ),
              ],
            ),
            Align(
              alignment: AlignmentDirectional(0.05, 0.9),
              child: FFButtonWidget(
                onPressed: () async {
                  if (checkboxListTileCheckedItems.length >= 1) {
                    Navigator.pop(
                        context,
                        checkboxListTileCheckedItems
                            .map((e) => e.sportName)
                            .withoutNulls
                            .toList());
                  } else {
                    await showDialog(
                      context: context,
                      builder: (alertDialogContext) {
                        return AlertDialog(
                          title: Text('Please select atleast 1 Sport'),
                          content: Text('Please select atleast 1 Sport'),
                          actions: [
                            TextButton(
                              onPressed: () =>
                                  Navigator.pop(alertDialogContext),
                              child: Text('Ok'),
                            ),
                          ],
                        );
                      },
                    );
                  }
                },
                text: 'Confirm',
                options: FFButtonOptions(
                  width: 170,
                  height: 50,
                  color: FlutterFlowTheme.of(context).primaryColor,
                  textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                        fontFamily: 'Overpass',
                        color: FlutterFlowTheme.of(context).white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                  borderSide: BorderSide(
                    color: Colors.transparent,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
