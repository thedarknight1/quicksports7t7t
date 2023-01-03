import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../backend/firebase_storage/storage.dart';
import '../components/select_sports_widget.dart';
import '../flutter_flow/flutter_flow_ad_banner.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_place_picker.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/place.dart';
import '../flutter_flow/upload_media.dart';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class AddCourtWidget extends StatefulWidget {
  const AddCourtWidget({
    Key? key,
    this.listSports,
    this.isSportConfirmed,
  }) : super(key: key);

  final List<String>? listSports;
  final bool? isSportConfirmed;

  @override
  _AddCourtWidgetState createState() => _AddCourtWidgetState();
}

class _AddCourtWidgetState extends State<AddCourtWidget> {
  bool isMediaUploading = false;
  String uploadedFileUrl = '';

  CourtsRecord? createdCourt;
  List<String>? selectedSportsList;
  var placePickerValue = FFPlace();
  TextEditingController? textController;
  bool? checkboxListTileValue1;
  bool? checkboxListTileValue2;
  final _unfocusNode = FocusNode();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    textController = TextEditingController();
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _unfocusNode.dispose();
    textController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Title(
        title: 'addCourt',
        color: FlutterFlowTheme.of(context).primaryColor,
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).white,
          appBar: AppBar(
            backgroundColor: FlutterFlowTheme.of(context).white,
            automaticallyImplyLeading: false,
            leading: FlutterFlowIconButton(
              borderColor: Colors.transparent,
              borderRadius: 30,
              buttonSize: 48,
              icon: Icon(
                Icons.chevron_left_rounded,
                color: FlutterFlowTheme.of(context).darkBG,
                size: 30,
              ),
              onPressed: () async {
                context.pop();
              },
            ),
            title: Text(
              'Add Sports Location',
              style: FlutterFlowTheme.of(context).title3,
            ),
            actions: [],
            centerTitle: false,
            elevation: 0,
          ),
          body: SafeArea(
            child: GestureDetector(
              onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
              child: Stack(
                children: [
                  SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width,
                              height: 150,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context).background,
                              ),
                              child: InkWell(
                                onTap: () async {
                                  final selectedMedia =
                                      await selectMediaWithSourceBottomSheet(
                                    context: context,
                                    allowPhoto: true,
                                    backgroundColor:
                                        FlutterFlowTheme.of(context)
                                            .secondaryColor,
                                    textColor: FlutterFlowTheme.of(context)
                                        .primaryColor,
                                    pickerFontFamily: 'Overpass',
                                  );
                                  if (selectedMedia != null &&
                                      selectedMedia.every((m) =>
                                          validateFileFormat(
                                              m.storagePath, context))) {
                                    setState(() => isMediaUploading = true);
                                    var downloadUrls = <String>[];
                                    try {
                                      showUploadMessage(
                                        context,
                                        'Uploading file...',
                                        showLoading: true,
                                      );
                                      downloadUrls = (await Future.wait(
                                        selectedMedia.map(
                                          (m) async => await uploadData(
                                              m.storagePath, m.bytes),
                                        ),
                                      ))
                                          .where((u) => u != null)
                                          .map((u) => u!)
                                          .toList();
                                    } finally {
                                      ScaffoldMessenger.of(context)
                                          .hideCurrentSnackBar();
                                      isMediaUploading = false;
                                    }
                                    if (downloadUrls.length ==
                                        selectedMedia.length) {
                                      setState(() =>
                                          uploadedFileUrl = downloadUrls.first);
                                      showUploadMessage(context, 'Success!');
                                    } else {
                                      setState(() {});
                                      showUploadMessage(
                                          context, 'Failed to upload media');
                                      return;
                                    }
                                  }
                                },
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(50),
                                  child: Image.asset(
                                    'assets/images/coverEmpty@3x.png',
                                    width: 100,
                                    height: 100,
                                    fit: BoxFit.cover,
                                  ),
                                ),
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
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0, 12, 0, 10),
                                child: FlutterFlowPlacePicker(
                                  iOSGoogleMapsApiKey:
                                      'AIzaSyAGk8Fbi0rIS8maUISU8sWikpT165FsKN4',
                                  androidGoogleMapsApiKey:
                                      'AIzaSyC84PQmU5pu7qlhZx7Jd7JK8n9UrKwJS0I',
                                  webGoogleMapsApiKey:
                                      'AIzaSyBo0_19J2azpByvyhEokEmvu3oAt5qRVfo',
                                  onSelect: (place) async {
                                    setState(() => placePickerValue = place);
                                  },
                                  defaultText: 'Set Location',
                                  icon: Icon(
                                    Icons.place,
                                    color:
                                        FlutterFlowTheme.of(context).iconGray,
                                    size: 24,
                                  ),
                                  buttonOptions: FFButtonOptions(
                                    width: 200,
                                    height: 50,
                                    color:
                                        FlutterFlowTheme.of(context).background,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .title3
                                        .override(
                                          fontFamily: 'Overpass',
                                          color: FlutterFlowTheme.of(context)
                                              .iconGray,
                                          fontWeight: FontWeight.normal,
                                        ),
                                    borderSide: BorderSide(
                                      color: Colors.transparent,
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    await showModalBottomSheet(
                                      isScrollControlled: true,
                                      backgroundColor: Colors.transparent,
                                      context: context,
                                      builder: (context) {
                                        return Padding(
                                          padding:
                                              MediaQuery.of(context).viewInsets,
                                          child: Container(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                1,
                                            child: SelectSportsWidget(),
                                          ),
                                        );
                                      },
                                    ).then((value) => setState(
                                        () => selectedSportsList = value));

                                    setState(() {});
                                  },
                                  text: valueOrDefault<String>(
                                    selectedSportsList?.length != null
                                        ? 'Sport(s) confirmed'
                                        : 'Select Sport(s)',
                                    'Select Sport(s)',
                                  ),
                                  options: FFButtonOptions(
                                    width: 200,
                                    height: 50,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryColor,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .subtitle2
                                        .override(
                                          fontFamily: 'Overpass',
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.normal,
                                        ),
                                    borderSide: BorderSide(
                                      color: Colors.transparent,
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 0, 15),
                                child: TextFormField(
                                  controller: textController,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelText: 'Description',
                                    labelStyle: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'Overpass',
                                          color: FlutterFlowTheme.of(context)
                                              .iconGray,
                                          fontSize: 15,
                                        ),
                                    hintText: 'Description...',
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .grayLines,
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .grayLines,
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
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Overpass',
                                        color:
                                            FlutterFlowTheme.of(context).darkBG,
                                        fontSize: 15,
                                      ),
                                  maxLines: 2,
                                  keyboardType: TextInputType.multiline,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    70, 0, 70, 10),
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
                                    value: checkboxListTileValue1 ??= false,
                                    onChanged: (newValue) async {
                                      setState(() =>
                                          checkboxListTileValue1 = newValue!);
                                    },
                                    title: Text(
                                      'Is Indoor',
                                      style:
                                          FlutterFlowTheme.of(context).title3,
                                    ),
                                    tileColor: Color(0xFFF5F5F5),
                                    activeColor: FlutterFlowTheme.of(context)
                                        .primaryColor,
                                    dense: false,
                                    controlAffinity:
                                        ListTileControlAffinity.trailing,
                                    contentPadding:
                                        EdgeInsetsDirectional.fromSTEB(
                                            20, 0, 10, 0),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    70, 0, 70, 10),
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
                                    value: checkboxListTileValue2 ??= false,
                                    onChanged: (newValue) async {
                                      setState(() =>
                                          checkboxListTileValue2 = newValue!);
                                    },
                                    title: Text(
                                      'Paid Location',
                                      style:
                                          FlutterFlowTheme.of(context).title3,
                                    ),
                                    tileColor: Color(0xFFF5F5F5),
                                    activeColor: FlutterFlowTheme.of(context)
                                        .primaryColor,
                                    dense: false,
                                    controlAffinity:
                                        ListTileControlAffinity.trailing,
                                    contentPadding:
                                        EdgeInsetsDirectional.fromSTEB(
                                            20, 0, 10, 0),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context).white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: FlutterFlowTheme.of(context)
                                          .grayLines,
                                      offset: Offset(0, 0),
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 0, 40),
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    if ((selectedSportsList!.length >= 1) &&
                                        (placePickerValue.zipCode != null &&
                                            placePickerValue.zipCode != '')) {
                                      final courtsCreateData = {
                                        ...createCourtsRecordData(
                                          name: placePickerValue.name,
                                          location: placePickerValue.latLng,
                                          createdAt: getCurrentTimestamp,
                                          user: currentUserReference,
                                          description: textController!.text,
                                          likes: 0,
                                          imageUrl: uploadedFileUrl,
                                          isIndoor: checkboxListTileValue1,
                                          address: placePickerValue.address,
                                          city: placePickerValue.city,
                                          state: placePickerValue.state,
                                          country: placePickerValue.country,
                                          zipcode: placePickerValue.zipCode,
                                        ),
                                        'sportList': selectedSportsList,
                                      };
                                      var courtsRecordReference =
                                          CourtsRecord.collection.doc();
                                      await courtsRecordReference
                                          .set(courtsCreateData);
                                      createdCourt =
                                          CourtsRecord.getDocumentFromData(
                                              courtsCreateData,
                                              courtsRecordReference);

                                      context.pushNamed(
                                        'courtAddedSuccess',
                                        queryParams: {
                                          'newlyCreatedCourt': serializeParam(
                                            createdCourt,
                                            ParamType.Document,
                                          ),
                                        }.withoutNulls,
                                        extra: <String, dynamic>{
                                          'newlyCreatedCourt': createdCourt,
                                        },
                                      );
                                    } else {
                                      await showDialog(
                                        context: context,
                                        builder: (alertDialogContext) {
                                          return AlertDialog(
                                            title: Text(
                                                'Please select a sport and a location'),
                                            content: Text(
                                                'Please fill the sport field and set location'),
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
                                  text: 'Add Sports Location',
                                  icon: Icon(
                                    Icons.sports_basketball_outlined,
                                    size: 15,
                                  ),
                                  options: FFButtonOptions(
                                    width: 290,
                                    height: 50,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryColor,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .title3
                                        .override(
                                          fontFamily: 'Overpass',
                                          color: FlutterFlowTheme.of(context)
                                              .white,
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
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Align(
                        alignment: AlignmentDirectional(0, 1),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Expanded(
                              child: Align(
                                alignment: AlignmentDirectional(0, 1),
                                child: FlutterFlowAdBanner(
                                  width: MediaQuery.of(context).size.width,
                                  height: 50,
                                  showsTestAd: true,
                                  iOSAdUnitID:
                                      'ca-app-pub-4806655917667448/9378133352',
                                  androidAdUnitID:
                                      'ca-app-pub-4806655917667448/9955636287',
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
  }
}
