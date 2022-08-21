class LisaAccessItem {
  int id;
  String todoDetails;
  int todoStatus = 0;
  String dateCreated;

  LisaAccessItem(this.todoDetails, this.dateCreated);

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'id': id,
      'todoStatus': todoStatus,
      'todoDetails': todoDetails,
      'dateCreated': dateCreated,
    };
    return map;
  }

  LisaAccessItem.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    todoStatus = map['todoStatus'];
    todoDetails = map['todoDetails'];
    dateCreated = map['dateCreated'];
  }
}
