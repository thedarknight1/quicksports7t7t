import 'dart:async';

import 'package:from_css_color/from_css_color.dart';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'userprofile_record.g.dart';

abstract class UserprofileRecord
    implements Built<UserprofileRecord, UserprofileRecordBuilder> {
  static Serializer<UserprofileRecord> get serializer =>
      _$userprofileRecordSerializer;

  String? get displayname;

  String? get username;

  String? get photourl;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(UserprofileRecordBuilder builder) => builder
    ..displayname = ''
    ..username = ''
    ..photourl = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('userprofile');

  static Stream<UserprofileRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<UserprofileRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static UserprofileRecord fromAlgolia(AlgoliaObjectSnapshot snapshot) =>
      UserprofileRecord(
        (c) => c
          ..displayname = snapshot.data['displayname']
          ..username = snapshot.data['username']
          ..photourl = snapshot.data['photourl']
          ..ffRef = UserprofileRecord.collection.doc(snapshot.objectID),
      );

  static Future<List<UserprofileRecord>> search(
          {String? term,
          FutureOr<LatLng>? location,
          int? maxResults,
          double? searchRadiusMeters}) =>
      FFAlgoliaManager.instance
          .algoliaQuery(
            index: 'userprofile',
            term: term,
            maxResults: maxResults,
            location: location,
            searchRadiusMeters: searchRadiusMeters,
          )
          .then((r) => r.map(fromAlgolia).toList());

  UserprofileRecord._();
  factory UserprofileRecord([void Function(UserprofileRecordBuilder) updates]) =
      _$UserprofileRecord;

  static UserprofileRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createUserprofileRecordData({
  String? displayname,
  String? username,
  String? photourl,
}) {
  final firestoreData = serializers.toFirestore(
    UserprofileRecord.serializer,
    UserprofileRecord(
      (u) => u
        ..displayname = displayname
        ..username = username
        ..photourl = photourl,
    ),
  );

  return firestoreData;
}
