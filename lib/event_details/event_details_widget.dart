import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/chat/index.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:share_plus/share_plus.dart';

class EventDetailsWidget extends StatefulWidget {
  const EventDetailsWidget({
    Key? key,
    this.court,
    this.courtRef,
    this.event,
    this.eventRef,
    this.chat,
    this.chatRef,
  }) : super(key: key);

  final CourtsRecord? court;
  final DocumentReference? courtRef;
  final EventsRecord? event;
  final DocumentReference? eventRef;
  final ChatsRecord? chat;
  final DocumentReference? chatRef;

  @override
  _EventDetailsWidgetState createState() => _EventDetailsWidgetState();
}

class _EventDetailsWidgetState extends State<EventDetailsWidget> {
  ChatMessagesRecord? lastMessaged;
  ChatsRecord? groupChat3;
  ChatMessagesRecord? lastmessage2;
  String _currentPageLink = '';
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<UsersRecord>>(
      future: queryUsersRecordOnce(
        queryBuilder: (usersRecord) =>
            usersRecord.where('uid', isEqualTo: 'kurTAlbhyqV5yBwoZJmO2QIp6jy2'),
        singleRecord: true,
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
        List<UsersRecord> eventDetailsUsersRecordList = snapshot.data!;
        final eventDetailsUsersRecord = eventDetailsUsersRecordList.isNotEmpty
            ? eventDetailsUsersRecordList.first
            : null;
        return Title(
            title: 'eventDetails',
            color: FlutterFlowTheme.of(context).primaryColor,
            child: Scaffold(
              key: scaffoldKey,
              backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
              appBar: AppBar(
                backgroundColor:
                    FlutterFlowTheme.of(context).secondaryBackground,
                automaticallyImplyLeading: false,
                leading: InkWell(
                  onTap: () async {
                    context.pop();
                  },
                  child: Icon(
                    Icons.chevron_left_rounded,
                    color: FlutterFlowTheme.of(context).primaryText,
                    size: 32,
                  ),
                ),
                title: Text(
                  'Event Details',
                  style: FlutterFlowTheme.of(context).title2,
                ),
                actions: [],
                centerTitle: false,
                elevation: 0,
              ),
              body: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(20, 12, 20, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Text(
                            widget.event!.locationname!,
                            style: FlutterFlowTheme.of(context).title2,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(20, 5, 20, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Text(
                            widget.event!.address!,
                            style: FlutterFlowTheme.of(context)
                                .bodyText1
                                .override(
                                  fontFamily: 'Overpass',
                                  color:
                                      FlutterFlowTheme.of(context).primaryColor,
                                ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(20, 4, 20, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Text(
                            dateTimeFormat(
                              'M/d h:mm a',
                              widget.event!.dateTimeStamp!,
                              locale: FFLocalizations.of(context).languageCode,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .subtitle1
                                .override(
                                  fontFamily: 'Overpass',
                                  color:
                                      FlutterFlowTheme.of(context).primaryColor,
                                ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(20, 4, 20, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Text(
                            widget.event!.eventsportname!,
                            style: FlutterFlowTheme.of(context)
                                .subtitle1
                                .override(
                                  fontFamily: 'Overpass',
                                  color:
                                      FlutterFlowTheme.of(context).primaryColor,
                                ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(20, 4, 20, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Number of Players in Event: ',
                          style:
                              FlutterFlowTheme.of(context).bodyText1.override(
                                    fontFamily: 'Overpass',
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                  ),
                        ),
                        Text(
                          widget.chat!.numUsers!.toString(),
                          style: FlutterFlowTheme.of(context)
                              .subtitle1
                              .override(
                                fontFamily: 'Overpass',
                                color:
                                    FlutterFlowTheme.of(context).primaryColor,
                              ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(20, 4, 20, 10),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Suggested Age Group: ',
                          style:
                              FlutterFlowTheme.of(context).bodyText1.override(
                                    fontFamily: 'Overpass',
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                  ),
                        ),
                        Text(
                          widget.event!.playerage!,
                          style: FlutterFlowTheme.of(context)
                              .subtitle1
                              .override(
                                fontFamily: 'Overpass',
                                color:
                                    FlutterFlowTheme.of(context).primaryColor,
                              ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(20, 12, 20, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          'Users in Event:',
                          style: FlutterFlowTheme.of(context).bodyText1,
                        ),
                      ],
                    ),
                  ),
                  StreamBuilder<List<UsersRecord>>(
                    stream: queryUsersRecord(
                      queryBuilder: (usersRecord) => usersRecord.where('uid',
                          isEqualTo: '5I4iJAQ4y9euHvn7kS4nOJlhHdf2'),
                      singleRecord: true,
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
                      List<UsersRecord> containerUsersRecordList =
                          snapshot.data!;
                      final containerUsersRecord =
                          containerUsersRecordList.isNotEmpty
                              ? containerUsersRecordList.first
                              : null;
                      return Container(
                        width: double.infinity,
                        height: 170,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).primaryBackground,
                        ),
                        child: Builder(
                          builder: (context) {
                            final usersInEvent = widget.chat!.users!
                                .toList()
                                .where((e) =>
                                    (e != currentUserReference) &&
                                    (e != containerUsersRecord!.reference))
                                .toList();
                            return ListView.builder(
                              padding: EdgeInsets.zero,
                              primary: false,
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemCount: usersInEvent.length,
                              itemBuilder: (context, usersInEventIndex) {
                                final usersInEventItem =
                                    usersInEvent[usersInEventIndex];
                                return Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      12, 12, 1, 12),
                                  child: StreamBuilder<UsersRecord>(
                                    stream: UsersRecord.getDocument(
                                        usersInEventItem),
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
                                      final containerUsersRecord =
                                          snapshot.data!;
                                      return Container(
                                        width: 160,
                                        height: 100,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          boxShadow: [
                                            BoxShadow(
                                              blurRadius: 4,
                                              color: Color(0x34090F13),
                                              offset: Offset(0, 2),
                                            )
                                          ],
                                          borderRadius:
                                              BorderRadius.circular(30),
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  12, 12, 12, 12),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(50),
                                                child: Image.network(
                                                  valueOrDefault<String>(
                                                    containerUsersRecord
                                                        .photoUrl,
                                                    'https://t4.ftcdn.net/jpg/00/64/67/63/360_F_64676383_LdbmhiNM6Ypzb3FM4PPuFP9rHe7ri8Ju.jpg',
                                                  ),
                                                  width: 60,
                                                  height: 60,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 8, 0, 0),
                                                child: Text(
                                                  containerUsersRecord
                                                      .displayName!,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyText1,
                                                ),
                                              ),
                                              Text(
                                                containerUsersRecord.city!,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1,
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
                      );
                    },
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 10),
                    child: FFButtonWidget(
                      onPressed: () async {
                        var _shouldSetState = false;
                        if (widget.chat!.users!
                                .toList()
                                .contains(currentUserReference) ==
                            true) {
                          context.pushNamed(
                            'ChatPage',
                            queryParams: {
                              'eventGroupChat': serializeParam(
                                widget.chat,
                                ParamType.Document,
                              ),
                              'chatRef': serializeParam(
                                widget.chat!.reference,
                                ParamType.DocumentReference,
                              ),
                            }.withoutNulls,
                            extra: <String, dynamic>{
                              'eventGroupChat': widget.chat,
                            },
                          );

                          if (_shouldSetState) setState(() {});
                          return;
                        } else {
                          groupChat3 =
                              await FFChatManager.instance.addGroupMembers(
                            widget.chat!,
                            [currentUserReference!],
                          );
                          _shouldSetState = true;

                          final chatMessagesCreateData =
                              createChatMessagesRecordData(
                            user: eventDetailsUsersRecord!.reference,
                            chat: widget.chat!.reference,
                            text:
                                'Automatic Message: New user has joined the event:',
                            timestamp: getCurrentTimestamp,
                          );
                          var chatMessagesRecordReference =
                              ChatMessagesRecord.collection.doc();
                          await chatMessagesRecordReference
                              .set(chatMessagesCreateData);
                          lastMessaged = ChatMessagesRecord.getDocumentFromData(
                              chatMessagesCreateData,
                              chatMessagesRecordReference);
                          _shouldSetState = true;

                          final chatsUpdateData = {
                            ...createChatsRecordData(
                              lastMessage: lastMessaged!.text,
                              lastMessageTime: lastMessaged!.timestamp,
                              lastMessageSentBy: lastMessaged!.user,
                            ),
                            'users':
                                FieldValue.arrayUnion([currentUserReference]),
                            'numUsers': FieldValue.increment(1),
                          };
                          await widget.event!.groupChatRef!
                              .update(chatsUpdateData);
                          await showDialog(
                            context: context,
                            builder: (alertDialogContext) {
                              return AlertDialog(
                                title: Text('You\'re in!'),
                                content: Text(
                                    'You\'ve successfully joined the event!'),
                                actions: [
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.pop(alertDialogContext),
                                    child: Text('Go to event group chat'),
                                  ),
                                ],
                              );
                            },
                          );

                          context.pushNamed(
                            'ChatPage',
                            queryParams: {
                              'eventGroupChat': serializeParam(
                                widget.chat,
                                ParamType.Document,
                              ),
                              'chatRef': serializeParam(
                                widget.event!.groupChatRef,
                                ParamType.DocumentReference,
                              ),
                            }.withoutNulls,
                            extra: <String, dynamic>{
                              'eventGroupChat': widget.chat,
                            },
                          );
                        }

                        final chatMessagesCreateData =
                            createChatMessagesRecordData(
                          user: eventDetailsUsersRecord!.reference,
                          chat: widget.event!.groupChatRef,
                          text: currentUserDisplayName,
                          timestamp: getCurrentTimestamp,
                        );
                        var chatMessagesRecordReference =
                            ChatMessagesRecord.collection.doc();
                        await chatMessagesRecordReference
                            .set(chatMessagesCreateData);
                        lastmessage2 = ChatMessagesRecord.getDocumentFromData(
                            chatMessagesCreateData,
                            chatMessagesRecordReference);
                        _shouldSetState = true;

                        final chatsUpdateData = createChatsRecordData(
                          lastMessage: lastmessage2!.text,
                          lastMessageTime: lastmessage2!.timestamp,
                          lastMessageSentBy: lastmessage2!.user,
                        );
                        await widget.event!.groupChatRef!
                            .update(chatsUpdateData);
                        if (_shouldSetState) setState(() {});
                      },
                      text: 'Join Event',
                      options: FFButtonOptions(
                        width: 300,
                        height: 60,
                        color: FlutterFlowTheme.of(context).primaryColor,
                        textStyle: FlutterFlowTheme.of(context).title3.override(
                              fontFamily: 'Overpass',
                              color: Colors.white,
                            ),
                        elevation: 3,
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                  ),
                  FFButtonWidget(
                    onPressed: () async {
                      _currentPageLink = await generateCurrentPageLink(
                        context,
                        title: 'Sports Event on QuickSports',
                        imageUrl:
                            'https://play-lh.googleusercontent.com/BHkCtTtpi9ZhxLXTG9tCxc_rVocRVtCYsOq0zNOkYKPQr5i7p0xloiKhlAXpKxk3PmA=s48-rw',
                        description: 'Check out this QuickSports Event!',
                      );

                      await Share.share(_currentPageLink);
                    },
                    text: 'Share Event',
                    icon: Icon(
                      Icons.ios_share,
                      size: 15,
                    ),
                    options: FFButtonOptions(
                      width: 300,
                      height: 60,
                      color: FlutterFlowTheme.of(context).secondaryColor,
                      textStyle: FlutterFlowTheme.of(context).title3.override(
                            fontFamily: 'Overpass',
                            color: FlutterFlowTheme.of(context).white,
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
            ));
      },
    );
  }
}
