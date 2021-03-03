class Util {
  static const priorities = ['High', 'Low'];

  static String getPrioritiyAsString(int value) {
    String priority;
    switch (value) {
      case 1:
        priority = priorities[0];
        break;
      case 2:
        priority = priorities[1];
        break;
    }
    return priority;
  }
<<<<<<< HEAD
} 
=======
}
>>>>>>> 8e37f0c385649d96f5e056622c6341add55790db
