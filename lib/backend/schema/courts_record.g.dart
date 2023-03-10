// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'courts_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<CourtsRecord> _$courtsRecordSerializer =
    new _$CourtsRecordSerializer();

class _$CourtsRecordSerializer implements StructuredSerializer<CourtsRecord> {
  @override
  final Iterable<Type> types = const [CourtsRecord, _$CourtsRecord];
  @override
  final String wireName = 'CourtsRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, CourtsRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.name;
    if (value != null) {
      result
        ..add('name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.location;
    if (value != null) {
      result
        ..add('location')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(LatLng)));
    }
    value = object.createdAt;
    if (value != null) {
      result
        ..add('created_at')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.user;
    if (value != null) {
      result
        ..add('user')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.description;
    if (value != null) {
      result
        ..add('description')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.likes;
    if (value != null) {
      result
        ..add('likes')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.value;
    if (value != null) {
      result
        ..add('value')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.imageUrl;
    if (value != null) {
      result
        ..add('image_url')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.isIndoor;
    if (value != null) {
      result
        ..add('is_indoor')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.videoUrl;
    if (value != null) {
      result
        ..add('video_url')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.sportname;
    if (value != null) {
      result
        ..add('sportname')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.bio;
    if (value != null) {
      result
        ..add('bio')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.sportList;
    if (value != null) {
      result
        ..add('sportList')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    value = object.sport2name;
    if (value != null) {
      result
        ..add('sport2name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.sport3name;
    if (value != null) {
      result
        ..add('sport3name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.address;
    if (value != null) {
      result
        ..add('Address')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.city;
    if (value != null) {
      result
        ..add('City')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.state;
    if (value != null) {
      result
        ..add('State')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.zipcode;
    if (value != null) {
      result
        ..add('Zipcode')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.country;
    if (value != null) {
      result
        ..add('Country')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.isPaid;
    if (value != null) {
      result
        ..add('is_paid')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.website;
    if (value != null) {
      result
        ..add('website')
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
  CourtsRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new CourtsRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'location':
          result.location = serializers.deserialize(value,
              specifiedType: const FullType(LatLng)) as LatLng?;
          break;
        case 'created_at':
          result.createdAt = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'user':
          result.user = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'description':
          result.description = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'likes':
          result.likes = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'value':
          result.value = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'image_url':
          result.imageUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'is_indoor':
          result.isIndoor = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'video_url':
          result.videoUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'sportname':
          result.sportname = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'bio':
          result.bio = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'sportList':
          result.sportList.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
        case 'sport2name':
          result.sport2name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'sport3name':
          result.sport3name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'Address':
          result.address = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'City':
          result.city = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'State':
          result.state = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'Zipcode':
          result.zipcode = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'Country':
          result.country = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'is_paid':
          result.isPaid = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'website':
          result.website = serializers.deserialize(value,
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

class _$CourtsRecord extends CourtsRecord {
  @override
  final String? name;
  @override
  final LatLng? location;
  @override
  final DateTime? createdAt;
  @override
  final DocumentReference<Object?>? user;
  @override
  final String? description;
  @override
  final int? likes;
  @override
  final double? value;
  @override
  final String? imageUrl;
  @override
  final bool? isIndoor;
  @override
  final String? videoUrl;
  @override
  final String? sportname;
  @override
  final String? bio;
  @override
  final BuiltList<String>? sportList;
  @override
  final String? sport2name;
  @override
  final String? sport3name;
  @override
  final String? address;
  @override
  final String? city;
  @override
  final String? state;
  @override
  final String? zipcode;
  @override
  final String? country;
  @override
  final bool? isPaid;
  @override
  final String? website;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$CourtsRecord([void Function(CourtsRecordBuilder)? updates]) =>
      (new CourtsRecordBuilder()..update(updates))._build();

  _$CourtsRecord._(
      {this.name,
      this.location,
      this.createdAt,
      this.user,
      this.description,
      this.likes,
      this.value,
      this.imageUrl,
      this.isIndoor,
      this.videoUrl,
      this.sportname,
      this.bio,
      this.sportList,
      this.sport2name,
      this.sport3name,
      this.address,
      this.city,
      this.state,
      this.zipcode,
      this.country,
      this.isPaid,
      this.website,
      this.ffRef})
      : super._();

  @override
  CourtsRecord rebuild(void Function(CourtsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CourtsRecordBuilder toBuilder() => new CourtsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CourtsRecord &&
        name == other.name &&
        location == other.location &&
        createdAt == other.createdAt &&
        user == other.user &&
        description == other.description &&
        likes == other.likes &&
        value == other.value &&
        imageUrl == other.imageUrl &&
        isIndoor == other.isIndoor &&
        videoUrl == other.videoUrl &&
        sportname == other.sportname &&
        bio == other.bio &&
        sportList == other.sportList &&
        sport2name == other.sport2name &&
        sport3name == other.sport3name &&
        address == other.address &&
        city == other.city &&
        state == other.state &&
        zipcode == other.zipcode &&
        country == other.country &&
        isPaid == other.isPaid &&
        website == other.website &&
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
                                                                            $jc($jc($jc($jc($jc(0, name.hashCode), location.hashCode), createdAt.hashCode), user.hashCode),
                                                                                description.hashCode),
                                                                            likes.hashCode),
                                                                        value.hashCode),
                                                                    imageUrl.hashCode),
                                                                isIndoor.hashCode),
                                                            videoUrl.hashCode),
                                                        sportname.hashCode),
                                                    bio.hashCode),
                                                sportList.hashCode),
                                            sport2name.hashCode),
                                        sport3name.hashCode),
                                    address.hashCode),
                                city.hashCode),
                            state.hashCode),
                        zipcode.hashCode),
                    country.hashCode),
                isPaid.hashCode),
            website.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CourtsRecord')
          ..add('name', name)
          ..add('location', location)
          ..add('createdAt', createdAt)
          ..add('user', user)
          ..add('description', description)
          ..add('likes', likes)
          ..add('value', value)
          ..add('imageUrl', imageUrl)
          ..add('isIndoor', isIndoor)
          ..add('videoUrl', videoUrl)
          ..add('sportname', sportname)
          ..add('bio', bio)
          ..add('sportList', sportList)
          ..add('sport2name', sport2name)
          ..add('sport3name', sport3name)
          ..add('address', address)
          ..add('city', city)
          ..add('state', state)
          ..add('zipcode', zipcode)
          ..add('country', country)
          ..add('isPaid', isPaid)
          ..add('website', website)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class CourtsRecordBuilder
    implements Builder<CourtsRecord, CourtsRecordBuilder> {
  _$CourtsRecord? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  LatLng? _location;
  LatLng? get location => _$this._location;
  set location(LatLng? location) => _$this._location = location;

  DateTime? _createdAt;
  DateTime? get createdAt => _$this._createdAt;
  set createdAt(DateTime? createdAt) => _$this._createdAt = createdAt;

  DocumentReference<Object?>? _user;
  DocumentReference<Object?>? get user => _$this._user;
  set user(DocumentReference<Object?>? user) => _$this._user = user;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  int? _likes;
  int? get likes => _$this._likes;
  set likes(int? likes) => _$this._likes = likes;

  double? _value;
  double? get value => _$this._value;
  set value(double? value) => _$this._value = value;

  String? _imageUrl;
  String? get imageUrl => _$this._imageUrl;
  set imageUrl(String? imageUrl) => _$this._imageUrl = imageUrl;

  bool? _isIndoor;
  bool? get isIndoor => _$this._isIndoor;
  set isIndoor(bool? isIndoor) => _$this._isIndoor = isIndoor;

  String? _videoUrl;
  String? get videoUrl => _$this._videoUrl;
  set videoUrl(String? videoUrl) => _$this._videoUrl = videoUrl;

  String? _sportname;
  String? get sportname => _$this._sportname;
  set sportname(String? sportname) => _$this._sportname = sportname;

  String? _bio;
  String? get bio => _$this._bio;
  set bio(String? bio) => _$this._bio = bio;

  ListBuilder<String>? _sportList;
  ListBuilder<String> get sportList =>
      _$this._sportList ??= new ListBuilder<String>();
  set sportList(ListBuilder<String>? sportList) =>
      _$this._sportList = sportList;

  String? _sport2name;
  String? get sport2name => _$this._sport2name;
  set sport2name(String? sport2name) => _$this._sport2name = sport2name;

  String? _sport3name;
  String? get sport3name => _$this._sport3name;
  set sport3name(String? sport3name) => _$this._sport3name = sport3name;

  String? _address;
  String? get address => _$this._address;
  set address(String? address) => _$this._address = address;

  String? _city;
  String? get city => _$this._city;
  set city(String? city) => _$this._city = city;

  String? _state;
  String? get state => _$this._state;
  set state(String? state) => _$this._state = state;

  String? _zipcode;
  String? get zipcode => _$this._zipcode;
  set zipcode(String? zipcode) => _$this._zipcode = zipcode;

  String? _country;
  String? get country => _$this._country;
  set country(String? country) => _$this._country = country;

  bool? _isPaid;
  bool? get isPaid => _$this._isPaid;
  set isPaid(bool? isPaid) => _$this._isPaid = isPaid;

  String? _website;
  String? get website => _$this._website;
  set website(String? website) => _$this._website = website;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  CourtsRecordBuilder() {
    CourtsRecord._initializeBuilder(this);
  }

  CourtsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _location = $v.location;
      _createdAt = $v.createdAt;
      _user = $v.user;
      _description = $v.description;
      _likes = $v.likes;
      _value = $v.value;
      _imageUrl = $v.imageUrl;
      _isIndoor = $v.isIndoor;
      _videoUrl = $v.videoUrl;
      _sportname = $v.sportname;
      _bio = $v.bio;
      _sportList = $v.sportList?.toBuilder();
      _sport2name = $v.sport2name;
      _sport3name = $v.sport3name;
      _address = $v.address;
      _city = $v.city;
      _state = $v.state;
      _zipcode = $v.zipcode;
      _country = $v.country;
      _isPaid = $v.isPaid;
      _website = $v.website;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CourtsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CourtsRecord;
  }

  @override
  void update(void Function(CourtsRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CourtsRecord build() => _build();

  _$CourtsRecord _build() {
    _$CourtsRecord _$result;
    try {
      _$result = _$v ??
          new _$CourtsRecord._(
              name: name,
              location: location,
              createdAt: createdAt,
              user: user,
              description: description,
              likes: likes,
              value: value,
              imageUrl: imageUrl,
              isIndoor: isIndoor,
              videoUrl: videoUrl,
              sportname: sportname,
              bio: bio,
              sportList: _sportList?.build(),
              sport2name: sport2name,
              sport3name: sport3name,
              address: address,
              city: city,
              state: state,
              zipcode: zipcode,
              country: country,
              isPaid: isPaid,
              website: website,
              ffRef: ffRef);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'sportList';
        _sportList?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'CourtsRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
