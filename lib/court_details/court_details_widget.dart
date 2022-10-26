import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/rate_court_widget.dart';
import '../flutter_flow/chat/index.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class CourtDetailsWidget extends StatefulWidget {
  const CourtDetailsWidget({
    Key? key,
    this.court,
    this.eventGroupChat,
  }) : super(key: key);

  final CourtsRecord? court;
  final DocumentReference? eventGroupChat;

  @override
  _CourtDetailsWidgetState createState() => _CourtDetailsWidgetState();
}

class _CourtDetailsWidgetState extends State<CourtDetailsWidget> {
  ChatsRecord? groupChatPersonAdded;
  PageController? pageViewController;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      context.pushNamed('createAccount');
    });

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
              body: Column(
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
                                height: 320,
                                decoration: BoxDecoration(
                                  color:
                                      FlutterFlowTheme.of(context).background,
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
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
                                          icon: Icon(
                                            Icons.arrow_back_rounded,
                                            color: FlutterFlowTheme.of(context)
                                                .white,
                                            size: 20,
                                          ),
                                          onPressed: () async {
                                            context.pop();
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
                            padding:
                                EdgeInsetsDirectional.fromSTEB(15, 16, 15, 0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      widget.court!.name!,
                                      style:
                                          FlutterFlowTheme.of(context).title2,
                                    ),
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Text(
                                          'Overall',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText1,
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 0, 4, 0),
                                              child: Text(
                                                '5',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .title3,
                                              ),
                                            ),
                                            Icon(
                                              Icons.sports_basketball_outlined,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryColor,
                                              size: 24,
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
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Expanded(
                                        child: Text(
                                          widget.court!.sportname!,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText1,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 12, 0, 44),
                                  child: StreamBuilder<List<EventsRecord>>(
                                    stream: queryEventsRecord(
                                      queryBuilder: (eventsRecord) =>
                                          eventsRecord
                                              .where('locationname',
                                                  isEqualTo: widget.court!.name)
                                              .orderBy('date'),
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
                                        shrinkWrap: true,
                                        scrollDirection: Axis.vertical,
                                        itemCount:
                                            listViewEventsRecordList.length,
                                        itemBuilder: (context, listViewIndex) {
                                          final listViewEventsRecord =
                                              listViewEventsRecordList[
                                                  listViewIndex];
                                          return Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    16, 4, 16, 8),
                                            child: Container(
                                              width: double.infinity,
                                              height: 150,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryColor,
                                                boxShadow: [
                                                  BoxShadow(
                                                    blurRadius: 4,
                                                    color: Color(0x32000000),
                                                    offset: Offset(0, 2),
                                                  )
                                                ],
                                                borderRadius:
                                                    BorderRadius.circular(14),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(8, 0, 8, 0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Expanded(
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(12, 0,
                                                                    0, 0),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Text(
                                                                  listViewEventsRecord
                                                                      .time!,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyText1
                                                                      .override(
                                                                        fontFamily:
                                                                            'Overpass',
                                                                        color: Colors
                                                                            .white,
                                                                        fontSize:
                                                                            25,
                                                                      ),
                                                                ),
                                                              ],
                                                            ),
                                                            Text(
                                                              listViewEventsRecord
                                                                  .date!,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyText2
                                                                  .override(
                                                                    fontFamily:
                                                                        'Overpass',
                                                                    color: Color(
                                                                        0xFF616A6D),
                                                                  ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                    FFButtonWidget(
                                                      onPressed: () async {
                                                        groupChatPersonAdded =
                                                            await FFChatManager
                                                                .instance
                                                                .addGroupMembers(
                                                          groupChatPersonAdded!,
                                                          [
                                                            currentUserReference!
                                                          ],
                                                        );

                                                        context.pushNamed(
                                                          'ChatPage',
                                                          queryParams: {
                                                            'eventGroupChat':
                                                                serializeParam(
                                                              listViewEventsRecord
                                                                  .groupchat,
                                                              ParamType
                                                                  .DocumentReference,
                                                            ),
                                                          }.withoutNulls,
                                                        );

                                                        setState(() {});
                                                      },
                                                      text: 'Join Event',
                                                      options: FFButtonOptions(
                                                        width: 100,
                                                        height: 36,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryColor,
                                                        textStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyText1
                                                                .override(
                                                                  fontFamily:
                                                                      'Outfit',
                                                                  color: Colors
                                                                      .white,
                                                                  fontSize: 14,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                ),
                                                        borderSide: BorderSide(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .white,
                                                          width: 1,
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
                              ],
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.96,
                              height: 200,
                              decoration: BoxDecoration(),
                              child: Container(
                                width: double.infinity,
                                height: MediaQuery.of(context).size.height * 1,
                                child: Stack(
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 0, 20),
                                      child: PageView(
                                        controller: pageViewController ??=
                                            PageController(initialPage: 0),
                                        scrollDirection: Axis.horizontal,
                                        children: [
                                          Container(),
                                        ],
                                      ),
                                    ),
                                    Align(
                                      alignment: AlignmentDirectional(0, 1),
                                      child: smooth_page_indicator
                                          .SmoothPageIndicator(
                                        controller: pageViewController ??=
                                            PageController(initialPage: 0),
                                        count: 1,
                                        axisDirection: Axis.horizontal,
                                        onDotClicked: (i) {
                                          pageViewController!.animateToPage(
                                            i,
                                            duration:
                                                Duration(milliseconds: 500),
                                            curve: Curves.ease,
                                          );
                                        },
                                        effect: smooth_page_indicator
                                            .ExpandingDotsEffect(
                                          expansionFactor: 2,
                                          spacing: 8,
                                          radius: 16,
                                          dotWidth: 16,
                                          dotHeight: 4,
                                          dotColor: FlutterFlowTheme.of(context)
                                              .grayLines,
                                          activeDotColor:
                                              FlutterFlowTheme.of(context)
                                                  .grayDark,
                                          paintStyle: PaintingStyle.fill,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
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
                                await showModalBottomSheet(
                                  isScrollControlled: true,
                                  context: context,
                                  builder: (context) {
                                    return Padding(
                                      padding:
                                          MediaQuery.of(context).viewInsets,
                                      child: Container(
                                        height: 584,
                                        child: RateCourtWidget(
                                          court: widget.court,
                                        ),
                                      ),
                                    );
                                  },
                                ).then((value) => setState(() {}));
                              },
                              text: 'Rate',
                              icon: Icon(
                                Icons.star_rate_rounded,
                                size: 15,
                              ),
                              options: FFButtonOptions(
                                width: 150,
                                height: 50,
                                color:
                                    FlutterFlowTheme.of(context).secondaryColor,
                                textStyle: FlutterFlowTheme.of(context)
                                    .bodyText2
                                    .override(
                                      fontFamily: 'Overpass',
                                      color: FlutterFlowTheme.of(context).white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(12),
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
                                    'createeventpage': courtDetailsCourtsRecord,
                                  },
                                );
                              },
                              text: 'Create Event',
                              icon: Icon(
                                Icons.sports_soccer,
                                size: 15,
                              ),
                              options: FFButtonOptions(
                                width: 150,
                                height: 50,
                                color:
                                    FlutterFlowTheme.of(context).primaryColor,
                                textStyle: FlutterFlowTheme.of(context)
                                    .bodyText2
                                    .override(
                                      fontFamily: 'Overpass',
                                      color: FlutterFlowTheme.of(context).white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                          ],
                        ),
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
