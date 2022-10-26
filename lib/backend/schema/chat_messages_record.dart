import 'dart:async';

import 'package:from_css_color/from_css_color.dart';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'chat_messages_record.g.dart';

abstract class ChatMessagesRecord
    implements Built<ChatMessagesRecord, ChatMessagesRecordBuilder> {
  static Serializer<ChatMessagesRecord> get serializer =>
      _$chatMessagesRecordSerializer;

  DocumentReference? get user;

  DocumentReference? get chat;

  String? get text;

  String? get image;

  DateTime? get timestamp;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(ChatMessagesRecordBuilder builder) => builder
    ..text = ''
    ..image = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('chat_messages');

  static Stream<ChatMessagesRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<ChatMessagesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static ChatMessagesRecord fromAlgolia(AlgoliaObjectSnapshot snapshot) =>
      ChatMessagesRecord(
        (c) => c
          ..user = safeGet(() => toRef(snapshot.data['user']))
          ..chat = safeGet(() => toRef(snapshot.data['chat']))
          ..text = snapshot.data['text']
          ..image = snapshot.data['image']
          ..timestamp = safeGet(() =>
              DateTime.fromMillisecondsSinceEpoch(snapshot.data['timestamp']))
          ..ffRef = ChatMessagesRecord.collection.doc(snapshot.objectID),
      );

  static Future<List<ChatMessagesRecord>> search(
          {String? term,
          FutureOr<LatLng>? location,
          int? maxResults,
          double? searchRadiusMeters}) =>
      FFAlgoliaManager.instance
          .algoliaQuery(
            index: 'chat_messages',
            term: term,
            maxResults: maxResults,
            location: location,
            searchRadiusMeters: searchRadiusMeters,
          )
          .then((r) => r.map(fromAlgolia).toList());

  ChatMessagesRecord._();
  factory ChatMessagesRecord(
          [void Function(ChatMessagesRecordBuilder) updates]) =
      _$ChatMessagesRecord;

  static ChatMessagesRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createChatMessagesRecordData({
  DocumentReference? user,
  DocumentReference? chat,
  String? text,
  String? image,
  DateTime? timestamp,
}) {
  final firestoreData = serializers.toFirestore(
    ChatMessagesRecord.serializer,
    ChatMessagesRecord(
      (c) => c
        ..user = user
        ..chat = chat
        ..text = text
        ..image = image
        ..timestamp = timestamp,
    ),
  );

  return firestoreData;
}
