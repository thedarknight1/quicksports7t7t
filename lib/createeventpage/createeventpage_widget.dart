import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/chat/index.dart';
import '../flutter_flow/flutter_flow_calendar.dart';
import '../flutter_flow/flutter_flow_drop_down.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class CreateeventpageWidget extends StatefulWidget {
  const CreateeventpageWidget({
    Key? key,
    this.createeventpage,
  }) : super(key: key);

  final CourtsRecord? createeventpage;

  @override
  _CreateeventpageWidgetState createState() => _CreateeventpageWidgetState();
}

class _CreateeventpageWidgetState extends State<CreateeventpageWidget> {
  ChatsRecord? groupChat;
  bool? switchValue;
  DateTimeRange? calendarSelectedDay;
  String? dropDownValue1;
  String? dropDownValue2;
  String? dropDownValue3;
  TextEditingController? textController;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    calendarSelectedDay = DateTimeRange(
      start: DateTime.now().startOfDay,
      end: DateTime.now().endOfDay,
    );
    textController = TextEditingController();
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    textController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<CourtsRecord>(
      stream: CourtsRecord.getDocument(widget.createeventpage!.reference),
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
        final createeventpageCourtsRecord = snapshot.data!;
        return Title(
            title: 'createeventpage',
            color: FlutterFlowTheme.of(context).primaryColor,
            child: Scaffold(
              key: scaffoldKey,
              backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
              appBar: AppBar(
                backgroundColor: FlutterFlowTheme.of(context).primaryColor,
                automaticallyImplyLeading: false,
                leading: FlutterFlowIconButton(
                  borderColor: Colors.transparent,
                  borderRadius: 30,
                  borderWidth: 1,
                  buttonSize: 60,
                  icon: Icon(
                    Icons.arrow_back_rounded,
                    color: Colors.white,
                    size: 30,
                  ),
                  onPressed: () async {
                    context.pop();
                  },
                ),
                title: Text(
                  widget.createeventpage!.name!,
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
                      FlutterFlowCalendar(
                        color: FlutterFlowTheme.of(context).primaryColor,
                        weekFormat: false,
                        weekStartsMonday: false,
                        initialDate: getCurrentTimestamp,
                        onChange: (DateTimeRange? newSelectedDate) {
                          setState(() => calendarSelectedDay = newSelectedDate);
                        },
                        titleStyle: TextStyle(),
                        dayOfWeekStyle: TextStyle(),
                        dateStyle: TextStyle(),
                        selectedDateStyle: TextStyle(),
                        inactiveDateStyle: TextStyle(),
                        locale: FFLocalizations.of(context).languageCode,
                      ),
                      FlutterFlowDropDown(
                        options: [
                          '12:00 AM',
                          '12:30 AM',
                          '1:00 AM',
                          '1:30 AM',
                          '2:00 AM',
                          '2:30 AM',
                          '3:00 AM',
                          '3:30 AM',
                          '4:00 AM',
                          '4:30 AM',
                          '5:00 AM',
                          '5:30 AM',
                          '6:00 AM',
                          '6:30 AM',
                          '7:00 AM',
                          '7:30 AM',
                          '8:00 AM',
                          '8:30 AM',
                          '9:00 AM',
                          '9:30 AM',
                          '10:00 AM',
                          '10:30 AM',
                          '11:00 AM',
                          '11:30 AM',
                          '12:00 PM',
                          '12:30 PM',
                          '1:00 PM',
                          '1:30 PM',
                          '2:00 PM',
                          '2:30 PM',
                          '3:00 PM',
                          '3:30 PM',
                          '4:00 PM',
                          '4:30 PM',
                          '5:00 PM',
                          '5:30 PM',
                          '6:00 PM',
                          '6:30 PM',
                          '7:00 PM',
                          '7:30 PM',
                          '8:00 PM',
                          '8:30 PM',
                          '9:00 PM',
                          '9:30 PM',
                          '10:00 PM',
                          '10:30 PM',
                          '11:00 PM',
                          '11:30 PM'
                        ],
                        onChanged: (val) =>
                            setState(() => dropDownValue1 = val),
                        width: 180,
                        height: 50,
                        textStyle:
                            FlutterFlowTheme.of(context).bodyText1.override(
                                  fontFamily: 'Overpass',
                                  color: Colors.black,
                                ),
                        hintText: 'Select Time',
                        fillColor: Colors.white,
                        elevation: 2,
                        borderColor: Colors.transparent,
                        borderWidth: 0,
                        borderRadius: 0,
                        margin: EdgeInsetsDirectional.fromSTEB(12, 4, 12, 4),
                        hidesUnderline: true,
                      ),
                      FlutterFlowDropDown(
                        options: ['1-5', '5-10', '10-15', '15-20', '20+'],
                        onChanged: (val) =>
                            setState(() => dropDownValue2 = val),
                        width: 180,
                        height: 50,
                        textStyle:
                            FlutterFlowTheme.of(context).bodyText1.override(
                                  fontFamily: 'Overpass',
                                  color: Colors.black,
                                ),
                        hintText: 'Player Count',
                        fillColor: Colors.white,
                        elevation: 2,
                        borderColor: Colors.transparent,
                        borderWidth: 0,
                        borderRadius: 0,
                        margin: EdgeInsetsDirectional.fromSTEB(12, 4, 12, 4),
                        hidesUnderline: true,
                      ),
                      FlutterFlowDropDown(
                        options: ['13-18', '18-30', '30-45', '45-60', '60+'],
                        onChanged: (val) =>
                            setState(() => dropDownValue3 = val),
                        width: 180,
                        height: 50,
                        textStyle:
                            FlutterFlowTheme.of(context).bodyText1.override(
                                  fontFamily: 'Overpass',
                                  color: Colors.black,
                                ),
                        hintText: 'Player Age',
                        fillColor: Colors.white,
                        elevation: 2,
                        borderColor: Colors.transparent,
                        borderWidth: 0,
                        borderRadius: 0,
                        margin: EdgeInsetsDirectional.fromSTEB(12, 4, 12, 4),
                        hidesUnderline: true,
                      ),
                      Switch.adaptive(
                        value: switchValue ??= true,
                        onChanged: (newValue) async {
                          setState(() => switchValue = newValue!);
                          if (newValue!) {
                            groupChat = await FFChatManager.instance.createChat(
                              [currentUserReference!],
                            );

                            setState(() {});
                          }
                        },
                      ),
                      Text(
                        'Create Group Chat',
                        style: FlutterFlowTheme.of(context).bodyText1,
                      ),
                      Align(
                        alignment: AlignmentDirectional(0, 0),
                        child: TextFormField(
                          controller: textController,
                          autofocus: true,
                          obscureText: false,
                          decoration: InputDecoration(
                            hintText: 'Description...',
                            hintStyle: FlutterFlowTheme.of(context).bodyText2,
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.white,
                                width: 1,
                              ),
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(4.0),
                                topRight: Radius.circular(4.0),
                              ),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.white,
                                width: 1,
                              ),
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(4.0),
                                topRight: Radius.circular(4.0),
                              ),
                            ),
                            errorBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 1,
                              ),
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(4.0),
                                topRight: Radius.circular(4.0),
                              ),
                            ),
                            focusedErrorBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 1,
                              ),
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(4.0),
                                topRight: Radius.circular(4.0),
                              ),
                            ),
                            contentPadding:
                                EdgeInsetsDirectional.fromSTEB(10, 4, 10, 4),
                          ),
                          style: FlutterFlowTheme.of(context).bodyText1,
                        ),
                      ),
                      FFButtonWidget(
                        onPressed: () async {
                          final eventsCreateData = createEventsRecordData(
                            description: textController!.text,
                            date: dateTimeFormat(
                              'yMMMd',
                              calendarSelectedDay?.start,
                              locale: FFLocalizations.of(context).languageCode,
                            ),
                            time: dropDownValue1,
                            playerage: dropDownValue3,
                            playercount: dropDownValue2,
                            activity: '',
                            locationname: widget.createeventpage!.name,
                            locationarea:
                                widget.createeventpage!.location?.toString(),
                            eventsportname: widget.createeventpage!.sportname,
                            groupchat: groupChat!.reference,
                          );
                          await EventsRecord.collection
                              .doc()
                              .set(eventsCreateData);

                          context.pushNamed(
                            'ChatPage',
                            queryParams: {
                              'eventGroupChat': serializeParam(
                                groupChat!.reference,
                                ParamType.DocumentReference,
                              ),
                            }.withoutNulls,
                          );
                        },
                        text: 'Publish Event',
                        options: FFButtonOptions(
                          width: 130,
                          height: 40,
                          color: FlutterFlowTheme.of(context).primaryColor,
                          textStyle:
                              FlutterFlowTheme.of(context).subtitle2.override(
                                    fontFamily: 'Overpass',
                                    color: Colors.white,
                                  ),
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ));
      },
    );
  }
}
