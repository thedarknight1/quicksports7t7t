import 'dart:async';

import 'package:from_css_color/from_css_color.dart';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'recordfriend_record.g.dart';

abstract class RecordfriendRecord
    implements Built<RecordfriendRecord, RecordfriendRecordBuilder> {
  static Serializer<RecordfriendRecord> get serializer =>
      _$recordfriendRecordSerializer;

  @BuiltValueField(wireName: 'Status_request')
  String? get statusRequest;

  @BuiltValueField(wireName: 'Recipient_choice')
  bool? get recipientChoice;

  @BuiltValueField(wireName: 'Applicant_UID')
  DocumentReference? get applicantUID;

  @BuiltValueField(wireName: 'Recipient_UID')
  DocumentReference? get recipientUID;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(RecordfriendRecordBuilder builder) => builder
    ..statusRequest = ''
    ..recipientChoice = false;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('recordfriend');

  static Stream<RecordfriendRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<RecordfriendRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static RecordfriendRecord fromAlgolia(AlgoliaObjectSnapshot snapshot) =>
      RecordfriendRecord(
        (c) => c
          ..statusRequest = snapshot.data['Status_request']
          ..recipientChoice = snapshot.data['Recipient_choice']
          ..applicantUID = safeGet(() => toRef(snapshot.data['Applicant_UID']))
          ..recipientUID = safeGet(() => toRef(snapshot.data['Recipient_UID']))
          ..ffRef = RecordfriendRecord.collection.doc(snapshot.objectID),
      );

  static Future<List<RecordfriendRecord>> search(
          {String? term,
          FutureOr<LatLng>? location,
          int? maxResults,
          double? searchRadiusMeters}) =>
      FFAlgoliaManager.instance
          .algoliaQuery(
            index: 'recordfriend',
            term: term,
            maxResults: maxResults,
            location: location,
            searchRadiusMeters: searchRadiusMeters,
          )
          .then((r) => r.map(fromAlgolia).toList());

  RecordfriendRecord._();
  factory RecordfriendRecord(
          [void Function(RecordfriendRecordBuilder) updates]) =
      _$RecordfriendRecord;

  static RecordfriendRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createRecordfriendRecordData({
  String? statusRequest,
  bool? recipientChoice,
  DocumentReference? applicantUID,
  DocumentReference? recipientUID,
}) {
  final firestoreData = serializers.toFirestore(
    RecordfriendRecord.serializer,
    RecordfriendRecord(
      (r) => r
        ..statusRequest = statusRequest
        ..recipientChoice = recipientChoice
        ..applicantUID = applicantUID
        ..recipientUID = recipientUID,
    ),
  );

  return firestoreData;
}
