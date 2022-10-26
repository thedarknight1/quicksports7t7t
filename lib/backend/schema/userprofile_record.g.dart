// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'userprofile_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<UserprofileRecord> _$userprofileRecordSerializer =
    new _$UserprofileRecordSerializer();

class _$UserprofileRecordSerializer
    implements StructuredSerializer<UserprofileRecord> {
  @override
  final Iterable<Type> types = const [UserprofileRecord, _$UserprofileRecord];
  @override
  final String wireName = 'UserprofileRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, UserprofileRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.displayname;
    if (value != null) {
      result
        ..add('displayname')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.username;
    if (value != null) {
      result
        ..add('username')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.photourl;
    if (value != null) {
      result
        ..add('photourl')
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
  UserprofileRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new UserprofileRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'displayname':
          result.displayname = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'username':
          result.username = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'photourl':
          result.photourl = serializers.deserialize(value,
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

class _$UserprofileRecord extends UserprofileRecord {
  @override
  final String? displayname;
  @override
  final String? username;
  @override
  final String? photourl;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$UserprofileRecord(
          [void Function(UserprofileRecordBuilder)? updates]) =>
      (new UserprofileRecordBuilder()..update(updates))._build();

  _$UserprofileRecord._(
      {this.displayname, this.username, this.photourl, this.ffRef})
      : super._();

  @override
  UserprofileRecord rebuild(void Function(UserprofileRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UserprofileRecordBuilder toBuilder() =>
      new UserprofileRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserprofileRecord &&
        displayname == other.displayname &&
        username == other.username &&
        photourl == other.photourl &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, displayname.hashCode), username.hashCode),
            photourl.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UserprofileRecord')
          ..add('displayname', displayname)
          ..add('username', username)
          ..add('photourl', photourl)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class UserprofileRecordBuilder
    implements Builder<UserprofileRecord, UserprofileRecordBuilder> {
  _$UserprofileRecord? _$v;

  String? _displayname;
  String? get displayname => _$this._displayname;
  set displayname(String? displayname) => _$this._displayname = displayname;

  String? _username;
  String? get username => _$this._username;
  set username(String? username) => _$this._username = username;

  String? _photourl;
  String? get photourl => _$this._photourl;
  set photourl(String? photourl) => _$this._photourl = photourl;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  UserprofileRecordBuilder() {
    UserprofileRecord._initializeBuilder(this);
  }

  UserprofileRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _displayname = $v.displayname;
      _username = $v.username;
      _photourl = $v.photourl;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UserprofileRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UserprofileRecord;
  }

  @override
  void update(void Function(UserprofileRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UserprofileRecord build() => _build();

  _$UserprofileRecord _build() {
    final _$result = _$v ??
        new _$UserprofileRecord._(
            displayname: displayname,
            username: username,
            photourl: photourl,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
