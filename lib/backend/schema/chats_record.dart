import 'dart:async';

import 'package:from_css_color/from_css_color.dart';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'chats_record.g.dart';

abstract class ChatsRecord implements Built<ChatsRecord, ChatsRecordBuilder> {
  static Serializer<ChatsRecord> get serializer => _$chatsRecordSerializer;

  BuiltList<DocumentReference>? get users;

  @BuiltValueField(wireName: 'user_a')
  DocumentReference? get userA;

  @BuiltValueField(wireName: 'user_b')
  DocumentReference? get userB;

  @BuiltValueField(wireName: 'last_message')
  String? get lastMessage;

  @BuiltValueField(wireName: 'last_message_time')
  DateTime? get lastMessageTime;

  @BuiltValueField(wireName: 'last_message_sent_by')
  DocumentReference? get lastMessageSentBy;

  @BuiltValueField(wireName: 'last_message_seen_by')
  BuiltList<DocumentReference>? get lastMessageSeenBy;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(ChatsRecordBuilder builder) => builder
    ..users = ListBuilder()
    ..lastMessage = ''
    ..lastMessageSeenBy = ListBuilder();

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('chats');

  static Stream<ChatsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<ChatsRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static ChatsRecord fromAlgolia(AlgoliaObjectSnapshot snapshot) => ChatsRecord(
        (c) => c
          ..users = safeGet(
              () => ListBuilder(snapshot.data['users'].map((s) => toRef(s))))
          ..userA = safeGet(() => toRef(snapshot.data['user_a']))
          ..userB = safeGet(() => toRef(snapshot.data['user_b']))
          ..lastMessage = snapshot.data['last_message']
          ..lastMessageTime = safeGet(() => DateTime.fromMillisecondsSinceEpoch(
              snapshot.data['last_message_time']))
          ..lastMessageSentBy =
              safeGet(() => toRef(snapshot.data['last_message_sent_by']))
          ..lastMessageSeenBy = safeGet(() => ListBuilder(
              snapshot.data['last_message_seen_by'].map((s) => toRef(s))))
          ..ffRef = ChatsRecord.collection.doc(snapshot.objectID),
      );

  static Future<List<ChatsRecord>> search(
          {String? term,
          FutureOr<LatLng>? location,
          int? maxResults,
          double? searchRadiusMeters}) =>
      FFAlgoliaManager.instance
          .algoliaQuery(
            index: 'chats',
            term: term,
            maxResults: maxResults,
            location: location,
            searchRadiusMeters: searchRadiusMeters,
          )
          .then((r) => r.map(fromAlgolia).toList());

  ChatsRecord._();
  factory ChatsRecord([void Function(ChatsRecordBuilder) updates]) =
      _$ChatsRecord;

  static ChatsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createChatsRecordData({
  DocumentReference? userA,
  DocumentReference? userB,
  String? lastMessage,
  DateTime? lastMessageTime,
  DocumentReference? lastMessageSentBy,
}) {
  final firestoreData = serializers.toFirestore(
    ChatsRecord.serializer,
    ChatsRecord(
      (c) => c
        ..users = null
        ..userA = userA
        ..userB = userB
        ..lastMessage = lastMessage
        ..lastMessageTime = lastMessageTime
        ..lastMessageSentBy = lastMessageSentBy
        ..lastMessageSeenBy = null,
    ),
  );

  return firestoreData;
}
