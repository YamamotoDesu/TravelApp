import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'house_details_record.g.dart';

abstract class HouseDetailsRecord
    implements Built<HouseDetailsRecord, HouseDetailsRecordBuilder> {
  static Serializer<HouseDetailsRecord> get serializer =>
      _$houseDetailsRecordSerializer;

  @BuiltValueField(wireName: 'HomeName')
  String? get homeName;

  @BuiltValueField(wireName: 'Rating')
  double? get rating;

  @BuiltValueField(wireName: 'Image')
  String? get image;

  @BuiltValueField(wireName: 'Price')
  double? get price;

  @BuiltValueField(wireName: 'Description')
  String? get description;

  @BuiltValueField(wireName: 'Address')
  String? get address;

  @BuiltValueField(wireName: 'big_image')
  String? get bigImage;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(HouseDetailsRecordBuilder builder) => builder
    ..homeName = ''
    ..rating = 0.0
    ..image = ''
    ..price = 0.0
    ..description = ''
    ..address = ''
    ..bigImage = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('house_details');

  static Stream<HouseDetailsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<HouseDetailsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  HouseDetailsRecord._();
  factory HouseDetailsRecord(
          [void Function(HouseDetailsRecordBuilder) updates]) =
      _$HouseDetailsRecord;

  static HouseDetailsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createHouseDetailsRecordData({
  String? homeName,
  double? rating,
  String? image,
  double? price,
  String? description,
  String? address,
  String? bigImage,
}) {
  final firestoreData = serializers.toFirestore(
    HouseDetailsRecord.serializer,
    HouseDetailsRecord(
      (h) => h
        ..homeName = homeName
        ..rating = rating
        ..image = image
        ..price = price
        ..description = description
        ..address = address
        ..bigImage = bigImage,
    ),
  );

  return firestoreData;
}
