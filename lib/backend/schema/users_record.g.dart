// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'users_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<UsersRecord> _$usersRecordSerializer = new _$UsersRecordSerializer();

class _$UsersRecordSerializer implements StructuredSerializer<UsersRecord> {
  @override
  final Iterable<Type> types = const [UsersRecord, _$UsersRecord];
  @override
  final String wireName = 'UsersRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, UsersRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.email;
    if (value != null) {
      result
        ..add('email')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.displayName;
    if (value != null) {
      result
        ..add('display_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.photoUrl;
    if (value != null) {
      result
        ..add('photo_url')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.uid;
    if (value != null) {
      result
        ..add('uid')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.createdTime;
    if (value != null) {
      result
        ..add('created_time')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.phoneNumber;
    if (value != null) {
      result
        ..add('phone_number')
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
    value = object.favsport;
    if (value != null) {
      result
        ..add('favsport')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.favteam;
    if (value != null) {
      result
        ..add('favteam')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.favplayer;
    if (value != null) {
      result
        ..add('favplayer')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.favsport2;
    if (value != null) {
      result
        ..add('favsport2')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.favsport3;
    if (value != null) {
      result
        ..add('favsport3')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.city;
    if (value != null) {
      result
        ..add('city')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.zips;
    if (value != null) {
      result
        ..add('zips')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.stateName;
    if (value != null) {
      result
        ..add('state_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.latLngLocation;
    if (value != null) {
      result
        ..add('LatLngLocation')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(LatLng)));
    }
    value = object.address;
    if (value != null) {
      result
        ..add('address')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.country;
    if (value != null) {
      result
        ..add('country')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.agreedToTerms;
    if (value != null) {
      result
        ..add('agreedToTerms')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.age;
    if (value != null) {
      result
        ..add('age')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.birthday;
    if (value != null) {
      result
        ..add('birthday')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.bio;
    if (value != null) {
      result
        ..add('bio')
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
  UsersRecord deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new UsersRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'email':
          result.email = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'display_name':
          result.displayName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'photo_url':
          result.photoUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'uid':
          result.uid = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'created_time':
          result.createdTime = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'phone_number':
          result.phoneNumber = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'username':
          result.username = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'favsport':
          result.favsport = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'favteam':
          result.favteam = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'favplayer':
          result.favplayer = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'favsport2':
          result.favsport2 = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'favsport3':
          result.favsport3 = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'city':
          result.city = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'zips':
          result.zips = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'state_name':
          result.stateName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'LatLngLocation':
          result.latLngLocation = serializers.deserialize(value,
              specifiedType: const FullType(LatLng)) as LatLng?;
          break;
        case 'address':
          result.address = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'country':
          result.country = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'agreedToTerms':
          result.agreedToTerms = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'age':
          result.age = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'birthday':
          result.birthday = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'bio':
          result.bio = serializers.deserialize(value,
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

class _$UsersRecord extends UsersRecord {
  @override
  final String? email;
  @override
  final String? displayName;
  @override
  final String? photoUrl;
  @override
  final String? uid;
  @override
  final DateTime? createdTime;
  @override
  final String? phoneNumber;
  @override
  final String? username;
  @override
  final String? favsport;
  @override
  final String? favteam;
  @override
  final String? favplayer;
  @override
  final String? favsport2;
  @override
  final String? favsport3;
  @override
  final String? city;
  @override
  final String? zips;
  @override
  final String? stateName;
  @override
  final LatLng? latLngLocation;
  @override
  final String? address;
  @override
  final String? country;
  @override
  final bool? agreedToTerms;
  @override
  final int? age;
  @override
  final DateTime? birthday;
  @override
  final String? bio;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$UsersRecord([void Function(UsersRecordBuilder)? updates]) =>
      (new UsersRecordBuilder()..update(updates))._build();

  _$UsersRecord._(
      {this.email,
      this.displayName,
      this.photoUrl,
      this.uid,
      this.createdTime,
      this.phoneNumber,
      this.username,
      this.favsport,
      this.favteam,
      this.favplayer,
      this.favsport2,
      this.favsport3,
      this.city,
      this.zips,
      this.stateName,
      this.latLngLocation,
      this.address,
      this.country,
      this.agreedToTerms,
      this.age,
      this.birthday,
      this.bio,
      this.ffRef})
      : super._();

  @override
  UsersRecord rebuild(void Function(UsersRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UsersRecordBuilder toBuilder() => new UsersRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UsersRecord &&
        email == other.email &&
        displayName == other.displayName &&
        photoUrl == other.photoUrl &&
        uid == other.uid &&
        createdTime == other.createdTime &&
        phoneNumber == other.phoneNumber &&
        username == other.username &&
        favsport == other.favsport &&
        favteam == other.favteam &&
        favplayer == other.favplayer &&
        favsport2 == other.favsport2 &&
        favsport3 == other.favsport3 &&
        city == other.city &&
        zips == other.zips &&
        stateName == other.stateName &&
        latLngLocation == other.latLngLocation &&
        address == other.address &&
        country == other.country &&
        agreedToTerms == other.agreedToTerms &&
        age == other.age &&
        birthday == other.birthday &&
        bio == other.bio &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc(
                                    $jc(
                                        $jc(
                                            $jc(
                                                $jc(
                                                    $jc(
                                                        $jc(
                                                            $jc(
                                                                $jc(
                                                                    $jc(
                                                                        $jc(
                                                                            $jc($jc($jc($jc($jc(0, email.hashCode), displayName.hashCode), photoUrl.hashCode), uid.hashCode),
                                                                                createdTime.hashCode),
                                                                            phoneNumber.hashCode),
                                                                        username.hashCode),
                                                                    favsport.hashCode),
                                                                favteam.hashCode),
                                                            favplayer.hashCode),
                                                        favsport2.hashCode),
                                                    favsport3.hashCode),
                                                city.hashCode),
                                            zips.hashCode),
                                        stateName.hashCode),
                                    latLngLocation.hashCode),
                                address.hashCode),
                            country.hashCode),
                        agreedToTerms.hashCode),
                    age.hashCode),
                birthday.hashCode),
            bio.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UsersRecord')
          ..add('email', email)
          ..add('displayName', displayName)
          ..add('photoUrl', photoUrl)
          ..add('uid', uid)
          ..add('createdTime', createdTime)
          ..add('phoneNumber', phoneNumber)
          ..add('username', username)
          ..add('favsport', favsport)
          ..add('favteam', favteam)
          ..add('favplayer', favplayer)
          ..add('favsport2', favsport2)
          ..add('favsport3', favsport3)
          ..add('city', city)
          ..add('zips', zips)
          ..add('stateName', stateName)
          ..add('latLngLocation', latLngLocation)
          ..add('address', address)
          ..add('country', country)
          ..add('agreedToTerms', agreedToTerms)
          ..add('age', age)
          ..add('birthday', birthday)
          ..add('bio', bio)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class UsersRecordBuilder implements Builder<UsersRecord, UsersRecordBuilder> {
  _$UsersRecord? _$v;

  String? _email;
  String? get email => _$this._email;
  set email(String? email) => _$this._email = email;

  String? _displayName;
  String? get displayName => _$this._displayName;
  set displayName(String? displayName) => _$this._displayName = displayName;

  String? _photoUrl;
  String? get photoUrl => _$this._photoUrl;
  set photoUrl(String? photoUrl) => _$this._photoUrl = photoUrl;

  String? _uid;
  String? get uid => _$this._uid;
  set uid(String? uid) => _$this._uid = uid;

  DateTime? _createdTime;
  DateTime? get createdTime => _$this._createdTime;
  set createdTime(DateTime? createdTime) => _$this._createdTime = createdTime;

  String? _phoneNumber;
  String? get phoneNumber => _$this._phoneNumber;
  set phoneNumber(String? phoneNumber) => _$this._phoneNumber = phoneNumber;

  String? _username;
  String? get username => _$this._username;
  set username(String? username) => _$this._username = username;

  String? _favsport;
  String? get favsport => _$this._favsport;
  set favsport(String? favsport) => _$this._favsport = favsport;

  String? _favteam;
  String? get favteam => _$this._favteam;
  set favteam(String? favteam) => _$this._favteam = favteam;

  String? _favplayer;
  String? get favplayer => _$this._favplayer;
  set favplayer(String? favplayer) => _$this._favplayer = favplayer;

  String? _favsport2;
  String? get favsport2 => _$this._favsport2;
  set favsport2(String? favsport2) => _$this._favsport2 = favsport2;

  String? _favsport3;
  String? get favsport3 => _$this._favsport3;
  set favsport3(String? favsport3) => _$this._favsport3 = favsport3;

  String? _city;
  String? get city => _$this._city;
  set city(String? city) => _$this._city = city;

  String? _zips;
  String? get zips => _$this._zips;
  set zips(String? zips) => _$this._zips = zips;

  String? _stateName;
  String? get stateName => _$this._stateName;
  set stateName(String? stateName) => _$this._stateName = stateName;

  LatLng? _latLngLocation;
  LatLng? get latLngLocation => _$this._latLngLocation;
  set latLngLocation(LatLng? latLngLocation) =>
      _$this._latLngLocation = latLngLocation;

  String? _address;
  String? get address => _$this._address;
  set address(String? address) => _$this._address = address;

  String? _country;
  String? get country => _$this._country;
  set country(String? country) => _$this._country = country;

  bool? _agreedToTerms;
  bool? get agreedToTerms => _$this._agreedToTerms;
  set agreedToTerms(bool? agreedToTerms) =>
      _$this._agreedToTerms = agreedToTerms;

  int? _age;
  int? get age => _$this._age;
  set age(int? age) => _$this._age = age;

  DateTime? _birthday;
  DateTime? get birthday => _$this._birthday;
  set birthday(DateTime? birthday) => _$this._birthday = birthday;

  String? _bio;
  String? get bio => _$this._bio;
  set bio(String? bio) => _$this._bio = bio;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  UsersRecordBuilder() {
    UsersRecord._initializeBuilder(this);
  }

  UsersRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _email = $v.email;
      _displayName = $v.displayName;
      _photoUrl = $v.photoUrl;
      _uid = $v.uid;
      _createdTime = $v.createdTime;
      _phoneNumber = $v.phoneNumber;
      _username = $v.username;
      _favsport = $v.favsport;
      _favteam = $v.favteam;
      _favplayer = $v.favplayer;
      _favsport2 = $v.favsport2;
      _favsport3 = $v.favsport3;
      _city = $v.city;
      _zips = $v.zips;
      _stateName = $v.stateName;
      _latLngLocation = $v.latLngLocation;
      _address = $v.address;
      _country = $v.country;
      _agreedToTerms = $v.agreedToTerms;
      _age = $v.age;
      _birthday = $v.birthday;
      _bio = $v.bio;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UsersRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UsersRecord;
  }

  @override
  void update(void Function(UsersRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UsersRecord build() => _build();

  _$UsersRecord _build() {
    final _$result = _$v ??
        new _$UsersRecord._(
            email: email,
            displayName: displayName,
            photoUrl: photoUrl,
            uid: uid,
            createdTime: createdTime,
            phoneNumber: phoneNumber,
            username: username,
            favsport: favsport,
            favteam: favteam,
            favplayer: favplayer,
            favsport2: favsport2,
            favsport3: favsport3,
            city: city,
            zips: zips,
            stateName: stateName,
            latLngLocation: latLngLocation,
            address: address,
            country: country,
            agreedToTerms: agreedToTerms,
            age: age,
            birthday: birthday,
            bio: bio,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
