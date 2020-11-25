import 'package:bot_api_dart_client/src/vo/participant_request.dart';
import 'package:bot_api_dart_client/src/vo/relationship_request.dart';
import 'package:bot_api_dart_client/src/vo/user_session.dart';
import 'package:test/test.dart';
import 'package:bot_api_dart_client/bot_api_dart_client.dart';
import 'config.dart';

void main() {
  group('user apis', () {
    var client = Client('UA', uid, sid, private);

    test('test getMe', () async {
        await client.userApi.getMe().then((response) {
          response.data.handleResponse<User>(
              onSuccess: (User user) {
                print(user.toJson());
              },
              onFailure: (MixinError error) => {print(error.toJson())});
        });
    });

    test('test getUsers', () async {
      await client.userApi.getUsers(uids).then((response) {
          response.data.handleResponse<List<User>>(
              onSuccess: (List<User> users) {
                print(users.map((e) => e.toJson()).toList());
              },
              onFailure: (MixinError error) => {print(error.toJson())});
      }); 
    });

    test('test getUserById', () async {
      var id = '773e5e77-4107-45c2-b648-8fc722ed77f5';
      await client.userApi.getUserById(id).then((response) {
          response.data.handleResponse<User>(
              onSuccess: (User user) {
                print(user.toJson());
              },
              onFailure: (MixinError error) => {print(error.toJson())});
      }); 
    });
    
    test('test relationships', () async {
      await client.userApi.relationships(mockRelationshipRequest).then((response) {
        response.data.handleResponse<User>(
          onSuccess: (User user) {
            print(user.toJson());
          },
          onFailure: (MixinError error) => {print(error.toJson())}
        );
      });
    });

    test('test report', () async {
      await client.userApi.report(mockRelationshipRequest).then((response) {
        response.data.handleResponse<User>(
          onSuccess: (User user) {
            print(user.toJson());
          },
          onFailure: (MixinError error) => {print(error.toJson())}
        );
      });
    });

    test('test blockingUsers', () async {
      await client.userApi.blockingUsers().then((response) {
        response.data.handleResponse<List<User>>(
            onSuccess: (List<User> users) {
              print(users.map((e) => e.toJson()).toList());
            },
            onFailure: (MixinError error) => {print(error.toJson())}
        );
      });
    });
  });
 
  test('test getSessions', () async {
    var client = Client('UA', uid, sid, private);
    await client.userApi.getSessions(uids).then((response) {
        response.data.handleResponse<List<UserSession>>(
            onSuccess: (List<UserSession> userSessions) {
              print(userSessions.map((e) => e.toJson()).toList());
            },
            onFailure: (MixinError error) => {print(error.toJson())}
        );
      });
  });
}