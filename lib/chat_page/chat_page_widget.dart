import '../backend/backend.dart';
import '../flutter_flow/chat/index.dart';
import '../flutter_flow/flutter_flow_animations.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:share_plus/share_plus.dart';

class ChatPageWidget extends StatefulWidget {
  const ChatPageWidget({
    Key? key,
    this.chatUser,
    this.eventGroupChat,
    this.chatRef,
  }) : super(key: key);

  final UsersRecord? chatUser;
  final ChatsRecord? eventGroupChat;
  final DocumentReference? chatRef;

  @override
  _ChatPageWidgetState createState() => _ChatPageWidgetState();
}

class _ChatPageWidgetState extends State<ChatPageWidget>
    with TickerProviderStateMixin {
  FFChatInfo? _chatInfo;
  bool isGroupChat() {
    if (widget.chatUser == null) {
      return true;
    }
    if (widget.chatRef == null) {
      return false;
    }
    return _chatInfo?.isGroupChat ?? false;
  }

  final _unfocusNode = FocusNode();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    FFChatManager.instance
        .getChatInfo(
      otherUserRecord: widget.chatUser,
      chatReference: widget.chatRef,
    )
        .listen((info) {
      if (mounted) {
        setState(() => _chatInfo = info);
      }
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Title(
        title: 'ChatPage',
        color: FlutterFlowTheme.of(context).primaryColor,
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: Colors.white,
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(90),
            child: AppBar(
              backgroundColor: Colors.white,
              automaticallyImplyLeading: false,
              leading: FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 30,
                borderWidth: 1,
                buttonSize: 60,
                icon: Icon(
                  Icons.arrow_back_rounded,
                  color: Colors.black,
                  size: 24,
                ),
                onPressed: () async {
                  context.pop();
                },
              ),
              title: Container(
                height: 90,
                child: Stack(
                  children: [
                    if (!isGroupChat())
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 35, 0, 0),
                        child: InkWell(
                          onTap: () async {
                            context.pushNamed(
                              'peopleprofile',
                              queryParams: {
                                'peopleprofileparameter': serializeParam(
                                  widget.chatUser!.reference,
                                  ParamType.DocumentReference,
                                ),
                              }.withoutNulls,
                              extra: <String, dynamic>{
                                kTransitionInfoKey: TransitionInfo(
                                  hasTransition: true,
                                  transitionType: PageTransitionType.fade,
                                ),
                              },
                            );
                          },
                          child: Text(
                            widget.chatUser!.displayName!,
                            style:
                                FlutterFlowTheme.of(context).bodyText1.override(
                                      fontFamily: 'Lexend Deca',
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                          ),
                        ),
                      ),
                    if (isGroupChat())
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 35, 0, 0),
                        child: Text(
                          valueOrDefault<String>(
                            _chatInfo!.chatRecord.chatEventName,
                            'Group Chat',
                          ).maybeHandleOverflow(
                            maxChars: 22,
                            replacement: '…',
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyText1.override(
                                    fontFamily: 'Lexend Deca',
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                      ),
                    if (isGroupChat())
                      Align(
                        alignment: AlignmentDirectional(0, 0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 50, 0, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 7, 0),
                                child: Text(
                                  dateTimeFormat(
                                    'MMMEd',
                                    _chatInfo!.chatRecord.eventTimeStamp!,
                                    locale: FFLocalizations.of(context)
                                        .languageCode,
                                  ),
                                  textAlign: TextAlign.start,
                                  style: FlutterFlowTheme.of(context).bodyText1,
                                ),
                              ),
                              Text(
                                _chatInfo!.chatRecord.eventTime!,
                                textAlign: TextAlign.end,
                                style: FlutterFlowTheme.of(context).bodyText1,
                              ),
                              if (_chatInfo!.chatRecord.numUsers != null)
                                Text(
                                  '    Player Count: ',
                                  style: FlutterFlowTheme.of(context).bodyText1,
                                ),
                              Text(
                                _chatInfo!.chatRecord.numUsers!.toString(),
                                textAlign: TextAlign.start,
                                style: FlutterFlowTheme.of(context).bodyText1,
                              ),
                            ],
                          ),
                        ),
                      ),
                    if (isGroupChat() == true)
                      Align(
                        alignment: AlignmentDirectional(0.36, -1.83),
                        child: FlutterFlowIconButton(
                          borderColor: Colors.transparent,
                          borderRadius: 30,
                          borderWidth: 1,
                          buttonSize: 60,
                          icon: Icon(
                            Icons.ios_share,
                            color: FlutterFlowTheme.of(context).primaryText,
                            size: 30,
                          ),
                          onPressed: () async {
                            if (isAndroid == true) {
                              await Share.share(
                                  'https://play.google.com/store/apps/details?id=com.flutterflow.courts');
                            } else {
                              await Share.share(
                                  'https://apps.apple.com/us/app/quicksports/id1629551608');
                            }
                          },
                        ),
                      ),
                    if (isGroupChat() == true)
                      Align(
                        alignment: AlignmentDirectional(0.75, -1.83),
                        child: FlutterFlowIconButton(
                          borderColor: Colors.transparent,
                          borderRadius: 30,
                          borderWidth: 1,
                          buttonSize: 60,
                          icon: Icon(
                            Icons.people_outlined,
                            color: FlutterFlowTheme.of(context).primaryText,
                            size: 30,
                          ),
                          onPressed: () async {
                            context.pushNamed(
                              'groupChatPeopleList',
                              queryParams: {
                                'groupChat': serializeParam(
                                  _chatInfo!.chatRecord,
                                  ParamType.Document,
                                ),
                                'groupChatRef': serializeParam(
                                  _chatInfo!.chatRecord.reference,
                                  ParamType.DocumentReference,
                                ),
                              }.withoutNulls,
                              extra: <String, dynamic>{
                                'groupChat': _chatInfo!.chatRecord,
                              },
                            );
                          },
                        ),
                      ),
                    if (isGroupChat())
                      Align(
                        alignment: AlignmentDirectional(0.99, -0.95),
                        child: InkWell(
                          onTap: () async {
                            context.pushNamed(
                              'creategroupchatNOTNEWCopy',
                              queryParams: {
                                'specificChat2': serializeParam(
                                  _chatInfo!.chatRecord,
                                  ParamType.Document,
                                ),
                              }.withoutNulls,
                              extra: <String, dynamic>{
                                'specificChat2': _chatInfo!.chatRecord,
                              },
                            );
                          },
                          child: Icon(
                            Icons.person_add,
                            color: FlutterFlowTheme.of(context).primaryText,
                            size: 30,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
              actions: [],
              centerTitle: false,
              toolbarHeight: MediaQuery.of(context).size.height * 1,
              elevation: 2,
            ),
          ),
          body: SafeArea(
            child: GestureDetector(
              onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
              child: StreamBuilder<FFChatInfo>(
                stream: FFChatManager.instance.getChatInfo(
                  otherUserRecord: widget.chatUser,
                  chatReference: widget.chatRef,
                ),
                builder: (context, snapshot) => snapshot.hasData
                    ? FFChatPage(
                        chatInfo: snapshot.data!,
                        allowImages: true,
                        backgroundColor: Color(0xFFF2F4F8),
                        timeDisplaySetting: TimeDisplaySetting.visibleOnTap,
                        currentUserBoxDecoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            color: Colors.transparent,
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        otherUsersBoxDecoration: BoxDecoration(
                          color: Color(0xFFE25E5E),
                          border: Border.all(
                            color: Colors.transparent,
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        currentUserTextStyle: GoogleFonts.getFont(
                          'DM Sans',
                          color: Color(0xFF1E2429),
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          fontStyle: FontStyle.normal,
                        ),
                        otherUsersTextStyle: GoogleFonts.getFont(
                          'DM Sans',
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                        ),
                        inputHintTextStyle: GoogleFonts.getFont(
                          'DM Sans',
                          color: Color(0xFF95A1AC),
                          fontWeight: FontWeight.normal,
                          fontSize: 14,
                        ),
                        inputTextStyle: GoogleFonts.getFont(
                          'DM Sans',
                          color: Colors.black,
                          fontWeight: FontWeight.normal,
                          fontSize: 14,
                        ),
                        emptyChatWidget: Image.asset(
                          'assets/images/messagesEmpty@2x.png',
                          width: MediaQuery.of(context).size.width * 0.76,
                        ),
                      )
                    : Center(
                        child: SizedBox(
                          width: 50,
                          height: 50,
                          child: SpinKitRotatingCircle(
                            color: Color(0xFFF25454),
                            size: 50,
                          ),
                        ),
                      ),
              ),
            ),
          ),
        ));
  }
}
