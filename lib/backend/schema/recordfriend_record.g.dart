// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recordfriend_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<RecordfriendRecord> _$recordfriendRecordSerializer =
    new _$RecordfriendRecordSerializer();

class _$RecordfriendRecordSerializer
    implements StructuredSerializer<RecordfriendRecord> {
  @override
  final Iterable<Type> types = const [RecordfriendRecord, _$RecordfriendRecord];
  @override
  final String wireName = 'RecordfriendRecord';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, RecordfriendRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.statusRequest;
    if (value != null) {
      result
        ..add('Status_request')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.recipientChoice;
    if (value != null) {
      result
        ..add('Recipient_choice')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.applicantUID;
    if (value != null) {
      result
        ..add('Applicant_UID')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.recipientUID;
    if (value != null) {
      result
        ..add('Recipient_UID')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.ffRef;
    if (value != null) {
      result
        ..add('Document__Reference__Field')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    return result;
  }

  @override
  RecordfriendRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new RecordfriendRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'Status_request':
          result.statusRequest = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'Recipient_choice':
          result.recipientChoice = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'Applicant_UID':
          result.applicantUID = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'Recipient_UID':
          result.recipientUID = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'Document__Reference__Field':
          result.ffRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
      }
    }

    return result.build();
  }
}

class _$RecordfriendRecord extends RecordfriendRecord {
  @override
  final String? statusRequest;
  @override
  final bool? recipientChoice;
  @override
  final DocumentReference<Object?>? applicantUID;
  @override
  final DocumentReference<Object?>? recipientUID;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$RecordfriendRecord(
          [void Function(RecordfriendRecordBuilder)? updates]) =>
      (new RecordfriendRecordBuilder()..update(updates))._build();

  _$RecordfriendRecord._(
      {this.statusRequest,
      this.recipientChoice,
      this.applicantUID,
      this.recipientUID,
      this.ffRef})
      : super._();

  @override
  RecordfriendRecord rebuild(
          void Function(RecordfriendRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  RecordfriendRecordBuilder toBuilder() =>
      new RecordfriendRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is RecordfriendRecord &&
        statusRequest == other.statusRequest &&
        recipientChoice == other.recipientChoice &&
        applicantUID == other.applicantUID &&
        recipientUID == other.recipientUID &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc($jc($jc(0, statusRequest.hashCode), recipientChoice.hashCode),
                applicantUID.hashCode),
            recipientUID.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'RecordfriendRecord')
          ..add('statusRequest', statusRequest)
          ..add('recipientChoice', recipientChoice)
          ..add('applicantUID', applicantUID)
          ..add('recipientUID', recipientUID)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class RecordfriendRecordBuilder
    implements Builder<RecordfriendRecord, RecordfriendRecordBuilder> {
  _$RecordfriendRecord? _$v;

  String? _statusRequest;
  String? get statusRequest => _$this._statusRequest;
  set statusRequest(String? statusRequest) =>
      _$this._statusRequest = statusRequest;

  bool? _recipientChoice;
  bool? get recipientChoice => _$this._recipientChoice;
  set recipientChoice(bool? recipientChoice) =>
      _$this._recipientChoice = recipientChoice;

  DocumentReference<Object?>? _applicantUID;
  DocumentReference<Object?>? get applicantUID => _$this._applicantUID;
  set applicantUID(DocumentReference<Object?>? applicantUID) =>
      _$this._applicantUID = applicantUID;

  DocumentReference<Object?>? _recipientUID;
  DocumentReference<Object?>? get recipientUID => _$this._recipientUID;
  set recipientUID(DocumentReference<Object?>? recipientUID) =>
      _$this._recipientUID = recipientUID;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  RecordfriendRecordBuilder() {
    RecordfriendRecord._initializeBuilder(this);
  }

  RecordfriendRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _statusRequest = $v.statusRequest;
      _recipientChoice = $v.recipientChoice;
      _applicantUID = $v.applicantUID;
      _recipientUID = $v.recipientUID;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(RecordfriendRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$RecordfriendRecord;
  }

  @override
  void update(void Function(RecordfriendRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  RecordfriendRecord build() => _build();

  _$RecordfriendRecord _build() {
    final _$result = _$v ??
        new _$RecordfriendRecord._(
            statusRequest: statusRequest,
            recipientChoice: recipientChoice,
            applicantUID: applicantUID,
            recipientUID: recipientUID,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
