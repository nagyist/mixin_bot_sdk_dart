// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'blaze_ack_message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BlazeAckMessage _$BlazeAckMessageFromJson(Map<String, dynamic> json) =>
    BlazeAckMessage(
      messageId: json['message_id'] as String,
      status: json['status'] as String,
      expireAt: (json['expire_at'] as num?)?.toInt(),
    );

Map<String, dynamic> _$BlazeAckMessageToJson(BlazeAckMessage instance) =>
    <String, dynamic>{
      'message_id': instance.messageId,
      'status': instance.status,
      'expire_at': instance.expireAt,
    };
