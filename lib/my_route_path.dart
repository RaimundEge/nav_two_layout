
class MyRoutePath {
  final String id;
  final bool isUnknown;

  MyRoutePath.home()
      : id = null,
        isUnknown = false;

  MyRoutePath.details(this.id) : isUnknown = false;

  MyRoutePath.unknown()
      : id = null,
        isUnknown = true;

  bool get isHomePage => id == null;

  bool get isDetailsPage => id != null;
 
  static const todayPage = 'today';
  static const inboxPage = 'inbox';
  static const clientsPage = 'clients';
  static const profilePage = 'profile';
  static const all = [todayPage, inboxPage, clientsPage, profilePage];
}
