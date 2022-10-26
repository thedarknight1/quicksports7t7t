import 'dart:async';

import 'package:from_css_color/from_css_color.dart';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'cities_record.g.dart';

abstract class CitiesRecord
    implements Built<CitiesRecord, CitiesRecordBuilder> {
  static Serializer<CitiesRecord> get serializer => _$citiesRecordSerializer;

  String? get city;

  @BuiltValueField(wireName: 'state_name')
  String? get stateName;

  String? get zips;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(CitiesRecordBuilder builder) => builder
    ..city = ''
    ..stateName = ''
    ..zips = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('cities');

  static Stream<CitiesRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<CitiesRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static CitiesRecord fromAlgolia(AlgoliaObjectSnapshot snapshot) =>
      CitiesRecord(
        (c) => c
          ..city = snapshot.data['city']
          ..stateName = snapshot.data['state_name']
          ..zips = snapshot.data['zips']
          ..ffRef = CitiesRecord.collection.doc(snapshot.objectID),
      );

  static Future<List<CitiesRecord>> search(
          {String? term,
          FutureOr<LatLng>? location,
          int? maxResults,
          double? searchRadiusMeters}) =>
      FFAlgoliaManager.instance
          .algoliaQuery(
            index: 'cities',
            term: term,
            maxResults: maxResults,
            location: location,
            searchRadiusMeters: searchRadiusMeters,
          )
          .then((r) => r.map(fromAlgolia).toList());

  CitiesRecord._();
  factory CitiesRecord([void Function(CitiesRecordBuilder) updates]) =
      _$CitiesRecord;

  static CitiesRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createCitiesRecordData({
  String? city,
  String? stateName,
  String? zips,
}) {
  final firestoreData = serializers.toFirestore(
    CitiesRecord.serializer,
    CitiesRecord(
      (c) => c
        ..city = city
        ..stateName = stateName
        ..zips = zips,
    ),
  );

  return firestoreData;
}
