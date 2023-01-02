import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:go_router/go_router.dart';
import 'package:page_transition/page_transition.dart';
import '../flutter_flow_theme.dart';
import '../../backend/backend.dart';

import '../../auth/firebase_user_provider.dart';

import '../../backend/firebase_dynamic_links/firebase_dynamic_links.dart'
    show DynamicLinksHandler;
import '../../index.dart';
import '../../main.dart';
import '../lat_lng.dart';
import '../place.dart';
import 'serialization_util.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';
export '../../backend/firebase_dynamic_links/firebase_dynamic_links.dart'
    show generateCurrentPageLink;

const kTransitionInfoKey = '__transition_info__';

class AppStateNotifier extends ChangeNotifier {
  QuickSportsFirebaseUser? initialUser;
  QuickSportsFirebaseUser? user;
  bool showSplashImage = true;
  String? _redirectLocation;

  /// Determines whether the app will refresh and build again when a sign
  /// in or sign out happens. This is useful when the app is launched or
  /// on an unexpected logout. However, this must be turned off when we
  /// intend to sign in/out and then navigate or perform any actions after.
  /// Otherwise, this will trigger a refresh and interrupt the action(s).
  bool notifyOnAuthChange = true;

  bool get loading => user == null || showSplashImage;
  bool get loggedIn => user?.loggedIn ?? false;
  bool get initiallyLoggedIn => initialUser?.loggedIn ?? false;
  bool get shouldRedirect => loggedIn && _redirectLocation != null;

  String getRedirectLocation() => _redirectLocation!;
  bool hasRedirect() => _redirectLocation != null;
  void setRedirectLocationIfUnset(String loc) => _redirectLocation ??= loc;
  void clearRedirectLocation() => _redirectLocation = null;

  /// Mark as not needing to notify on a sign in / out when we intend
  /// to perform subsequent actions (such as navigation) afterwards.
  void updateNotifyOnAuthChange(bool notify) => notifyOnAuthChange = notify;

