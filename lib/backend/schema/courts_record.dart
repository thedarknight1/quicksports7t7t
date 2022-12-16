import 'dart:async';

import 'package:from_css_color/from_css_color.dart';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'courts_record.g.dart';

abstract class CourtsRecord
    implements Built<CourtsRecord, CourtsRecordBuilder> {
  static Serializer<CourtsRecord> get serializer => _$courtsRecordSerializer;

  String? get name;

  LatLng? get location;

  @BuiltValueField(wireName: 'created_at')
  DateTime? get createdAt;

  DocumentReference? get user;

  String? get description;

  int? get likes;

  double? get value;

  @BuiltValueField(wireName: 'image_url')
  String? get imageUrl;

  @BuiltValueField(wireName: 'is_indoor')
  bool? get isIndoor;

  @BuiltValueField(wireName: 'video_url')
  String? get videoUrl;

  String? get sportname;

  String? get bio;

  BuiltList<String>? get sportList;

  String? get sport2name;

  String? get sport3name;

  @BuiltValueField(wireName: 'Address')
  String? get address;

  @BuiltValueField(wireName: 'City')
  String? get city;

  @BuiltValueField(wireName: 'State')
  String? get state;

  @BuiltValueField(wireName: 'Zipcode')
  String? get zipcode;

  @BuiltValueField(wireName: 'Country')
  String? get country;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(CourtsRecordBuilder builder) => builder
    ..name = ''
    ..description = ''
    ..likes = 0
    ..value = 0.0
    ..imageUrl = ''
    ..isIndoor = false
    ..videoUrl = ''
    ..sportname = ''
    ..bio = ''
    ..sportList = ListBuilder()
    ..sport2name = ''
    ..sport3name = ''
    ..address = ''
    ..city = ''
    ..state = ''
    ..zipcode = ''
    ..country = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('courts');

  static Stream<CourtsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<CourtsRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static CourtsRecord fromAlgolia(AlgoliaObjectSnapshot snapshot) =>
      CourtsRecord(
        (c) => c
          ..name = snapshot.data['name']
          ..location = safeGet(() => LatLng(
                snapshot.data['_geoloc']['lat'],
                snapshot.data['_geoloc']['lng'],
              ))
          ..createdAt = safeGet(() =>
              DateTime.fromMillisecondsSinceEpoch(snapshot.data['created_at']))
          ..user = safeGet(() => toRef(snapshot.data['user']))
          ..description = snapshot.data['description']
          ..likes = snapshot.data['likes']?.round()
          ..value = snapshot.data['value']?.toDouble()
          ..imageUrl = snapshot.data['image_url']
          ..isIndoor = snapshot.data['is_indoor']
          ..videoUrl = snapshot.data['video_url']
          ..sportname = snapshot.data['sportname']
          ..bio = snapshot.data['bio']
          ..sportList = safeGet(() => ListBuilder(snapshot.data['sportList']))
          ..sport2name = snapshot.data['sport2name']
          ..sport3name = snapshot.data['sport3name']
          ..address = snapshot.data['Address']
          ..city = snapshot.data['City']
          ..state = snapshot.data['State']
          ..zipcode = snapshot.data['Zipcode']
          ..country = snapshot.data['Country']
          ..ffRef = CourtsRecord.collection.doc(snapshot.objectID),
      );

  static Future<List<CourtsRecord>> search(
          {String? term,
          FutureOr<LatLng>? location,
          int? maxResults,
          double? searchRadiusMeters}) =>
      FFAlgoliaManager.instance
          .algoliaQuery(
            index: 'courts',
            term: term,
            maxResults: maxResults,
            location: location,
            searchRadiusMeters: searchRadiusMeters,
          )
          .then((r) => r.map(fromAlgolia).toList());

  CourtsRecord._();
  factory CourtsRecord([void Function(CourtsRecordBuilder) updates]) =
      _$CourtsRecord;

  static CourtsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createCourtsRecordData({
  String? name,
  LatLng? location,
  DateTime? createdAt,
  DocumentReference? user,
  String? description,
  int? likes,
  double? value,
  String? imageUrl,
  bool? isIndoor,
  String? videoUrl,
  String? sportname,
  String? bio,
  String? sport2name,
  String? sport3name,
  String? address,
  String? city,
  String? state,
  String? zipcode,
  String? country,
}) {
  final firestoreData = serializers.toFirestore(
    CourtsRecord.serializer,
    CourtsRecord(
      (c) => c
        ..name = name
        ..location = location
        ..createdAt = createdAt
        ..user = user
        ..description = description
        ..likes = likes
        ..value = value
        ..imageUrl = imageUrl
        ..isIndoor = isIndoor
        ..videoUrl = videoUrl
        ..sportname = sportname
        ..bio = bio
        ..sportList = null
        ..sport2name = sport2name
        ..sport3name = sport3name
        ..address = address
        ..city = city
        ..state = state
        ..zipcode = zipcode
        ..country = country,
    ),
  );

  return firestoreData;
}
