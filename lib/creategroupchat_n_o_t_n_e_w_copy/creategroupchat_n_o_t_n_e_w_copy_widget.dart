import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/chat/index.dart';
import '../flutter_flow/flutter_flow_ad_banner.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class CreategroupchatNOTNEWCopyWidget extends StatefulWidget {
  const CreategroupchatNOTNEWCopyWidget({
    Key? key,
    this.groupChatForEventCreate,
    this.specificChat2,
  }) : super(key: key);

  final EventsRecord? groupChatForEventCreate;
  final ChatsRecord? specificChat2;

  @override
  _CreategroupchatNOTNEWCopyWidgetState createState() =>
      _CreategroupchatNOTNEWCopyWidgetState();
}

class _CreategroupchatNOTNEWCopyWidgetState
    extends State<CreategroupchatNOTNEWCopyWidget> {
  Map<UsersRecord, bool> checkboxListTileValueMap = {};
  List<UsersRecord> get checkboxListTileCheckedItems =>
      checkboxListTileValueMap.entries
          .where((e) => e.value)
          .map((e) => e.key)
          .toList();

  List<UsersRecord>? algoliaSearchResults = [];
  TextEditingController? textController;
  ChatMessagesRecord? lastChat2;
  ChatMessagesRecord? lastChat;
  ChatsRecord? groupChatfromAddGroupPage;
  ChatsRecord? groupChatfromAddGroupPage2;
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
    return Title(
        title: 'creategroupchatNOTNEWCopy',
        color: FlutterFlowTheme.of(context).primaryColor,
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: Color(0xFFF1F4F8),
          appBar: AppBar(
            backgroundColor: Colors.white,
            automaticallyImplyLeading: false,
            leading: FlutterFlowIconButton(
              borderColor: Colors.transparent,
              borderRadius: 30,
              buttonSize: 24,
              icon: Icon(
                Icons.arrow_back_rounded,
                color: Color(0xFF95A1AC),
                size: 24,
              ),
              onPressed: () async {
                context.pop();
              },
            ),
            title: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Add People to Group Chat',
                  style: FlutterFlowTheme.of(context).subtitle1.override(
                        fontFamily: 'Lexend Deca',
                        color: Color(0xFF95A1AC),
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                ),
              ],
            ),
            actions: [],
            centerTitle: false,
            elevation: 0,
          ),
          body: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Stack(
              children: [
                FutureBuilder<List<EventsRecord>>(
                  future: queryEventsRecordOnce(
                    queryBuilder: (eventsRecord) => eventsRecord.where(
                        'groupChatRef',
                        isEqualTo: widget.specificChat2!.reference),
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
                    List<EventsRecord> columnEventsRecordList = snapshot.data!;
                    final columnEventsRecord = columnEventsRecordList.isNotEmpty
                        ? columnEventsRecordList.first
                        : null;
                    return Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          width: double.infinity,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Color(0xFFDBE2E7),
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 3,
                                color: Color(0x33000000),
                                offset: Offset(0, 2),
                              )
                            ],
                            borderRadius: BorderRadius.circular(0),
                          ),
                          alignment: AlignmentDirectional(0, 0),
                          child: TextFormField(
                            controller: textController,
                            onChanged: (_) => EasyDebounce.debounce(
                              'textController',
                              Duration(milliseconds: 2000),
                              () async {
                                setState(() => algoliaSearchResults = null);
                                await UsersRecord.search(
                                  term: textController!.text,
                                )
                                    .then((r) => algoliaSearchResults = r)
                                    .onError(
                                        (_, __) => algoliaSearchResults = [])
                                    .whenComplete(() => setState(() {}));
                              },
                            ),
                            obscureText: false,
                            decoration: InputDecoration(
                              labelText:
                                  'Search users with display name or username...',
                              hintStyle: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Lexend Deca',
                                    color: Color(0xFF95A1AC),
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                  ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 1,
                                ),
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(4.0),
                                  topRight: Radius.circular(4.0),
                                ),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
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
                                  EdgeInsetsDirectional.fromSTEB(24, 14, 0, 0),
                              prefixIcon: Icon(
                                Icons.search_outlined,
                                color: Color(0xFF95A1AC),
                                size: 24,
                              ),
                            ),
                            style:
                                FlutterFlowTheme.of(context).bodyText1.override(
                                      fontFamily: 'Lexend Deca',
                                      color: Color(0xFF95A1AC),
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal,
                                    ),
                          ),
                        ),
                        Expanded(
                          child: Builder(
                            builder: (context) {
                              if (algoliaSearchResults == null) {
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
                              final algoliaResults = algoliaSearchResults!
                                  .toList()
                                  .take(20)
                                  .toList();
                              return ListView.builder(
                                padding: EdgeInsets.zero,
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemCount: algoliaResults.length,
                                itemBuilder: (context, algoliaResultsIndex) {
                                  final algoliaResultsItem =
                                      algoliaResults[algoliaResultsIndex];
                                  return Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 0, 2),
                                    child: Container(
                                      width: double.infinity,
                                      height: 70,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        boxShadow: [
                                          BoxShadow(
                                            blurRadius: 0,
                                            color: Color(0xFFDBE2E7),
                                            offset: Offset(0, 2),
                                          )
                                        ],
                                        borderRadius: BorderRadius.circular(0),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            8, 0, 0, 0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Card(
                                              clipBehavior:
                                                  Clip.antiAliasWithSaveLayer,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryColor,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(40),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(2, 2, 2, 2),
                                                child: Container(
                                                  width: 50,
                                                  height: 50,
                                                  clipBehavior: Clip.antiAlias,
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                  ),
                                                  child: Image.network(
                                                    valueOrDefault<String>(
                                                      algoliaResultsItem
                                                          .photoUrl,
                                                      'https://t4.ftcdn.net/jpg/00/64/67/63/360_F_64676383_LdbmhiNM6Ypzb3FM4PPuFP9rHe7ri8Ju.jpg',
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(2, 0, 0, 0),
                                                child: Theme(
                                                  data: ThemeData(
                                                    checkboxTheme:
                                                        CheckboxThemeData(
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(25),
                                                      ),
                                                    ),
                                                    unselectedWidgetColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .secondaryColor,
                                                  ),
                                                  child: CheckboxListTile(
                                                    value: checkboxListTileValueMap[
                                                            algoliaResultsItem] ??=
                                                        false,
                                                    onChanged:
                                                        (newValue) async {
                                                      setState(() =>
                                                          checkboxListTileValueMap[
                                                                  algoliaResultsItem] =
                                                              newValue!);
                                                    },
                                                    title: Text(
                                                      algoliaResultsItem
                                                          .displayName!,
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .subtitle1
                                                          .override(
                                                            fontFamily:
                                                                'Lexend Deca',
                                                            color: Color(
                                                                0xFF95A1AC),
                                                            fontSize: 18,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          ),
                                                    ),
                                                    subtitle: Text(
                                                      algoliaResultsItem
                                                          .username!,
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyText2
                                                              .override(
                                                                fontFamily:
                                                                    'Lexend Deca',
                                                                color: Color(
                                                                    0xFF1A1F24),
                                                                fontSize: 14,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                              ),
                                                    ),
                                                    tileColor:
                                                        Color(0xFFF5F5F5),
                                                    activeColor:
                                                        Color(0xFF4E39F9),
                                                    dense: false,
                                                    controlAffinity:
                                                        ListTileControlAffinity
                                                            .trailing,
                                                  ),
                                                ),
                                              ),
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
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 80),
                          child: StreamBuilder<List<UsersRecord>>(
                            stream: queryUsersRecord(
                              queryBuilder: (usersRecord) => usersRecord.where(
                                  'uid',
                                  isEqualTo: 'kurTAlbhyqV5yBwoZJmO2QIp6jy2'),
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
                              List<UsersRecord> buttonUsersRecordList =
                                  snapshot.data!;
                              final buttonUsersRecord =
                                  buttonUsersRecordList.isNotEmpty
                                      ? buttonUsersRecordList.first
                                      : null;
                              return FFButtonWidget(
                                onPressed: () async {
                                  if (checkboxListTileCheckedItems.length >=
                                      1) {
                                    if (columnEventsRecord != null) {
                                      groupChatfromAddGroupPage =
                                          await FFChatManager.instance
                                              .addGroupMembers(
                                        widget.specificChat2!,
                                        checkboxListTileCheckedItems
                                            .where((e) => e != null)
                                            .toList()
                                            .map((e) => e.reference)
                                            .toList(),
                                      );

                                      final chatMessagesCreateData =
                                          createChatMessagesRecordData(
                                        user: buttonUsersRecord!.reference,
                                        chat: widget.specificChat2!.reference,
                                        text:
                                            'New user(s) have been added to this chat.',
                                        timestamp: getCurrentTimestamp,
                                      );
                                      var chatMessagesRecordReference =
                                          ChatMessagesRecord.collection.doc();
                                      await chatMessagesRecordReference
                                          .set(chatMessagesCreateData);
                                      lastChat = ChatMessagesRecord
                                          .getDocumentFromData(
                                              chatMessagesCreateData,
                                              chatMessagesRecordReference);

                                      final chatsUpdateData = {
                                        ...createChatsRecordData(
                                          lastMessage: lastChat!.text,
                                          lastMessageTime: lastChat!.timestamp,
                                          lastMessageSentBy: lastChat!.user,
                                        ),
                                        'numUsers': FieldValue.increment(
                                            checkboxListTileCheckedItems
                                                .length),
                                      };
                                      await columnEventsRecord!.groupChatRef!
                                          .update(chatsUpdateData);
                                      if (Navigator.of(context).canPop()) {
                                        context.pop();
                                      }
                                      context.pushNamed(
                                        'ChatPage',
                                        queryParams: {
                                          'eventGroupChat': serializeParam(
                                            groupChatfromAddGroupPage,
                                            ParamType.Document,
                                          ),
                                          'chatRef': serializeParam(
                                            columnEventsRecord!.groupChatRef,
                                            ParamType.DocumentReference,
                                          ),
                                        }.withoutNulls,
                                        extra: <String, dynamic>{
                                          'eventGroupChat':
                                              groupChatfromAddGroupPage,
                                        },
                                      );
                                    } else {
                                      groupChatfromAddGroupPage2 =
                                          await FFChatManager.instance
                                              .addGroupMembers(
                                        widget.specificChat2!,
                                        checkboxListTileCheckedItems
                                            .where((e) => e != null)
                                            .toList()
                                            .map((e) => e.reference)
                                            .toList(),
                                      );

                                      final chatMessagesCreateData =
                                          createChatMessagesRecordData(
                                        user: buttonUsersRecord!.reference,
                                        chat: groupChatfromAddGroupPage2!
                                            .reference,
                                        text:
                                            'New user(s) have been added to this chat.',
                                        timestamp: getCurrentTimestamp,
                                      );
                                      var chatMessagesRecordReference =
                                          ChatMessagesRecord.collection.doc();
                                      await chatMessagesRecordReference
                                          .set(chatMessagesCreateData);
                                      lastChat2 = ChatMessagesRecord
                                          .getDocumentFromData(
                                              chatMessagesCreateData,
                                              chatMessagesRecordReference);

                                      final chatsUpdateData =
                                          createChatsRecordData(
                                        lastMessage: lastChat2!.text,
                                        lastMessageSentBy: lastChat2!.user,
                                        lastMessageTime: lastChat2!.timestamp,
                                      );
                                      await widget.specificChat2!.reference
                                          .update(chatsUpdateData);
                                      if (Navigator.of(context).canPop()) {
                                        context.pop();
                                      }
                                      context.pushNamed(
                                        'ChatPage',
                                        queryParams: {
                                          'eventGroupChat': serializeParam(
                                            widget.specificChat2,
                                            ParamType.Document,
                                          ),
                                          'chatRef': serializeParam(
                                            widget.specificChat2!.reference,
                                            ParamType.DocumentReference,
                                          ),
                                        }.withoutNulls,
                                        extra: <String, dynamic>{
                                          'eventGroupChat':
                                              widget.specificChat2,
                                        },
                                      );
                                    }
                                  } else {
                                    await showDialog(
                                      context: context,
                                      builder: (alertDialogContext) {
                                        return AlertDialog(
                                          title: Text(
                                              'Please select atleast one user to add.'),
                                          content: Text(
                                              'Please select atleast one user to add.'),
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
                                text: 'Add to Chat',
                                options: FFButtonOptions(
                                  width: 250,
                                  height: 60,
                                  color:
                                      FlutterFlowTheme.of(context).primaryColor,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .title3
                                      .override(
                                        fontFamily: 'Lexend Deca',
                                        color: Colors.white,
                                        fontSize: 24,
                                        fontWeight: FontWeight.normal,
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
                        ),
                      ],
                    );
                  },
                ),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                          child: Align(
                            alignment: AlignmentDirectional(0, 1),
                            child: FlutterFlowAdBanner(
                              width: MediaQuery.of(context).size.width,
                              height: 50,
                              showsTestAd: false,
                              iOSAdUnitID:
                                  'ca-app-pub-4806655917667448/8166221515',
                              androidAdUnitID:
                                  'ca-app-pub-4806655917667448/6819396544',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
