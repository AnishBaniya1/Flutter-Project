class AppImage {
  static const String _path = 'assets/images';
  static const screen1 = '$_path/screen1.png';
  static const screen2 = '$_path/screen2.png';
  static const screen3 = '$_path/screen3.png';
  static const logo = '$_path/logo.png';
}

class AppFont {
  static const String poppins = 'Poppins';
}

//Explanation
// Imagine you have a folder named "images" inside an "assets" folder.

// You store different images there, like "screen1.png".

// Instead of writing the full path ('assets/images/screen1.png') every time
//you need this image, you create this AppImage class.


// Think of this class as a font name manager.

// Instead of writing "Poppins" everywhere in your code, you store it inside AppFont.poppins.

// If you ever decide to change the font, 
//you only need to update it once in AppFont instead of updating it in multiple places.