class Note {
  int id;
  String noteName;
  String description;

  // Constructor with ID
  Note.withId(this.id, this.noteName, this.description);

  // Constructor without ID
  Note(this.id, this.noteName, this.description); // status güncelleniyor

  // Constructor without any info (Varsayılan değerler verilmesi gerekiyor)
  Note.withoutInfo()
      : id = 0,
        noteName = "",
        description = "";

  // Getter for first name
  String get getnoteName {
    return "Not - " + this.noteName;
  }

  // Setter for first name
  void set setnoteName(String value) {
    this.noteName = value;
  }
}