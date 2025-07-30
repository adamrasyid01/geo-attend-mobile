//  Reusable logic antar banyak widget/bloc/class

mixin FormValidationMixin {
  String? validateEmail(String? value) {
    if (value == null || !value.contains('@')) {
      return 'Invalid email';
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.length < 6) {
      return 'Password too short';
    }
    return null;
  }

  String? validateRequired(String? value) {
    if (value == null || value.isEmpty) {
      return 'This field is required';
    }
    return null;
  }
}