  void update(QuickSportsFirebaseUser newUser) {
    initialUser ??= newUser;
    user = newUser;
    // Refresh the app on auth change unless explicitly marked otherwise.
    if (notifyOnAuthChange) {
      notifyListeners();
    }
    // Once again mark the notifier as needing to update on auth change
    // (in order to catch sign in / out events).
    updateNotifyOnAuthChange(true);
  }

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      errorBuilder: (context, _) =>
          appStateNotifier.loggedIn ? NavBarPage() : CreateAccountWidget(),
      navigatorBuilder: (_, __, child) => DynamicLinksHandler(child: child),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) =>
              appStateNotifier.loggedIn ? NavBarPage() : CreateAccountWidget(),
          routes: [
            FFRoute(
              name: 'courtAddedSuccess',
              path: 'courtAddedSuccess',
              asyncParams: {
                'newlyCreatedCourt':
                    getDoc(['courts'], CourtsRecord.serializer),
              },
              builder: (context, params) => CourtAddedSuccessWidget(
                newlyCreatedCourt:
                    params.getParam('newlyCreatedCourt', ParamType.Document),
              ),
            ),
            FFRoute(
              name: 'loginCopy',
              path: 'loginCopy',
              builder: (context, params) => LoginCopyWidget(),
            ),
            FFRoute(
              name: 'addCourt',
              path: 'addCourt',
              builder: (context, params) => AddCourtWidget(
                listSports: params.getParam<String>(
                    'listSports', ParamType.String, true),
                isSportConfirmed:
                    params.getParam('isSportConfirmed', ParamType.bool),
              ),
            ),
            FFRoute(
              name: 'createAccount',
              path: 'createAccount',
              builder: (context, params) => CreateAccountWidget(),
            ),
            FFRoute(
              name: 'Locationprofile',
              path: 'locationprofile',
              builder: (context, params) => LocationprofileWidget(),
            ),
            FFRoute(
              name: 'createprofilefirst',
              path: 'createprofilefirst',
              builder: (context, params) => CreateprofilefirstWidget(),
            ),
            FFRoute(
              name: 'eventsNearYou',
              path: 'eventsNearYou',
              builder: (context, params) => params.isEmpty
                  ? NavBarPage(initialPage: 'eventsNearYou')
                  : EventsNearYouWidget(),
            ),
            FFRoute(
              name: 'yesornogroupchat',
              path: 'yesornogroupchat',
              asyncParams: {
                'eventGroupChat': getDoc(['events'], EventsRecord.serializer),
                'specificChat': getDoc(['chats'], ChatsRecord.serializer),
              },
              builder: (context, params) => YesornogroupchatWidget(
                eventGroupChat:
                    params.getParam('eventGroupChat', ParamType.Document),
                specificChat:
                    params.getParam('specificChat', ParamType.Document),
              ),
            ),
            FFRoute(
              name: 'interestscreateprofile',
              path: 'interestscreateprofile',
              builder: (context, params) => InterestscreateprofileWidget(),
            ),
            FFRoute(
              name: 'profilePage',
              path: 'profilePage',
              builder: (context, params) => params.isEmpty
                  ? NavBarPage(initialPage: 'profilePage')
                  : ProfilePageWidget(),
            ),
            FFRoute(
              name: 'changePassword',
              path: 'changePassword',
              builder: (context, params) => ChangePasswordWidget(),
            ),
            FFRoute(
              name: 'findCourt',
              path: 'findCourt',
              builder: (context, params) => params.isEmpty
                  ? NavBarPage(initialPage: 'findCourt')
                  : FindCourtWidget(
                      searchTerm:
                          params.getParam('searchTerm', ParamType.String),
                    ),
            ),
            FFRoute(
              name: 'phoneSignIn',
              path: 'phoneSignIn',
              builder: (context, params) => PhoneSignInWidget(),
            ),
            FFRoute(
              name: 'editProfile',
              path: 'editProfile',
              builder: (context, params) => EditProfileWidget(),
            ),
            FFRoute(
              name: 'registerPage',
              path: 'registerPage',
              builder: (context, params) => RegisterPageWidget(),
            ),
            FFRoute(
              name: 'rateCourtPage',
              path: 'rateCourtPage',
              asyncParams: {
                'court': getDoc(['courts'], CourtsRecord.serializer),
              },
              builder: (context, params) => RateCourtPageWidget(
                court: params.getParam('court', ParamType.Document),
              ),
            ),
            FFRoute(
              name: 'createeventpage',
              path: 'createeventpage',
              asyncParams: {
                'createeventpage': getDoc(['courts'], CourtsRecord.serializer),
              },
              builder: (context, params) => CreateeventpageWidget(
                createeventpage:
                    params.getParam('createeventpage', ParamType.Document),
              ),
            ),
            FFRoute(
              name: 'ChatPage',
              path: 'chatPage',
              asyncParams: {
                'chatUser': getDoc(['users'], UsersRecord.serializer),
                'eventGroupChat': getDoc(['chats'], ChatsRecord.serializer),
              },
              builder: (context, params) => ChatPageWidget(
                chatUser: params.getParam('chatUser', ParamType.Document),
                eventGroupChat:
                    params.getParam('eventGroupChat', ParamType.Document),
                chatRef: params.getParam(
                    'chatRef', ParamType.DocumentReference, false, ['chats']),
              ),
            ),
            FFRoute(
              name: 'peopleprofile',
              path: 'peopleprofile',
              builder: (context, params) => PeopleprofileWidget(
                peopleprofileparameter: params.getParam(
                    'peopleprofileparameter',
                    ParamType.DocumentReference,
                    false,
                    ['users']),
              ),
            ),
            FFRoute(
              name: 'verifyPhone',
              path: 'verifyPhone',
              builder: (context, params) => VerifyPhoneWidget(),
            ),
            FFRoute(
              name: 'AllChats',
              path: 'allChats',
              builder: (context, params) => params.isEmpty
                  ? NavBarPage(initialPage: 'AllChats')
                  : AllChatsWidget(),
            ),
            FFRoute(
              name: 'usersearcher',
              path: 'usersearcher',
              builder: (context, params) => params.isEmpty
                  ? NavBarPage(initialPage: 'usersearcher')
                  : UsersearcherWidget(),
            ),
            FFRoute(
              name: 'courtAddedSuccessCopy',
              path: 'eventAddedSuccessCopy',
              asyncParams: {
                'groupChatDoc': getDoc(['chats'], ChatsRecord.serializer),
                'courtDoc': getDoc(['courts'], CourtsRecord.serializer),
                'eventDoc': getDoc(['events'], EventsRecord.serializer),
              },
              builder: (context, params) => CourtAddedSuccessCopyWidget(
                groupChatRef: params.getParam('groupChatRef',
                    ParamType.DocumentReference, false, ['chats']),
                groupChatDoc:
                    params.getParam('groupChatDoc', ParamType.Document),
                courtDoc: params.getParam('courtDoc', ParamType.Document),
                eventDoc: params.getParam('eventDoc', ParamType.Document),
              ),
            ),
            FFRoute(
              name: 'courtAddedSuccessCopyCopy',
              path: 'ratingAddedSuccess',
              asyncParams: {
                'courtDoc': getDoc(['courts'], CourtsRecord.serializer),
              },
              builder: (context, params) => CourtAddedSuccessCopyCopyWidget(
                courtRef: params.getParam(
                    'courtRef', ParamType.DocumentReference, false, ['courts']),
                courtDoc: params.getParam('courtDoc', ParamType.Document),
              ),
            ),
            FFRoute(
              name: 'creategroupchatNOTNEW',
              path: 'creategroupchatNOTNEW',
              asyncParams: {
                'groupChatForEventCreate':
                    getDoc(['events'], EventsRecord.serializer),
                'specificChat2': getDoc(['chats'], ChatsRecord.serializer),
              },
              builder: (context, params) => CreategroupchatNOTNEWWidget(
                groupChatForEventCreate: params.getParam(
                    'groupChatForEventCreate', ParamType.Document),
                specificChat2:
                    params.getParam('specificChat2', ParamType.Document),
              ),
            ),
            FFRoute(
              name: 'groupChatPeopleList',
              path: 'groupChatPeopleList',
              asyncParams: {
                'groupChat': getDoc(['chats'], ChatsRecord.serializer),
              },
              builder: (context, params) => GroupChatPeopleListWidget(
                groupChat: params.getParam('groupChat', ParamType.Document),
                groupChatRef: params.getParam('groupChatRef',
                    ParamType.DocumentReference, false, ['chats']),
              ),
            ),
            FFRoute(
              name: 'termsandconditions',
              path: 'termsandconditions',
              builder: (context, params) => TermsandconditionsWidget(),
            ),
            FFRoute(
              name: 'usersettings',
              path: 'usersettings',
              builder: (context, params) => UsersettingsWidget(),
            ),
            FFRoute(
              name: 'courtAddedSuccessCopyCopyCopy',
              path: 'donationSuccess',
              asyncParams: {
                'courtDoc': getDoc(['courts'], CourtsRecord.serializer),
              },
              builder: (context, params) => CourtAddedSuccessCopyCopyCopyWidget(
                courtRef: params.getParam(
                    'courtRef', ParamType.DocumentReference, false, ['courts']),
                courtDoc: params.getParam('courtDoc', ParamType.Document),
              ),
            ),
            FFRoute(
              name: 'donate',
              path: 'donate',
              builder: (context, params) => DonateWidget(),
            ),
            FFRoute(
              name: 'donateCominhSoon',
              path: 'donateCominhSoon',
              builder: (context, params) => DonateCominhSoonWidget(),
            ),
            FFRoute(
              name: 'courtDetailsCopy',
              path: 'courtDetailsCopy/:court2',
              requireAuth: true,
              asyncParams: {
                'court2': getDoc(['courts'], CourtsRecord.serializer),
              },
              builder: (context, params) => CourtDetailsCopyWidget(
                court2: params.getParam('court2', ParamType.Document),
              ),
            ),
            FFRoute(
              name: 'creategroupchatNOTNEWCopy',
              path: 'creategroupchatNOTNEWCopy',
              asyncParams: {
                'groupChatForEventCreate':
                    getDoc(['events'], EventsRecord.serializer),
                'specificChat2': getDoc(['chats'], ChatsRecord.serializer),
              },
              builder: (context, params) => CreategroupchatNOTNEWCopyWidget(
                groupChatForEventCreate: params.getParam(
                    'groupChatForEventCreate', ParamType.Document),
                specificChat2:
                    params.getParam('specificChat2', ParamType.Document),
              ),
            ),
            FFRoute(
              name: 'eventDetails',
              path: 'eventDetails/:event/:chat',
              requireAuth: true,
              asyncParams: {
                'court': getDoc(['courts'], CourtsRecord.serializer),
                'event': getDoc(['events'], EventsRecord.serializer),
                'chat': getDoc(['chats'], ChatsRecord.serializer),
              },
              builder: (context, params) => EventDetailsWidget(
                court: params.getParam('court', ParamType.Document),
                courtRef: params.getParam(
                    'courtRef', ParamType.DocumentReference, false, ['courts']),
                event: params.getParam('event', ParamType.Document),
                eventRef: params.getParam(
                    'eventRef', ParamType.DocumentReference, false, ['events']),
                chat: params.getParam('chat', ParamType.Document),
                chatRef: params.getParam(
                    'chatRef', ParamType.DocumentReference, false, ['chats']),
              ),
            )
          ].map((r) => r.toRoute(appStateNotifier)).toList(),
        ).toRoute(appStateNotifier),
      ],
      urlPathStrategy: UrlPathStrategy.path,
    );

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
        entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
}

