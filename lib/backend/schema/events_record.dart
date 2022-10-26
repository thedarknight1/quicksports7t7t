import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'events_record.g.dart';

abstract class EventsRecord
    implements Built<EventsRecord, EventsRecordBuilder> {
  static Serializer<EventsRecord> get serializer => _$eventsRecordSerializer;

  String? get description;

  String? get date;

  String? get time;

  String? get activity;

  String? get playerage;

  String? get playercount;

  String? get locationname;

  String? get locationarea;

  String? get eventsportname;

  DocumentReference? get groupchat;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(EventsRecordBuilder builder) => builder
    ..description = ''
    ..date = ''
    ..time = ''
    ..activity = ''
    ..playerage = ''
    ..playercount = ''
    ..locationname = ''
    ..locationarea = ''
    ..eventsportname = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('events');

  static Stream<EventsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<EventsRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  EventsRecord._();
  factory EventsRecord([void Function(EventsRecordBuilder) updates]) =
      _$EventsRecord;

  static EventsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createEventsRecordData({
  String? description,
  String? date,
  String? time,
  String? activity,
  String? playerage,
  String? playercount,
  String? locationname,
  String? locationarea,
  String? eventsportname,
  DocumentReference? groupchat,
}) {
  final firestoreData = serializers.toFirestore(
    EventsRecord.serializer,
    EventsRecord(
      (e) => e
        ..description = description
        ..date = date
        ..time = time
        ..activity = activity
        ..playerage = playerage
        ..playercount = playercount
        ..locationname = locationname
        ..locationarea = locationarea
        ..eventsportname = eventsportname
        ..groupchat = groupchat,
    ),
  );

  return firestoreData;
}
