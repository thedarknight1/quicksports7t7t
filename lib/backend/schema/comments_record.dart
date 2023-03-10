import 'dart:async';

import 'package:from_css_color/from_css_color.dart';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'comments_record.g.dart';

abstract class CommentsRecord
    implements Built<CommentsRecord, CommentsRecordBuilder> {
  static Serializer<CommentsRecord> get serializer =>
      _$commentsRecordSerializer;

  DocumentReference? get user;

  String? get text;

  DocumentReference? get court;

  @BuiltValueField(wireName: 'court_quality_rating')
  double? get courtQualityRating;

  String? get title;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(CommentsRecordBuilder builder) => builder
    ..text = ''
    ..courtQualityRating = 0.0
    ..title = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('comments');

  static Stream<CommentsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<CommentsRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static CommentsRecord fromAlgolia(AlgoliaObjectSnapshot snapshot) =>
      CommentsRecord(
        (c) => c
          ..user = safeGet(() => toRef(snapshot.data['user']))
          ..text = snapshot.data['text']
          ..court = safeGet(() => toRef(snapshot.data['court']))
          ..courtQualityRating =
              snapshot.data['court_quality_rating']?.toDouble()
          ..title = snapshot.data['title']
          ..ffRef = CommentsRecord.collection.doc(snapshot.objectID),
      );

  static Future<List<CommentsRecord>> search(
          {String? term,
          FutureOr<LatLng>? location,
          int? maxResults,
          double? searchRadiusMeters}) =>
      FFAlgoliaManager.instance
          .algoliaQuery(
            index: 'comments',
            term: term,
            maxResults: maxResults,
            location: location,
            searchRadiusMeters: searchRadiusMeters,
          )
          .then((r) => r.map(fromAlgolia).toList());

  CommentsRecord._();
  factory CommentsRecord([void Function(CommentsRecordBuilder) updates]) =
      _$CommentsRecord;

  static CommentsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createCommentsRecordData({
  DocumentReference? user,
  String? text,
  DocumentReference? court,
  double? courtQualityRating,
  String? title,
}) {
  final firestoreData = serializers.toFirestore(
    CommentsRecord.serializer,
    CommentsRecord(
      (c) => c
        ..user = user
        ..text = text
        ..court = court
        ..courtQualityRating = courtQualityRating
        ..title = title,
    ),
  );

  return firestoreData;
}
