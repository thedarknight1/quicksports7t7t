import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/chat/index.dart';
import '../flutter_flow/flutter_flow_ad_banner.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class CourtDetailsWidget extends StatefulWidget {
  const CourtDetailsWidget({
    Key? key,
    this.court,
  }) : super(key: key);

  final CourtsRecord? court;

  @override
  _CourtDetailsWidgetState createState() => _CourtDetailsWidgetState();
}

class _CourtDetailsWidgetState extends State<CourtDetailsWidget> {
  ChatMessagesRecord? lastMessaged;
  ChatsRecord? groupChat3;
  ChatMessagesRecord? lastmessage2;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<CourtsRecord>(
      stream: CourtsRecord.getDocument(widget.court!.reference),
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
        final courtDetailsCourtsRecord = snapshot.data!;
        return Title(
            title: 'courtDetails',
            color: FlutterFlowTheme.of(context).primaryColor,
            child: Scaffold(
              key: scaffoldKey,
              backgroundColor: FlutterFlowTheme.of(context).white,
              body: Stack(
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: 207.7,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .background,
                                      image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: Image.network(
                                          valueOrDefault<String>(
                                            courtDetailsCourtsRecord.imageUrl,
                                            'https://i0.wp.com/sportsfieldsolutions.com/wp-content/uploads/2020/06/main-back.png?fit=1290%2C638&ssl=1',
                                          ),
                                        ).image,
                                      ),
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  20, 44, 0, 0),
                                          child: Card(
                                            clipBehavior:
                                                Clip.antiAliasWithSaveLayer,
                                            color: Color(0xB2111417),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(40),
                                            ),
                                            child: FlutterFlowIconButton(
                                              borderColor: Colors.transparent,
                                              borderRadius: 30,
                                              buttonSize: 46,
                                              fillColor: Color(0xFFEF534F),
                                              icon: Icon(
                                                Icons.arrow_back_rounded,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .white,
                                                size: 20,
                                              ),
                                              onPressed: () async {
                                                context.pushNamed('findCourt');
                                              },
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    15, 16, 15, 0),
                                child: SingleChildScrollView(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            widget.court!.name!
                                                .maybeHandleOverflow(
                                              maxChars: 29,
                                              replacement: '…',
                                            ),
                                            maxLines: 2,
                                            style: FlutterFlowTheme.of(context)
                                                .title3
                                                .override(
                                                  fontFamily: 'Overpass',
                                                  fontSize: 18,
                                                ),
                                          ),
                                          Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              Text(
                                                'Rating',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1,
                                              ),
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceAround,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0, 0, 4, 0),
                                                        child: StreamBuilder<
                                                            List<
                                                                CommentsRecord>>(
                                                          stream:
                                                              queryCommentsRecord(
                                                            queryBuilder: (commentsRecord) =>
                                                                commentsRecord.where(
                                                                    'court',
                                                                    isEqualTo:
                                                                        courtDetailsCourtsRecord
                                                                            .reference),
                                                          ),
                                                          builder: (context,
                                                              snapshot) {
                                                            // Customize what your widget looks like when it's loading.
                                                            if (!snapshot
                                                                .hasData) {
                                                              return Center(
                                                                child: SizedBox(
                                                                  width: 50,
                                                                  height: 50,
                                                                  child:
                                                                      SpinKitRotatingCircle(
                                                                    color: Color(
                                                                        0xFFF25454),
                                                                    size: 50,
                                                                  ),
                                                                ),
                                                              );
                                                            }
                                                            List<CommentsRecord>
                                                                textCommentsRecordList =
                                                                snapshot.data!;
                                                            return Text(
                                                              functions.getAverageRating(
                                                                  textCommentsRecordList
                                                                      .toList()),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .title3,
                                                            );
                                                          },
                                                        ),
                                                      ),
                                                      Icon(
                                                        Icons.star,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryColor,
                                                        size: 20,
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 0, 0, 12),
                                        child: StreamBuilder<CourtsRecord>(
                                          stream: CourtsRecord.getDocument(
                                              courtDetailsCourtsRecord
                                                  .reference),
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
                                            final descriptionCourtsRecord =
                                                snapshot.data!;
                                            return Builder(
                                              builder: (context) {
                                                final listOfSports =
                                                    descriptionCourtsRecord
                                                        .sportList!
                                                        .toList()
                                                        .take(4)
                                                        .toList();
                                                return Row(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: List.generate(
                                                      listOfSports.length,
                                                      (listOfSportsIndex) {
                                                    final listOfSportsItem =
                                                        listOfSports[
                                                            listOfSportsIndex];
                                                    return Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0, 0, 12, 0),
                                                      child: Text(
                                                        listOfSportsItem
                                                            .maybeHandleOverflow(
                                                          maxChars: 13,
                                                          replacement: '…',
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .subtitle1
                                                                .override(
                                                                  fontFamily:
                                                                      'Overpass',
                                                                  fontSize: 16,
                                                                ),
                                                      ),
                                                    );
                                                  }),
                                                );
                                              },
                                            );
                                          },
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 12, 0, 44),
                                        child:
                                            StreamBuilder<List<EventsRecord>>(
                                          stream: queryEventsRecord(
                                            queryBuilder: (eventsRecord) =>
                                                eventsRecord
                                                    .where(
                                                        'courtRef',
                                                        isEqualTo: widget
                                                            .court!.reference)
                                                    .where('dateTimeStamp',
                                                        isGreaterThanOrEqualTo:
                                                            getCurrentTimestamp)
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
                                            List<EventsRecord>
                                                listViewEventsRecordList =
                                                snapshot.data!;
                                            return ListView.builder(
                                              padding: EdgeInsets.zero,
                                              primary: false,
                                              shrinkWrap: true,
                                              scrollDirection: Axis.vertical,
                                              itemCount:
                                                  listViewEventsRecordList
                                                      .length,
                                              itemBuilder:
                                                  (context, listViewIndex) {
                                                final listViewEventsRecord =
                                                    listViewEventsRecordList[
                                                        listViewIndex];
                                                return Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(16, 4, 16, 8),
                                                  child: StreamBuilder<
                                                      ChatsRecord>(
                                                    stream:
                                                        ChatsRecord.getDocument(
                                                            listViewEventsRecord
                                                                .groupChatRef!),
                                                    builder:
                                                        (context, snapshot) {
                                                      // Customize what your widget looks like when it's loading.
                                                      if (!snapshot.hasData) {
                                                        return Center(
                                                          child: SizedBox(
                                                            width: 50,
                                                            height: 50,
                                                            child:
                                                                SpinKitRotatingCircle(
                                                              color: Color(
                                                                  0xFFF25454),
                                                              size: 50,
                                                            ),
                                                          ),
                                                        );
                                                      }
                                                      final userList5ChatsRecord =
                                                          snapshot.data!;
                                                      return Container(
                                                        width: double.infinity,
                                                        height: 180,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryColor,
                                                          boxShadow: [
                                                            BoxShadow(
                                                              blurRadius: 4,
                                                              color: Color(
                                                                  0x32000000),
                                                              offset:
                                                                  Offset(0, 2),
                                                            )
                                                          ],
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(14),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(8,
                                                                      0, 8, 0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Expanded(
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          12,
                                                                          0,
                                                                          0,
                                                                          0),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Text(
                                                                            listViewEventsRecord.time!,
                                                                            style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                  fontFamily: 'Overpass',
                                                                                  color: Colors.white,
                                                                                  fontSize: 25,
                                                                                ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      Text(
                                                                        dateTimeFormat(
                                                                          'MMMEd',
                                                                          listViewEventsRecord
                                                                              .dateTimeStamp!,
                                                                          locale:
                                                                              FFLocalizations.of(context).languageCode,
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyText2
                                                                            .override(
                                                                              fontFamily: 'Overpass',
                                                                              color: FlutterFlowTheme.of(context).gray200,
                                                                            ),
                                                                      ),
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Text(
                                                                            'Player count: ',
                                                                            style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                  fontFamily: 'Overpass',
                                                                                  color: Colors.white,
                                                                                  fontSize: 18,
                                                                                ),
                                                                          ),
                                                                          Text(
                                                                            userList5ChatsRecord.numUsers!.toString(),
                                                                            style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                  fontFamily: 'Overpass',
                                                                                  color: Colors.white,
                                                                                  fontSize: 18,
                                                                                ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Text(
                                                                            'Player age: ',
                                                                            style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                  fontFamily: 'Overpass',
                                                                                  color: Colors.white,
                                                                                  fontSize: 18,
                                                                                ),
                                                                          ),
                                                                          Text(
                                                                            listViewEventsRecord.playerage!,
                                                                            style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                  fontFamily: 'Overpass',
                                                                                  color: Colors.white,
                                                                                  fontSize: 18,
                                                                                ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Text(
                                                                            listViewEventsRecord.eventsportname!,
                                                                            style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                  fontFamily: 'Overpass',
                                                                                  color: Colors.white,
                                                                                  fontSize: 18,
                                                                                ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0,
                                                                            0,
                                                                            20,
                                                                            0),
                                                                child: StreamBuilder<
                                                                    List<
                                                                        UsersRecord>>(
                                                                  stream:
                                                                      queryUsersRecord(
                                                                    queryBuilder: (usersRecord) => usersRecord.where(
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
                                                                        buttonUsersRecordList =
                                                                        snapshot
                                                                            .data!;
                                                                    final buttonUsersRecord = buttonUsersRecordList
                                                                            .isNotEmpty
                                                                        ? buttonUsersRecordList
                                                                            .first
                                                                        : null;
                                                                    return FFButtonWidget(
                                                                      onPressed:
                                                                          () async {
                                                                        var _shouldSetState =
                                                                            false;
                                                                        if (userList5ChatsRecord.users!.toList().contains(currentUserReference) ==
                                                                            true) {
                                                                          context
                                                                              .pushNamed(
                                                                            'ChatPage',
                                                                            queryParams:
                                                                                {
                                                                              'eventGroupChat': serializeParam(
                                                                                userList5ChatsRecord,
                                                                                ParamType.Document,
                                                                              ),
                                                                              'chatRef': serializeParam(
                                                                                userList5ChatsRecord.reference,
                                                                                ParamType.DocumentReference,
                                                                              ),
                                                                            }.withoutNulls,
                                                                            extra: <String,
                                                                                dynamic>{
                                                                              'eventGroupChat': userList5ChatsRecord,
                                                                            },
                                                                          );

                                                                          if (_shouldSetState)
                                                                            setState(() {});
                                                                          return;
                                                                        } else {
                                                                          groupChat3 = await FFChatManager
                                                                              .instance
                                                                              .addGroupMembers(
                                                                            userList5ChatsRecord,
                                                                            [
                                                                              currentUserReference!
                                                                            ],
                                                                          );
                                                                          _shouldSetState =
                                                                              true;

                                                                          final chatMessagesCreateData =
                                                                              createChatMessagesRecordData(
                                                                            user:
                                                                                buttonUsersRecord!.reference,
                                                                            chat:
                                                                                userList5ChatsRecord.reference,
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
                                                                              userA: groupChat3!.userA,
                                                                              userB: groupChat3!.userB,
                                                                              lastMessage: lastMessaged!.text,
                                                                              lastMessageTime: lastMessaged!.timestamp,
                                                                              lastMessageSentBy: lastMessaged!.user,
                                                                            ),
                                                                            'users':
                                                                                FieldValue.arrayUnion([
                                                                              currentUserReference
                                                                            ]),
                                                                            'last_message_seen_by':
                                                                                groupChat3!.lastMessageSeenBy!.toList(),
                                                                            'numUsers':
                                                                                FieldValue.increment(1),
                                                                          };
                                                                          await listViewEventsRecord
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
                                                                              'eventGroupChat': serializeParam(
                                                                                groupChat3,
                                                                                ParamType.Document,
                                                                              ),
                                                                              'chatRef': serializeParam(
                                                                                groupChat3!.reference,
                                                                                ParamType.DocumentReference,
                                                                              ),
                                                                            }.withoutNulls,
                                                                            extra: <String,
                                                                                dynamic>{
                                                                              'eventGroupChat': groupChat3,
                                                                            },
                                                                          );
                                                                        }

                                                                        final chatMessagesCreateData =
                                                                            createChatMessagesRecordData(
                                                                          user:
                                                                              buttonUsersRecord!.reference,
                                                                          chat:
                                                                              listViewEventsRecord.groupChatRef,
                                                                          text:
                                                                              currentUserDisplayName,
                                                                          timestamp:
                                                                              getCurrentTimestamp,
                                                                        );
                                                                        var chatMessagesRecordReference = ChatMessagesRecord
                                                                            .collection
                                                                            .doc();
                                                                        await chatMessagesRecordReference
                                                                            .set(chatMessagesCreateData);
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
                                                                        await listViewEventsRecord
                                                                            .groupChatRef!
                                                                            .update(chatsUpdateData);
                                                                        if (_shouldSetState)
                                                                          setState(
                                                                              () {});
                                                                      },
                                                                      text:
                                                                          'Join Event',
                                                                      options:
                                                                          FFButtonOptions(
                                                                        width:
                                                                            100,
                                                                        height:
                                                                            36,
                                                                        color: Colors
                                                                            .white,
                                                                        textStyle: FlutterFlowTheme.of(context)
                                                                            .bodyText1
                                                                            .override(
                                                                              fontFamily: 'Outfit',
                                                                              color: FlutterFlowTheme.of(context).secondaryColor,
                                                                              fontSize: 14,
                                                                              fontWeight: FontWeight.normal,
                                                                            ),
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).white,
                                                                          width:
                                                                              1,
                                                                        ),
                                                                        borderRadius:
                                                                            BorderRadius.circular(50),
                                                                      ),
                                                                    );
                                                                  },
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  ),
                                                );
                                              },
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
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Expanded(
                                child: FlutterFlowAdBanner(
                                  width: MediaQuery.of(context).size.width,
                                  height: 50,
                                  showsTestAd: false,
                                  iOSAdUnitID:
                                      'ca-app-pub-4806655917667448/7038888390',
                                  androidAdUnitID:
                                      'ca-app-pub-4806655917667448/6031012760',
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: 90,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).white,
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 3,
                                  color: Color(0x29000000),
                                  offset: Offset(0, -1),
                                )
                              ],
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                FFButtonWidget(
                                  onPressed: () async {
                                    await launchURL(functions.getMapUrl(
                                        courtDetailsCourtsRecord.location));
                                  },
                                  text: 'Open in Maps',
                                  options: FFButtonOptions(
                                    width: 130,
                                    height: 50,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryColor,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .bodyText2
                                        .override(
                                          fontFamily: 'Overpass',
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                    borderSide: BorderSide(
                                      color: Colors.transparent,
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                ),
                                FFButtonWidget(
                                  onPressed: () async {
                                    context.pushNamed(
                                      'createeventpage',
                                      queryParams: {
                                        'createeventpage': serializeParam(
                                          courtDetailsCourtsRecord,
                                          ParamType.Document,
                                        ),
                                      }.withoutNulls,
                                      extra: <String, dynamic>{
                                        'createeventpage':
                                            courtDetailsCourtsRecord,
                                      },
                                    );
                                  },
                                  text: 'Create Event',
                                  options: FFButtonOptions(
                                    width: 130,
                                    height: 50,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryColor,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .bodyText2
                                        .override(
                                          fontFamily: 'Overpass',
                                          color: FlutterFlowTheme.of(context)
                                              .white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                    borderSide: BorderSide(
                                      color: Colors.transparent,
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                ),
                                FFButtonWidget(
                                  onPressed: () async {
                                    context.pushNamed(
                                      'rateCourtPage',
                                      queryParams: {
                                        'court': serializeParam(
                                          courtDetailsCourtsRecord,
                                          ParamType.Document,
                                        ),
                                      }.withoutNulls,
                                      extra: <String, dynamic>{
                                        'court': courtDetailsCourtsRecord,
                                      },
                                    );
                                  },
                                  text: 'Rate',
                                  options: FFButtonOptions(
                                    height: 50,
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        20, 0, 20, 0),
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryColor,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .bodyText2
                                        .override(
                                          fontFamily: 'Overpass',
                                          color: FlutterFlowTheme.of(context)
                                              .white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                    borderSide: BorderSide(
                                      color: Colors.transparent,
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ));
      },
    );
  }
}
