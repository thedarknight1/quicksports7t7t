import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/chat/index.dart';
import '../flutter_flow/flutter_flow_ad_banner.dart';
import '../flutter_flow/flutter_flow_drop_down.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
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
  ChatMessagesRecord? lastMessage;
  ChatsRecord? groupChat;
  EventsRecord? createdEvent;
  DateTime? datePicked;
  String? dropDownValue1;
  String? dropDownValue2;
  String? dropDownValue3;
  TextEditingController? textController;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
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
                  child: Stack(
                    children: [
                      SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 15, 0, 10),
                              child: FFButtonWidget(
                                onPressed: () async {
                                  if (kIsWeb) {
                                    final _datePickedDate =
                                        await showDatePicker(
                                      context: context,
                                      initialDate: getCurrentTimestamp,
                                      firstDate: getCurrentTimestamp,
                                      lastDate: DateTime(2050),
                                    );

                                    TimeOfDay? _datePickedTime;
                                    if (_datePickedDate != null) {
                                      _datePickedTime = await showTimePicker(
                                        context: context,
                                        initialTime: TimeOfDay.fromDateTime(
                                            getCurrentTimestamp),
                                      );
                                    }

                                    if (_datePickedDate != null &&
                                        _datePickedTime != null) {
                                      setState(
                                        () => datePicked = DateTime(
                                          _datePickedDate.year,
                                          _datePickedDate.month,
                                          _datePickedDate.day,
                                          _datePickedTime!.hour,
                                          _datePickedTime.minute,
                                        ),
                                      );
                                    }
                                  } else {
                                    await DatePicker.showDateTimePicker(
                                      context,
                                      showTitleActions: true,
                                      onConfirm: (date) {
                                        setState(() => datePicked = date);
                                      },
                                      currentTime: getCurrentTimestamp,
                                      minTime: getCurrentTimestamp,
                                      locale: LocaleType.values.firstWhere(
                                        (l) =>
                                            l.name ==
                                            FFLocalizations.of(context)
                                                .languageCode,
                                        orElse: () => LocaleType.en,
                                      ),
                                    );
                                  }
                                },
                                text: valueOrDefault<String>(
                                  dateTimeFormat(
                                    'M/d h:mm a',
                                    datePicked,
                                    locale: FFLocalizations.of(context)
                                        .languageCode,
                                  ),
                                  'Set Date & Time',
                                ),
                                options: FFButtonOptions(
                                  width: 250,
                                  height: 50,
                                  color:
                                      FlutterFlowTheme.of(context).primaryColor,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .subtitle2
                                      .override(
                                        fontFamily: 'Overpass',
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500,
                                      ),
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                              child: FlutterFlowDropDown<String>(
                                options: [
                                  '1-5',
                                  '5-10',
                                  '10-15',
                                  '15-20',
                                  '20+'
                                ],
                                onChanged: (val) =>
                                    setState(() => dropDownValue1 = val),
                                width: 250,
                                height: 50,
                                textStyle: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Overpass',
                                      color: Colors.black,
                                    ),
                                hintText: 'Player Count',
                                fillColor: Colors.white,
                                elevation: 2,
                                borderColor: Colors.transparent,
                                borderWidth: 0,
                                borderRadius: 0,
                                margin: EdgeInsetsDirectional.fromSTEB(
                                    12, 4, 12, 4),
                                hidesUnderline: true,
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                              child: FlutterFlowDropDown<String>(
                                options: createeventpageCourtsRecord.sportList!
                                    .toList()
                                    .toList(),
                                onChanged: (val) =>
                                    setState(() => dropDownValue2 = val),
                                width: 250,
                                height: 50,
                                textStyle: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Overpass',
                                      color: Colors.black,
                                    ),
                                hintText: 'Select Sport',
                                fillColor: Colors.white,
                                elevation: 2,
                                borderColor: Colors.transparent,
                                borderWidth: 0,
                                borderRadius: 0,
                                margin: EdgeInsetsDirectional.fromSTEB(
                                    12, 4, 12, 4),
                                hidesUnderline: true,
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                              child: FlutterFlowDropDown<String>(
                                options: [
                                  'Under 13',
                                  '13-18',
                                  '18-30',
                                  '30-45',
                                  '45-60',
                                  '60+'
                                ],
                                onChanged: (val) =>
                                    setState(() => dropDownValue3 = val),
                                width: 250,
                                height: 50,
                                textStyle: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Overpass',
                                      color: Colors.black,
                                    ),
                                hintText: 'Player Age',
                                fillColor: Colors.white,
                                elevation: 2,
                                borderColor: Colors.transparent,
                                borderWidth: 0,
                                borderRadius: 0,
                                margin: EdgeInsetsDirectional.fromSTEB(
                                    12, 4, 12, 4),
                                hidesUnderline: true,
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(0, 0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    20, 10, 20, 20),
                                child: TextFormField(
                                  controller: textController,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    hintText: 'Description (optional)...',
                                    hintStyle:
                                        FlutterFlowTheme.of(context).bodyText2,
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0xFFC16666),
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0xFFC16666),
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    contentPadding:
                                        EdgeInsetsDirectional.fromSTEB(
                                            15, 6, 15, 6),
                                  ),
                                  style: FlutterFlowTheme.of(context).bodyText1,
                                ),
                              ),
                            ),
                            StreamBuilder<List<UsersRecord>>(
                              stream: queryUsersRecord(
                                queryBuilder: (usersRecord) => usersRecord
                                    .where('zips', isEqualTo: '738492929256'),
                                limit: 3,
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
                                List<UsersRecord> buttonUsersRecordList =
                                    snapshot.data!;
                                return FFButtonWidget(
                                  onPressed: () async {
                                    if ((datePicked != null) &&
                                        (dropDownValue1 != null &&
                                            dropDownValue1 != '') &&
                                        (dropDownValue3 != null &&
                                            dropDownValue3 != '') &&
                                        (dropDownValue2 != null &&
                                            dropDownValue2 != '')) {
                                      groupChat = await FFChatManager.instance
                                          .createChat(
                                        buttonUsersRecordList
                                            .where((e) => e != null)
                                            .toList()
                                            .map((e) => e.reference)
                                            .toList(),
                                      );

                                      final chatMessagesCreateData =
                                          createChatMessagesRecordData(
                                        user: currentUserReference,
                                        chat: groupChat!.reference,
                                        text:
                                            'Automatic message: Group chat has been created.',
                                        image: '',
                                        timestamp: getCurrentTimestamp,
                                      );
                                      var chatMessagesRecordReference =
                                          ChatMessagesRecord.collection.doc();
                                      await chatMessagesRecordReference
                                          .set(chatMessagesCreateData);
                                      lastMessage = ChatMessagesRecord
                                          .getDocumentFromData(
                                              chatMessagesCreateData,
                                              chatMessagesRecordReference);

                                      final chatsUpdateData =
                                          createChatsRecordData(
                                        lastMessage: lastMessage!.text,
                                        lastMessageTime: lastMessage!.timestamp,
                                        lastMessageSentBy: lastMessage!.user,
                                        numUsers: 1,
                                        chatEventName:
                                            createeventpageCourtsRecord.name,
                                        eventTime: dateTimeFormat(
                                          'jm',
                                          datePicked,
                                          locale: FFLocalizations.of(context)
                                              .languageCode,
                                        ),
                                        eventTimeStamp: datePicked,
                                      );
                                      await groupChat!.reference
                                          .update(chatsUpdateData);

                                      final eventsCreateData =
                                          createEventsRecordData(
                                        description: textController!.text,
                                        date: dateTimeFormat(
                                          'MMMEd',
                                          datePicked,
                                          locale: FFLocalizations.of(context)
                                              .languageCode,
                                        ),
                                        time: dateTimeFormat(
                                          'jm',
                                          datePicked,
                                          locale: FFLocalizations.of(context)
                                              .languageCode,
                                        ),
                                        playerage: dropDownValue3,
                                        playercount: dropDownValue1,
                                        activity: '',
                                        locationname:
                                            widget.createeventpage!.name,
                                        eventsportname: dropDownValue2,
                                        courtRef: createeventpageCourtsRecord
                                            .reference,
                                        groupChatRef: groupChat!.reference,
                                        dateTimeStamp: datePicked,
                                        latLngLocation:
                                            createeventpageCourtsRecord
                                                .location,
                                      );
                                      var eventsRecordReference =
                                          EventsRecord.collection.doc();
                                      await eventsRecordReference
                                          .set(eventsCreateData);
                                      createdEvent =
                                          EventsRecord.getDocumentFromData(
                                              eventsCreateData,
                                              eventsRecordReference);

                                      context.pushNamed(
                                        'courtAddedSuccessCopy',
                                        queryParams: {
                                          'groupChatRef': serializeParam(
                                            groupChat!.reference,
                                            ParamType.DocumentReference,
                                          ),
                                          'groupChatDoc': serializeParam(
                                            groupChat,
                                            ParamType.Document,
                                          ),
                                          'courtDoc': serializeParam(
                                            createeventpageCourtsRecord,
                                            ParamType.Document,
                                          ),
                                          'eventDoc': serializeParam(
                                            createdEvent,
                                            ParamType.Document,
                                          ),
                                        }.withoutNulls,
                                        extra: <String, dynamic>{
                                          'groupChatDoc': groupChat,
                                          'courtDoc':
                                              createeventpageCourtsRecord,
                                          'eventDoc': createdEvent,
                                        },
                                      );
                                    } else {
                                      await showDialog(
                                        context: context,
                                        builder: (alertDialogContext) {
                                          return AlertDialog(
                                            title: Text(
                                                'Please fill out all fields to continue'),
                                            content: Text(
                                                'Please fill out all fields to continue'),
                                            actions: [
                                              TextButton(
                                                onPressed: () => Navigator.pop(
                                                    alertDialogContext),
                                                child: Text('Ok'),
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                    }

                                    setState(() {});
                                  },
                                  text: 'Publish Event',
                                  options: FFButtonOptions(
                                    width: 290,
                                    height: 40,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryColor,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .subtitle2
                                        .override(
                                          fontFamily: 'Overpass',
                                          color: Colors.white,
                                        ),
                                    borderSide: BorderSide(
                                      color: Colors.transparent,
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Align(
                            alignment: AlignmentDirectional(0, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Expanded(
                                  child: Align(
                                    alignment: AlignmentDirectional(0, 0),
                                    child: FlutterFlowAdBanner(
                                      width: MediaQuery.of(context).size.width,
                                      height: 50,
                                      showsTestAd: false,
                                      iOSAdUnitID:
                                          'ca-app-pub-4806655917667448/5035392225',
                                      androidAdUnitID:
                                          'ca-app-pub-4806655917667448/2265758656',
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
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
