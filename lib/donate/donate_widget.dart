import '../backend/braintree/payment_manager.dart';
import '../flutter_flow/flutter_flow_credit_card_form.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class DonateWidget extends StatefulWidget {
  const DonateWidget({Key? key}) : super(key: key);

  @override
  _DonateWidgetState createState() => _DonateWidgetState();
}

class _DonateWidgetState extends State<DonateWidget> {
  String? transactionId2;
  String? transactionId;
  TextEditingController? textController;
  bool? checkboxListTileValue1;
  final creditCardFormKey = GlobalKey<FormState>();
  CreditCardModel creditCardInfo = emptyCreditCard();
  double? sliderValue;
  bool? checkboxListTileValue2;
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
        title: 'donate',
        color: FlutterFlowTheme.of(context).primaryColor,
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          appBar: AppBar(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            automaticallyImplyLeading: false,
            leading: FlutterFlowIconButton(
              borderColor: Colors.transparent,
              borderRadius: 30,
              borderWidth: 1,
              buttonSize: 60,
              icon: Icon(
                Icons.arrow_back_rounded,
                color: FlutterFlowTheme.of(context).primaryText,
                size: 30,
              ),
              onPressed: () async {
                context.pop();
              },
            ),
            title: Text(
              'Donate',
              style: FlutterFlowTheme.of(context).bodyText1.override(
                    fontFamily: 'Overpass',
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            actions: [],
            centerTitle: true,
            elevation: 0,
          ),
          body: SafeArea(
            child: GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                    child: Slider.adaptive(
                      activeColor: FlutterFlowTheme.of(context).primaryColor,
                      inactiveColor: Color(0xFF9E9E9E),
                      min: 1,
                      max: 100,
                      value: sliderValue ??= 10,
                      onChanged: (newValue) {
                        setState(() => sliderValue = newValue);
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 5,
                            color: Color(0x44111417),
                            offset: Offset(0, 2),
                          )
                        ],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(4, 4, 4, 4),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(8, 4, 8, 4),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 2, 0, 0),
                                    child: Icon(
                                      Icons.credit_card_rounded,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      size: 24,
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          12, 0, 0, 0),
                                      child: Theme(
                                        data: ThemeData(
                                          checkboxTheme: CheckboxThemeData(
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(25),
                                            ),
                                          ),
                                          unselectedWidgetColor:
                                              Color(0xFF95A1AC),
                                        ),
                                        child: CheckboxListTile(
                                          value: checkboxListTileValue1 ??=
                                              true,
                                          onChanged: (newValue) async {
                                            setState(() =>
                                                checkboxListTileValue1 =
                                                    newValue!);
                                          },
                                          title: Text(
                                            'Credit Card',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1,
                                          ),
                                          tileColor: Color(0xFFF5F5F5),
                                          activeColor:
                                              FlutterFlowTheme.of(context)
                                                  .primaryColor,
                                          dense: true,
                                          controlAffinity:
                                              ListTileControlAffinity.trailing,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            if (checkboxListTileValue1 != null)
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    12, 8, 12, 0),
                                child: TextFormField(
                                  controller: textController,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelText: 'Your Name',
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .lineColor,
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .lineColor,
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    filled: true,
                                    fillColor: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                  ),
                                  style: FlutterFlowTheme.of(context).bodyText1,
                                  maxLines: null,
                                ),
                              ),
                            if (checkboxListTileValue1 != null)
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    12, 0, 12, 0),
                                child: FlutterFlowCreditCardForm(
                                  formKey: creditCardFormKey,
                                  creditCardModel: creditCardInfo,
                                  obscureNumber: true,
                                  obscureCvv: false,
                                  spacing: 10,
                                  textStyle:
                                      FlutterFlowTheme.of(context).bodyText1,
                                  inputDecoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .lineColor,
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .lineColor,
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 5,
                            color: Color(0x44111417),
                            offset: Offset(0, 2),
                          )
                        ],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(4, 4, 4, 4),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(8, 4, 8, 4),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 2, 0, 0),
                                    child: FaIcon(
                                      FontAwesomeIcons.ccPaypal,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      size: 24,
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          12, 0, 0, 0),
                                      child: Theme(
                                        data: ThemeData(
                                          checkboxTheme: CheckboxThemeData(
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(25),
                                            ),
                                          ),
                                          unselectedWidgetColor:
                                              Color(0xFF95A1AC),
                                        ),
                                        child: CheckboxListTile(
                                          value: checkboxListTileValue2 ??=
                                              false,
                                          onChanged: (newValue) async {
                                            setState(() =>
                                                checkboxListTileValue2 =
                                                    newValue!);
                                          },
                                          title: Text(
                                            'Paypal',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1,
                                          ),
                                          tileColor: Color(0xFFF5F5F5),
                                          activeColor:
                                              FlutterFlowTheme.of(context)
                                                  .primaryColor,
                                          dense: true,
                                          controlAffinity:
                                              ListTileControlAffinity.trailing,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 24),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          if (checkboxListTileValue1 == true)
                            FFButtonWidget(
                              onPressed: () async {
                                final transacAmount = sliderValue!;
                                if (!(creditCardFormKey.currentState
                                        ?.validate() ??
                                    false)) {
                                  return;
                                }
                                if (kIsWeb) {
                                  showSnackbar(context,
                                      'Payments not yet supported on web.');
                                  return;
                                }

                                final cardRequest = BraintreeCreditCardRequest(
                                  cardNumber: creditCardInfo.cardNumber,
                                  expirationMonth: creditCardInfo.expiryDate
                                      .split('/')
                                      .first,
                                  expirationYear:
                                      creditCardInfo.expiryDate.split('/').last,
                                  cvv: creditCardInfo.cvvCode,
                                );
                                final cardResult =
                                    await Braintree.tokenizeCreditCard(
                                  braintreeClientToken(),
                                  cardRequest,
                                );
                                if (cardResult == null) {
                                  return;
                                }
                                showSnackbar(
                                  context,
                                  'Processing payment...',
                                  duration: 10,
                                  loading: true,
                                );
                                final paymentResponse =
                                    await processBraintreePayment(
                                  transacAmount,
                                  cardResult.nonce,
                                );
                                if (paymentResponse.errorMessage != null) {
                                  showSnackbar(context,
                                      'Error: ${paymentResponse.errorMessage}');
                                  return;
                                }
                                showSnackbar(context, 'Success!');
                                transactionId = paymentResponse.transactionId!;

                                setState(() {});
                              },
                              text: 'Pay Now',
                              options: FFButtonOptions(
                                width: 270,
                                height: 50,
                                color: FlutterFlowTheme.of(context).primaryText,
                                textStyle: FlutterFlowTheme.of(context)
                                    .subtitle2
                                    .override(
                                      fontFamily: 'Overpass',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                    ),
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1,
                                ),
                              ),
                            ),
                          if (checkboxListTileValue2 == true)
                            FFButtonWidget(
                              onPressed: () async {
                                final transacAmount = sliderValue!;
                                final transacDisplayName =
                                    'QuickSports Donation';
                                if (kIsWeb) {
                                  showSnackbar(context,
                                      'Payments not yet supported on web.');
                                  return;
                                }

                                final payPalRequest = BraintreePayPalRequest(
                                  amount: transacAmount.toString(),
                                  currencyCode: 'USD',
                                  displayName: transacDisplayName,
                                );
                                final payPalResult =
                                    await Braintree.requestPaypalNonce(
                                  braintreeClientToken(),
                                  payPalRequest,
                                );
                                if (payPalResult == null) {
                                  return;
                                }
                                showSnackbar(
                                  context,
                                  'Processing payment...',
                                  duration: 10,
                                  loading: true,
                                );
                                final paymentResponse =
                                    await processBraintreePayment(
                                  transacAmount,
                                  payPalResult.nonce,
                                );
                                if (paymentResponse.errorMessage != null) {
                                  showSnackbar(context,
                                      'Error: ${paymentResponse.errorMessage}');
                                  return;
                                }
                                showSnackbar(context, 'Success!');
                                transactionId2 = paymentResponse.transactionId!;

                                setState(() {});
                              },
                              text: 'Pay w/Paypal',
                              icon: FaIcon(
                                FontAwesomeIcons.paypal,
                              ),
                              options: FFButtonOptions(
                                width: 270,
                                height: 50,
                                color: FlutterFlowTheme.of(context).primaryText,
                                textStyle: FlutterFlowTheme.of(context)
                                    .subtitle2
                                    .override(
                                      fontFamily: 'Overpass',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                    ),
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1,
                                ),
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
        ));
  }
}
