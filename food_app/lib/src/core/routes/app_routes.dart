class AppRoutes {
  static const String initial = '/';
  static const String home = initial;
  static const String second = '/second';
}

//Explanation
// Imagine your app is a big house with many rooms (pages/screens).

// You need a list of room names so you can tell the app which room (page) 
//to show when users go from one page to another.

// The AppRoutes class is like a map or list where you keep track of the room names.

// The first room, or the room that people enter when they come to the house, 
//is the "initial" room (which is set as '/').

// You're also calling the main room "home" in your map, but it points to the same initial room.