extension NavigationExtensions on BuildContext {
  void goNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> params = const <String, String>{},
    Map<String, String> queryParams = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : goNamed(
              name,
              params: params,
              queryParams: queryParams,
              extra: extra,
            );

  void pushNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> params = const <String, String>{},
    Map<String, String> queryParams = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : pushNamed(
              name,
              params: params,
              queryParams: queryParams,
              extra: extra,
            );
}

extension GoRouterExtensions on GoRouter {
  AppStateNotifier get appState =>
      (routerDelegate.refreshListenable as AppStateNotifier);
  void prepareAuthEvent([bool ignoreRedirect = false]) =>
      appState.hasRedirect() && !ignoreRedirect
          ? null
          : appState.updateNotifyOnAuthChange(false);
  bool shouldRedirect(bool ignoreRedirect) =>
      !ignoreRedirect && appState.hasRedirect();
  void setRedirectLocationIfUnset(String location) =>
      (routerDelegate.refreshListenable as AppStateNotifier)
          .updateNotifyOnAuthChange(false);
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(params)
    ..addAll(queryParams)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo => extraMap.containsKey(kTransitionInfoKey)
      ? extraMap[kTransitionInfoKey] as TransitionInfo
      : TransitionInfo.appDefault();
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  // Parameters are empty if the params map is empty or if the only parameter
  // present is the special extra parameter reserved for the transition info.
  bool get isEmpty =>
      state.allParams.isEmpty ||
      (state.extraMap.length == 1 &&
          state.extraMap.containsKey(kTransitionInfoKey));
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key]!(param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam<T>(
    String paramName,
    ParamType type, [
    bool isList = false,
    List<String>? collectionNamePath,
  ]) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam<T>(param, type, isList, collectionNamePath);
  }
}

class FFRoute {
  const FFRoute({
    required this.name,
    required this.path,
    required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        redirect: (state) {
          if (appStateNotifier.shouldRedirect) {
            final redirectLocation = appStateNotifier.getRedirectLocation();
            appStateNotifier.clearRedirectLocation();
            return redirectLocation;
          }

          if (requireAuth && !appStateNotifier.loggedIn) {
            appStateNotifier.setRedirectLocationIfUnset(state.location);
            return '/createAccount';
          }
          return null;
        },
        pageBuilder: (context, state) {
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = appStateNotifier.loading
              ? Container(
                  color: Color(0xFFF86B6B),
                  child: Center(
                    child: Image.asset(
                      'assets/images/QuickSports__10_-removebg-preview_(1).png',
                      width: 300,
                      height: 300,
                      fit: BoxFit.contain,
                    ),
                  ),
                )
              : page;

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder: PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).transitionsBuilder,
                )
              : MaterialPage(key: state.pageKey, child: child);
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    required this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment? alignment;

  static TransitionInfo appDefault() => TransitionInfo(hasTransition: false);
}
