// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'events_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<EventsRecord> _$eventsRecordSerializer =
    new _$EventsRecordSerializer();

class _$EventsRecordSerializer implements StructuredSerializer<EventsRecord> {
  @override
  final Iterable<Type> types = const [EventsRecord, _$EventsRecord];
  @override
  final String wireName = 'EventsRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, EventsRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.description;
    if (value != null) {
      result
        ..add('description')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.date;
    if (value != null) {
      result
        ..add('date')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.time;
    if (value != null) {
      result
        ..add('time')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.activity;
    if (value != null) {
      result
        ..add('activity')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.playerage;
    if (value != null) {
      result
        ..add('playerage')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.playercount;
    if (value != null) {
      result
        ..add('playercount')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.locationname;
    if (value != null) {
      result
        ..add('locationname')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.eventsportname;
    if (value != null) {
      result
        ..add('eventsportname')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.courtRef;
    if (value != null) {
      result
        ..add('courtRef')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.groupChatRef;
    if (value != null) {
      result
        ..add('groupChatRef')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.dateTimeStamp;
    if (value != null) {
      result
        ..add('dateTimeStamp')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.latLngLocation;
    if (value != null) {
      result
        ..add('LatLngLocation')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(LatLng)));
    }
    value = object.zipcode;
    if (value != null) {
      result
        ..add('Zipcode')
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
    value = object.address;
    if (value != null) {
      result
        ..add('Address')
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
  EventsRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new EventsRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'description':
          result.description = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'date':
          result.date = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'time':
          result.time = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'activity':
          result.activity = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'playerage':
          result.playerage = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'playercount':
          result.playercount = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'locationname':
          result.locationname = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'eventsportname':
          result.eventsportname = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'courtRef':
          result.courtRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'groupChatRef':
          result.groupChatRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'dateTimeStamp':
          result.dateTimeStamp = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'LatLngLocation':
          result.latLngLocation = serializers.deserialize(value,
              specifiedType: const FullType(LatLng)) as LatLng?;
          break;
        case 'Zipcode':
          result.zipcode = serializers.deserialize(value,
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
        case 'Address':
          result.address = serializers.deserialize(value,
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

class _$EventsRecord extends EventsRecord {
  @override
  final String? description;
  @override
  final String? date;
  @override
  final String? time;
  @override
  final String? activity;
  @override
  final String? playerage;
  @override
  final String? playercount;
  @override
  final String? locationname;
  @override
  final String? eventsportname;
  @override
  final DocumentReference<Object?>? courtRef;
  @override
  final DocumentReference<Object?>? groupChatRef;
  @override
  final DateTime? dateTimeStamp;
  @override
  final LatLng? latLngLocation;
  @override
  final String? zipcode;
  @override
  final String? city;
  @override
  final String? state;
  @override
  final String? address;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$EventsRecord([void Function(EventsRecordBuilder)? updates]) =>
      (new EventsRecordBuilder()..update(updates))._build();

  _$EventsRecord._(
      {this.description,
      this.date,
      this.time,
      this.activity,
      this.playerage,
      this.playercount,
      this.locationname,
      this.eventsportname,
      this.courtRef,
      this.groupChatRef,
      this.dateTimeStamp,
      this.latLngLocation,
      this.zipcode,
      this.city,
      this.state,
      this.address,
      this.ffRef})
      : super._();

  @override
  EventsRecord rebuild(void Function(EventsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  EventsRecordBuilder toBuilder() => new EventsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is EventsRecord &&
        description == other.description &&
        date == other.date &&
        time == other.time &&
        activity == other.activity &&
        playerage == other.playerage &&
        playercount == other.playercount &&
        locationname == other.locationname &&
        eventsportname == other.eventsportname &&
        courtRef == other.courtRef &&
        groupChatRef == other.groupChatRef &&
        dateTimeStamp == other.dateTimeStamp &&
        latLngLocation == other.latLngLocation &&
        zipcode == other.zipcode &&
        city == other.city &&
        state == other.state &&
        address == other.address &&
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
                                                                        0,
                                                                        description
                                                                            .hashCode),
                                                                    date.hashCode),
                                                                time.hashCode),
                                                            activity.hashCode),
                                                        playerage.hashCode),
                                                    playercount.hashCode),
                                                locationname.hashCode),
                                            eventsportname.hashCode),
                                        courtRef.hashCode),
                                    groupChatRef.hashCode),
                                dateTimeStamp.hashCode),
                            latLngLocation.hashCode),
                        zipcode.hashCode),
                    city.hashCode),
                state.hashCode),
            address.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'EventsRecord')
          ..add('description', description)
          ..add('date', date)
          ..add('time', time)
          ..add('activity', activity)
          ..add('playerage', playerage)
          ..add('playercount', playercount)
          ..add('locationname', locationname)
          ..add('eventsportname', eventsportname)
          ..add('courtRef', courtRef)
          ..add('groupChatRef', groupChatRef)
          ..add('dateTimeStamp', dateTimeStamp)
          ..add('latLngLocation', latLngLocation)
          ..add('zipcode', zipcode)
          ..add('city', city)
          ..add('state', state)
          ..add('address', address)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class EventsRecordBuilder
    implements Builder<EventsRecord, EventsRecordBuilder> {
  _$EventsRecord? _$v;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  String? _date;
  String? get date => _$this._date;
  set date(String? date) => _$this._date = date;

  String? _time;
  String? get time => _$this._time;
  set time(String? time) => _$this._time = time;

  String? _activity;
  String? get activity => _$this._activity;
  set activity(String? activity) => _$this._activity = activity;

  String? _playerage;
  String? get playerage => _$this._playerage;
  set playerage(String? playerage) => _$this._playerage = playerage;

  String? _playercount;
  String? get playercount => _$this._playercount;
  set playercount(String? playercount) => _$this._playercount = playercount;

  String? _locationname;
  String? get locationname => _$this._locationname;
  set locationname(String? locationname) => _$this._locationname = locationname;

  String? _eventsportname;
  String? get eventsportname => _$this._eventsportname;
  set eventsportname(String? eventsportname) =>
      _$this._eventsportname = eventsportname;

  DocumentReference<Object?>? _courtRef;
  DocumentReference<Object?>? get courtRef => _$this._courtRef;
  set courtRef(DocumentReference<Object?>? courtRef) =>
      _$this._courtRef = courtRef;

  DocumentReference<Object?>? _groupChatRef;
  DocumentReference<Object?>? get groupChatRef => _$this._groupChatRef;
  set groupChatRef(DocumentReference<Object?>? groupChatRef) =>
      _$this._groupChatRef = groupChatRef;

  DateTime? _dateTimeStamp;
  DateTime? get dateTimeStamp => _$this._dateTimeStamp;
  set dateTimeStamp(DateTime? dateTimeStamp) =>
      _$this._dateTimeStamp = dateTimeStamp;

  LatLng? _latLngLocation;
  LatLng? get latLngLocation => _$this._latLngLocation;
  set latLngLocation(LatLng? latLngLocation) =>
      _$this._latLngLocation = latLngLocation;

  String? _zipcode;
  String? get zipcode => _$this._zipcode;
  set zipcode(String? zipcode) => _$this._zipcode = zipcode;

  String? _city;
  String? get city => _$this._city;
  set city(String? city) => _$this._city = city;

  String? _state;
  String? get state => _$this._state;
  set state(String? state) => _$this._state = state;

  String? _address;
  String? get address => _$this._address;
  set address(String? address) => _$this._address = address;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  EventsRecordBuilder() {
    EventsRecord._initializeBuilder(this);
  }

  EventsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _description = $v.description;
      _date = $v.date;
      _time = $v.time;
      _activity = $v.activity;
      _playerage = $v.playerage;
      _playercount = $v.playercount;
      _locationname = $v.locationname;
      _eventsportname = $v.eventsportname;
      _courtRef = $v.courtRef;
      _groupChatRef = $v.groupChatRef;
      _dateTimeStamp = $v.dateTimeStamp;
      _latLngLocation = $v.latLngLocation;
      _zipcode = $v.zipcode;
      _city = $v.city;
      _state = $v.state;
      _address = $v.address;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(EventsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$EventsRecord;
  }

  @override
  void update(void Function(EventsRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  EventsRecord build() => _build();

  _$EventsRecord _build() {
    final _$result = _$v ??
        new _$EventsRecord._(
            description: description,
            date: date,
            time: time,
            activity: activity,
            playerage: playerage,
            playercount: playercount,
            locationname: locationname,
            eventsportname: eventsportname,
            courtRef: courtRef,
            groupChatRef: groupChatRef,
            dateTimeStamp: dateTimeStamp,
            latLngLocation: latLngLocation,
            zipcode: zipcode,
            city: city,
            state: state,
            address: address,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
