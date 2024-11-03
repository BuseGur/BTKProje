mixin NoteValidationMixin {
  String? validateNoteName(String? value) {
    if (value!.length >= 10) {
      return "Başlık en fazla on kelime olmalıdır.";
    }
    return null;
  }

  String? validateDescription(String? value) {
    if (value!.length >= 100) {
      return "Açıklama en fazla yüz kelime olmalıdır. ";
    }
    return null;
  }
}