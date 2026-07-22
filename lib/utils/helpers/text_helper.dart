// Format teks, kapitalisasi, pemotongan string, dll bisa dibuat reusable agar tidak perlu ditulis berulang
class TextHelper {
  static String capitalize(String input) {
    if (input.isEmpty) return input;
    return input[0].toUpperCase() + input.substring(1).toLowerCase();
  }

  static String formatFullName(String firstName, String lastName) {
    return '${firstName.trim()} ${lastName.trim()}';
  }

  static String toLower(String input) {
    return input.toLowerCase();
  }

  static String truncate(String input, int maxLength) {
    if (input.length <= maxLength) return input;
    return '${input.substring(0, maxLength)}...';
  }
}
