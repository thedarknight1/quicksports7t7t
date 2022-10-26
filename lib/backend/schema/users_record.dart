import 'dart:async';

import 'package:from_css_color/from_css_color.dart';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'users_record.g.dart';

abstract class UsersRecord implements Built<UsersRecord, UsersRecordBuilder> {
  static Serializer<UsersRecord> get serializer => _$usersRecordSerializer;

  String? get email;

  @BuiltValueField(wireName: 'display_name')
  String? get displayName;

  @BuiltValueField(wireName: 'photo_url')
  String? get photoUrl;

  String? get uid;

  @BuiltValueField(wireName: 'created_time')
  DateTime? get createdTime;

  @BuiltValueField(wireName: 'phone_number')
  String? get phoneNumber;

  String? get username;

  String? get favsport;

  String? get favteam;

  String? get favplayer;

  String? get favsport2;

  String? get favsport3;

  String? get city;

  String? get zips;

  @BuiltValueField(wireName: 'state_name')
  String? get stateName;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(UsersRecordBuilder builder) => builder
    ..email = ''
    ..displayName = ''
    ..photoUrl = ''
    ..uid = ''
    ..phoneNumber = ''
    ..username = ''
    ..favsport = ''
    ..favteam = ''
    ..favplayer = ''
    ..favsport2 = ''
    ..favsport3 = ''
    ..city = ''
    ..zips = ''
    ..stateName = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<UsersRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static UsersRecord fromAlgolia(AlgoliaObjectSnapshot snapshot) => UsersRecord(
        (c) => c
          ..email = snapshot.data['email']
          ..displayName = snapshot.data['display_name']
          ..photoUrl = snapshot.data['photo_url']
          ..uid = snapshot.data['uid']
          ..createdTime = safeGet(() => DateTime.fromMillisecondsSinceEpoch(
              snapshot.data['created_time']))
          ..phoneNumber = snapshot.data['phone_number']
          ..username = snapshot.data['username']
          ..favsport = snapshot.data['favsport']
          ..favteam = snapshot.data['favteam']
          ..favplayer = snapshot.data['favplayer']
          ..favsport2 = snapshot.data['favsport2']
          ..favsport3 = snapshot.data['favsport3']
          ..city = snapshot.data['city']
          ..zips = snapshot.data['zips']
          ..stateName = snapshot.data['state_name']
          ..ffRef = UsersRecord.collection.doc(snapshot.objectID),
      );

  static Future<List<UsersRecord>> search(
          {String? term,
          FutureOr<LatLng>? location,
          int? maxResults,
          double? searchRadiusMeters}) =>
      FFAlgoliaManager.instance
          .algoliaQuery(
            index: 'users',
            term: term,
            maxResults: maxResults,
            location: location,
            searchRadiusMeters: searchRadiusMeters,
          )
          .then((r) => r.map(fromAlgolia).toList());

  UsersRecord._();
  factory UsersRecord([void Function(UsersRecordBuilder) updates]) =
      _$UsersRecord;

  static UsersRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createUsersRecordData({
  String? email,
  String? displayName,
  String? photoUrl,
  String? uid,
  DateTime? createdTime,
  String? phoneNumber,
  String? username,
  String? favsport,
  String? favteam,
  String? favplayer,
  String? favsport2,
  String? favsport3,
  String? city,
  String? zips,
  String? stateName,
}) {
  final firestoreData = serializers.toFirestore(
    UsersRecord.serializer,
    UsersRecord(
      (u) => u
        ..email = email
        ..displayName = displayName
        ..photoUrl = photoUrl
        ..uid = uid
        ..createdTime = createdTime
        ..phoneNumber = phoneNumber
        ..username = username
        ..favsport = favsport
        ..favteam = favteam
        ..favplayer = favplayer
        ..favsport2 = favsport2
        ..favsport3 = favsport3
        ..city = city
        ..zips = zips
        ..stateName = stateName,
    ),
  );

  return firestoreData;
}
