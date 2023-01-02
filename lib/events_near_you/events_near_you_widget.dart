import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/chat/index.dart';
import '../flutter_flow/flutter_flow_ad_banner.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class EventsNearYouWidget extends StatefulWidget {
  const EventsNearYouWidget({Key? key}) : super(key: key);

  @override
  _EventsNearYouWidgetState createState() => _EventsNearYouWidgetState();
}

class _EventsNearYouWidgetState extends State<EventsNearYouWidget> {
  ChatMessagesRecord? lastMessaged;
  ChatsRecord? groupChat3;
  ChatMessagesRecord? lastmessage2;
  LatLng? currentUserLocationValue;
  final _unfocusNode = FocusNode();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    getCurrentUserLocation(defaultLocation: LatLng(0.0, 0.0), cached: true)
        .then((loc) => setState(() => currentUserLocationValue = loc));
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (currentUserLocationValue == null) {
      return Container(
        color: FlutterFlowTheme.of(context).primaryBackground,
        child: Center(
          child: SizedBox(
            width: 50,
            height: 50,
            child: SpinKitRotatingCircle(
              color: Color(0xFFF25454),
              size: 50,
            ),
          ),
        ),
      );
    }

    return StreamBuilder<List<EventsRecord>>(
      stream: queryEventsRecord(
        queryBuilder: (eventsRecord) => eventsRecord
            .where('dateTimeStamp', isGreaterThan: getCurrentTimestamp)
            .orderBy('dateTimeStamp'),
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
        List<EventsRecord> eventsNearYouEventsRecordList = snapshot.data!;
        return Title(
            title: 'eventsNearYou',
            color: FlutterFlowTheme.of(context).primaryColor,
            child: Scaffold(
              key: scaffoldKey,
              backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
              appBar: AppBar(
                backgroundColor:
                    FlutterFlowTheme.of(context).secondaryBackground,
                automaticallyImplyLeading: false,
                title: Text(
                  'Events near you',
                  style: FlutterFlowTheme.of(context).title1.override(
                        fontFamily: 'Overpass',
                        color: FlutterFlowTheme.of(context).secondaryColor,
                      ),
                ),
                actions: [],
                centerTitle: false,
                elevation: 0,
              ),
              body: GestureDetector(
                onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
                child: Stack(
                  children: [
                    SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Builder(
                            builder: (context) {
                              final eventsNear = functions
                                  .getPlacesMaximumDistanceCopy2(
                                      eventsNearYouEventsRecordList.toList(),
                                      currentUserLocationValue!,
                                      40.0)
                                  .toList();
                              return ListView.builder(
                                padding: EdgeInsets.zero,
                                primary: false,
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemCount: eventsNear.length,
                                itemBuilder: (context, eventsNearIndex) {
                                  final eventsNearItem =
                                      eventsNear[eventsNearIndex];
                                  return Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16, 12, 16, 0),
                                    child: StreamBuilder<ChatsRecord>(
                                      stream: ChatsRecord.getDocument(
                                          eventsNearItem.groupChatRef!),
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
                                        final containerPhotoBGChatsRecord =
                                            snapshot.data!;
                                        return Container(
                                          width: double.infinity,
                                          height: 217.8,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryColor,
                                            boxShadow: [
                                              BoxShadow(
                                                blurRadius: 30,
                                                color: Color(0x33000000),
                                                offset: Offset(0, 2),
                                              )
                                            ],
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          ),
                                          child: Stack(
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 0, 0, 10),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(16, 16,
                                                                  16, 0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Expanded(
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          10,
                                                                          0,
                                                                          0,
                                                                          0),
                                                              child: Text(
                                                                eventsNearItem
                                                                    .locationname!
                                                                    .maybeHandleOverflow(
                                                                  maxChars: 27,
                                                                  replacement:
                                                                      '…',
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .title1
                                                                    .override(
                                                                      fontFamily:
                                                                          'Lexend Deca',
                                                                      color: Colors
                                                                          .white,
                                                                      fontSize:
                                                                          18,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                    ),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  16, 4, 16, 0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Expanded(
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          10,
                                                                          0,
                                                                          0,
                                                                          0),
                                                              child: Text(
                                                                eventsNearItem
                                                                    .city!,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyText2
                                                                    .override(
                                                                      fontFamily:
                                                                          'Lexend Deca',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .grayLines,
                                                                      fontSize:
                                                                          14,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .normal,
                                                                    ),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  16, 4, 16, 0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Expanded(
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          10,
                                                                          0,
                                                                          0,
                                                                          0),
                                                              child: Text(
                                                                eventsNearItem
                                                                    .eventsportname!,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyText2
                                                                    .override(
                                                                      fontFamily:
                                                                          'Lexend Deca',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryColor,
                                                                      fontSize:
                                                                          16,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .normal,
                                                                    ),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  16, 4, 16, 0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        10,
                                                                        0,
                                                                        4,
                                                                        0),
                                                            child: Text(
                                                              'Current Player Count:',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyText2
                                                                  .override(
                                                                    fontFamily:
                                                                        'Lexend Deca',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryColor,
                                                                    fontSize:
                                                                        16,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal,
                                                                  ),
                                                            ),
                                                          ),
                                                          Text(
                                                            containerPhotoBGChatsRecord
                                                                .numUsers!
                                                                .toString(),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyText2
                                                                .override(
                                                                  fontFamily:
                                                                      'Lexend Deca',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryColor,
                                                                  fontSize: 16,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(16, 4,
                                                                    16, 18),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .end,
                                                          children: [
                                                            Expanded(
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            10,
                                                                            0,
                                                                            0,
                                                                            0),
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .end,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                              0,
                                                                              0,
                                                                              0,
                                                                              4),
                                                                      child:
                                                                          Text(
                                                                        dateTimeFormat(
                                                                          'jm',
                                                                          eventsNearItem
                                                                              .dateTimeStamp!,
                                                                          locale:
                                                                              FFLocalizations.of(context).languageCode,
                                                                        ),
                                                                        textAlign:
                                                                            TextAlign.start,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .title3
                                                                            .override(
                                                                              fontFamily: 'Lexend Deca',
                                                                              color: Colors.white,
                                                                              fontSize: 20,
                                                                              fontWeight: FontWeight.bold,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                              0,
                                                                              0,
                                                                              0,
                                                                              10),
                                                                      child:
                                                                          Text(
                                                                        dateTimeFormat(
                                                                          'MMMEd',
                                                                          eventsNearItem
                                                                              .dateTimeStamp!,
                                                                          locale:
                                                                              FFLocalizations.of(context).languageCode,
                                                                        ),
                                                                        textAlign:
                                                                            TextAlign.start,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyText1
                                                                            .override(
                                                                              fontFamily: 'Lexend Deca',
                                                                              color: Color(0xB4FFFFFF),
                                                                              fontSize: 14,
                                                                              fontWeight: FontWeight.normal,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          10,
                                                                          0,
                                                                          15,
                                                                          10),
                                                              child: StreamBuilder<
                                                                  List<
                                                                      UsersRecord>>(
                                                                stream:
                                                                    queryUsersRecord(
                                                                  queryBuilder: (usersRecord) =>
                                                                      usersRecord.where(
                                                                          'uid',
                                                                          isEqualTo:
                                                                              'kurTAlbhyqV5yBwoZJmO2QIp6jy2'),
                                                                  singleRecord:
                                                                      true,
                                                                ),
                                                                builder: (context,
                                                                    snapshot) {
                                                                  // Customize what your widget looks like when it's loading.
                                                                  if (!snapshot
                                                                      .hasData) {
                                                                    return Center(
                                                                      child:
                                                                          SizedBox(
                                                                        width:
                                                                            50,
                                                                        height:
                                                                            50,
                                                                        child:
                                                                            SpinKitRotatingCircle(
                                                                          color:
                                                                              Color(0xFFF25454),
                                                                          size:
                                                                              50,
                                                                        ),
                                                                      ),
                                                                    );
                                                                  }
                                                                  List<UsersRecord>
                                                                      buttonReserveUsersRecordList =
                                                                      snapshot
                                                                          .data!;
                                                                  final buttonReserveUsersRecord = buttonReserveUsersRecordList
                                                                          .isNotEmpty
                                                                      ? buttonReserveUsersRecordList
                                                                          .first
                                                                      : null;
                                                                  return FFButtonWidget(
                                                                    onPressed:
                                                                        () async {
                                                                      var _shouldSetState =
                                                                          false;
                                                                      if (containerPhotoBGChatsRecord
                                                                              .users!
                                                                              .toList()
                                                                              .contains(currentUserReference) ==
                                                                          true) {
                                                                        context
                                                                            .pushNamed(
                                                                          'ChatPage',
                                                                          queryParams:
                                                                              {
                                                                            'eventGroupChat':
                                                                                serializeParam(
                                                                              containerPhotoBGChatsRecord,
                                                                              ParamType.Document,
                                                                            ),
                                                                            'chatRef':
                                                                                serializeParam(
                                                                              eventsNearItem.groupChatRef,
                                                                              ParamType.DocumentReference,
                                                                            ),
                                                                          }.withoutNulls,
                                                                          extra: <
                                                                              String,
                                                                              dynamic>{
                                                                            'eventGroupChat':
                                                                                containerPhotoBGChatsRecord,
                                                                          },
                                                                        );

                                                                        if (_shouldSetState)
                                                                          setState(
                                                                              () {});
                                                                        return;
                                                                      } else {
                                                                        groupChat3 = await FFChatManager
                                                                            .instance
                                                                            .addGroupMembers(
                                                                          containerPhotoBGChatsRecord,
                                                                          [
                                                                            currentUserReference!
                                                                          ],
                                                                        );
                                                                        _shouldSetState =
                                                                            true;

                                                                        final chatMessagesCreateData =
                                                                            createChatMessagesRecordData(
                                                                          user:
                                                                              buttonReserveUsersRecord!.reference,
                                                                          chat:
                                                                              eventsNearItem.groupChatRef,
                                                                          text:
                                                                              'Automatic Message: New user has joined the event:',
                                                                          timestamp:
                                                                              getCurrentTimestamp,
                                                                        );
                                                                        var chatMessagesRecordReference = ChatMessagesRecord
                                                                            .collection
                                                                            .doc();
                                                                        await chatMessagesRecordReference
                                                                            .set(chatMessagesCreateData);
                                                                        lastMessaged = ChatMessagesRecord.getDocumentFromData(
                                                                            chatMessagesCreateData,
                                                                            chatMessagesRecordReference);
                                                                        _shouldSetState =
                                                                            true;

                                                                        final chatsUpdateData =
                                                                            {
                                                                          ...createChatsRecordData(
                                                                            lastMessage:
                                                                                lastMessaged!.text,
                                                                            lastMessageTime:
                                                                                lastMessaged!.timestamp,
                                                                            lastMessageSentBy:
                                                                                lastMessaged!.user,
                                                                          ),
                                                                          'users':
                                                                              FieldValue.arrayUnion([
                                                                            currentUserReference
                                                                          ]),
                                                                          'numUsers':
                                                                              FieldValue.increment(1),
                                                                        };
                                                                        await eventsNearItem
                                                                            .groupChatRef!
                                                                            .update(chatsUpdateData);
                                                                        await showDialog(
                                                                          context:
                                                                              context,
                                                                          builder:
                                                                              (alertDialogContext) {
                                                                            return AlertDialog(
                                                                              title: Text('You\'re in!'),
                                                                              content: Text('You\'ve successfully joined the event!'),
                                                                              actions: [
                                                                                TextButton(
                                                                                  onPressed: () => Navigator.pop(alertDialogContext),
                                                                                  child: Text('Go to event group chat'),
                                                                                ),
                                                                              ],
                                                                            );
                                                                          },
                                                                        );

                                                                        context
                                                                            .pushNamed(
                                                                          'ChatPage',
                                                                          queryParams:
                                                                              {
                                                                            'eventGroupChat':
                                                                                serializeParam(
                                                                              containerPhotoBGChatsRecord,
                                                                              ParamType.Document,
                                                                            ),
                                                                            'chatRef':
                                                                                serializeParam(
                                                                              eventsNearItem.groupChatRef,
                                                                              ParamType.DocumentReference,
                                                                            ),
                                                                          }.withoutNulls,
                                                                          extra: <
                                                                              String,
                                                                              dynamic>{
                                                                            'eventGroupChat':
                                                                                containerPhotoBGChatsRecord,
                                                                          },
                                                                        );
                                                                      }

                                                                      final chatMessagesCreateData =
                                                                          createChatMessagesRecordData(
                                                                        user: buttonReserveUsersRecord!
                                                                            .reference,
                                                                        chat: eventsNearItem
                                                                            .groupChatRef,
                                                                        text:
                                                                            currentUserDisplayName,
                                                                        timestamp:
                                                                            getCurrentTimestamp,
                                                                      );
                                                                      var chatMessagesRecordReference = ChatMessagesRecord
                                                                          .collection
                                                                          .doc();
                                                                      await chatMessagesRecordReference
                                                                          .set(
                                                                              chatMessagesCreateData);
                                                                      lastmessage2 = ChatMessagesRecord.getDocumentFromData(
                                                                          chatMessagesCreateData,
                                                                          chatMessagesRecordReference);
                                                                      _shouldSetState =
                                                                          true;

                                                                      final chatsUpdateData =
                                                                          createChatsRecordData(
                                                                        lastMessage:
                                                                            lastmessage2!.text,
                                                                        lastMessageTime:
                                                                            lastmessage2!.timestamp,
                                                                        lastMessageSentBy:
                                                                            lastmessage2!.user,
                                                                      );
                                                                      await eventsNearItem
                                                                          .groupChatRef!
                                                                          .update(
                                                                              chatsUpdateData);
                                                                      if (_shouldSetState)
                                                                        setState(
                                                                            () {});
                                                                    },
                                                                    text:
                                                                        'Join Event',
                                                                    options:
                                                                        FFButtonOptions(
                                                                      width:
                                                                          120,
                                                                      height:
                                                                          40,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryColor,
                                                                      textStyle:
                                                                          GoogleFonts
                                                                              .getFont(
                                                                        'Lexend Deca',
                                                                        color: Colors
                                                                            .white,
                                                                        fontSize:
                                                                            14,
                                                                      ),
                                                                      elevation:
                                                                          3,
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: Colors
                                                                            .transparent,
                                                                        width:
                                                                            1,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              50),
                                                                    ),
                                                                  );
                                                                },
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 50, 0, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0, 1),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Row(
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
                                        'ca-app-pub-4806655917667448/9255228865',
                                    androidAdUnitID:
                                        'ca-app-pub-4806655917667448/8101891301',
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ));
      },
    );
  }
}
