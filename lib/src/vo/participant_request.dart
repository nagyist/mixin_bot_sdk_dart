import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:mixin_bot_sdk_dart/src/vo/participant_role.dart';

part 'participant_request.g.dart';

@JsonSerializable()
@ParticipantRoleJsonConverter()
class ParticipantRequest with EquatableMixin {
  @JsonKey(name: 'user_id')
  String userId;
  @JsonKey(name: 'role')
  ParticipantRole? role;
  @JsonKey(name: 'created_at')
  DateTime? createdAt;

  ParticipantRequest({
    required this.userId,
    this.role,
    this.createdAt,
  });

  factory ParticipantRequest.fromJson(Map<String, dynamic> json) =>
      _$ParticipantRequestFromJson(json);

  Map<String, dynamic> toJson() => _$ParticipantRequestToJson(this);

  @override
  List<Object?> get props => [
        userId,
        role,
        createdAt,
      ];
}

const RelationshipActionAdd = 'ADD';
const RelationshipActionUpdate = 'UPDATE';
const RelationshipActionRemove = 'REMOVE';
const RelationshipActionBlock = 'BLOCK';
const RelationshipActionUnblock = 'UNBLOCK';
