import 'package:guilt_app/utils/Global_methods/SocketService.dart';

class G {
  // Socket
  static SocketUtils socketUtils = SocketUtils();

  // static List<User> dummyUsers;
  //
  // // Logged In User
  // static User loggedInUser;
  //
  // // Single Chat - To Chat User
  // static User toChatUser;

  static initSocket() {
    socketUtils = SocketUtils();
    socketUtils.initSocket();
  }
  static String convertToAgo(DateTime input){
    Duration diff = DateTime.now().difference(input);

    if(diff.inDays >= 1){
      return '${diff.inDays} day(s) ago';
    } else if(diff.inHours >= 1){
      return '${diff.inHours} hour(s) ago';
    } else if(diff.inMinutes >= 1){
      return '${diff.inMinutes} minute(s) ago';
    } else if (diff.inSeconds >= 1){
      return '${diff.inSeconds} second(s) ago';
    } else {
      return 'just now';
    }
  }
// static void initDummyUsers() {
//   User userA = new User(id: 1000, name: 'A', email: 'testa@gmail.com');
//   User userB = new User(id: 1001, name: 'B', email: 'testb@gmail.com');
//   dummyUsers = List<User>();
//   dummyUsers.add(userA);
//   dummyUsers.add(userB);
// }
//
// static List<User> getUsersFor(User user) {
//   List<User> filteredUsers = dummyUsers
//       .where((u) => (!u.name.toLowerCase().contains(user.name.toLowerCase())))
//       .toList();
//   return filteredUsers;
// }
}
