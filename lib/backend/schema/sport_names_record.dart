import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'sport_names_record.g.dart';

abstract class SportNamesRecord
    implements Built<SportNamesRecord, SportNamesRecordBuilder> {
  static Serializer<SportNamesRecord> get serializer =>
      _$sportNamesRecordSerializer;

  String? get sportName;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(SportNamesRecordBuilder builder) =>
      builder..sportName = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('sportNames');

  static Stream<SportNamesRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<SportNamesRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  SportNamesRecord._();
  factory SportNamesRecord([void Function(SportNamesRecordBuilder) updates]) =
      _$SportNamesRecord;

  static SportNamesRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createSportNamesRecordData({
  String? sportName,
}) {
  final firestoreData = serializers.toFirestore(
    SportNamesRecord.serializer,
    SportNamesRecord(
      (s) => s..sportName = sportName,
    ),
  );

  return firestoreData;
}
