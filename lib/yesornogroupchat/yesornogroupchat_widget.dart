import '../backend/backend.dart';
import '../chat_page/chat_page_widget.dart';
import '../flutter_flow/chat/index.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class YesornogroupchatWidget extends StatefulWidget {
  const YesornogroupchatWidget({
    Key? key,
    this.eventGroupChat,
    this.specificChat,
  }) : super(key: key);

  final EventsRecord? eventGroupChat;
  final ChatsRecord? specificChat;

  @override
  _YesornogroupchatWidgetState createState() => _YesornogroupchatWidgetState();
}

class _YesornogroupchatWidgetState extends State<YesornogroupchatWidget> {
  ChatsRecord? groupChat;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<UsersRecord>>(
      stream: queryUsersRecord(
        queryBuilder: (usersRecord) =>
            usersRecord.where('zips', isEqualTo: '738492929256'),
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
        List<UsersRecord> yesornogroupchatUsersRecordList = snapshot.data!;
        return Title(
            title: 'yesornogroupchat',
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
                  'Do you want to create a group chat?',
                  style: FlutterFlowTheme.of(context).title2.override(
                        fontFamily: 'Overpass',
                        color: Colors.white,
                        fontSize: 18,
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
                      FFButtonWidget(
                        onPressed: () async {
                          groupChat = await FFChatManager.instance.createChat(
                            yesornogroupchatUsersRecordList
                                .where((e) => e != null)
                                .toList()
                                .map((e) => e.reference)
                                .toList(),
                          );
                          context.pushNamed(
                            'ChatPage',
                            queryParams: {
                              'chatRef': serializeParam(
                                groupChat?.reference,
                                ParamType.DocumentReference,
                              ),
                            }.withoutNulls,
                          );

                          setState(() {});
                        },
                        text: 'No',
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
                      FFButtonWidget(
                        onPressed: () async {
                          context.pushNamed(
                            'creategroupchatNOTNEW',
                            queryParams: {
                              'groupChatForEventCreate': serializeParam(
                                widget.eventGroupChat,
                                ParamType.Document,
                              ),
                            }.withoutNulls,
                            extra: <String, dynamic>{
                              'groupChatForEventCreate': widget.eventGroupChat,
                            },
                          );
                        },
                        text: 'Yes',
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
