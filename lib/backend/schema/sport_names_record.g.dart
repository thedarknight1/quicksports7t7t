// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sport_names_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<SportNamesRecord> _$sportNamesRecordSerializer =
    new _$SportNamesRecordSerializer();

class _$SportNamesRecordSerializer
    implements StructuredSerializer<SportNamesRecord> {
  @override
  final Iterable<Type> types = const [SportNamesRecord, _$SportNamesRecord];
  @override
  final String wireName = 'SportNamesRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, SportNamesRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.sportName;
    if (value != null) {
      result
        ..add('sportName')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
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
  SportNamesRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new SportNamesRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'sportName':
          result.sportName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
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

class _$SportNamesRecord extends SportNamesRecord {
  @override
  final String? sportName;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$SportNamesRecord(
          [void Function(SportNamesRecordBuilder)? updates]) =>
      (new SportNamesRecordBuilder()..update(updates))._build();

  _$SportNamesRecord._({this.sportName, this.ffRef}) : super._();

  @override
  SportNamesRecord rebuild(void Function(SportNamesRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SportNamesRecordBuilder toBuilder() =>
      new SportNamesRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SportNamesRecord &&
        sportName == other.sportName &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, sportName.hashCode), ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'SportNamesRecord')
          ..add('sportName', sportName)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class SportNamesRecordBuilder
    implements Builder<SportNamesRecord, SportNamesRecordBuilder> {
  _$SportNamesRecord? _$v;

  String? _sportName;
  String? get sportName => _$this._sportName;
  set sportName(String? sportName) => _$this._sportName = sportName;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  SportNamesRecordBuilder() {
    SportNamesRecord._initializeBuilder(this);
  }

  SportNamesRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _sportName = $v.sportName;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SportNamesRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SportNamesRecord;
  }

  @override
  void update(void Function(SportNamesRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SportNamesRecord build() => _build();

  _$SportNamesRecord _build() {
    final _$result =
        _$v ?? new _$SportNamesRecord._(sportName: sportName, ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
