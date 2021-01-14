import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'provisioning.g.dart';

@JsonSerializable()
class Provisioning with EquatableMixin {
  @JsonKey(name: 'device_id')
  String deviceId;
  @JsonKey(name: 'expired_at')
  DateTime expiredAt;
  String secret;
  String platform;
  @JsonKey(name: 'provisioning_code')
  String provisioningCode;
  @JsonKey(name: 'session_id')
  String sessionId;
  @JsonKey(name: 'user_id')
  String userId;

  Provisioning({
    this.deviceId,
    this.expiredAt,
    this.secret,
    this.platform,
    this.provisioningCode,
    this.sessionId,
    this.userId,
  });

  factory Provisioning.fromJson(Map<String, dynamic> json) =>
      _$ProvisioningFromJson(json);

  Map<String, dynamic> toJson() => _$ProvisioningToJson(this);

  @override
  List<Object> get props => [
    deviceId,
    expiredAt,
    secret,
    platform,
    provisioningCode,
    sessionId,
    userId,
  ];
}
