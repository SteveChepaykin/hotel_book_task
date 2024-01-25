class TouristModel {
  late final int i;
  late String name;
  late String secondname;
  late String birthday;
  late String citizenship;
  late String interpassnumber;
  late String interpassexpiry;

  TouristModel.empty(this.i) {
    name = '';
    secondname = '';
    birthday = '';
    citizenship = '';
    interpassnumber = '';
    interpassexpiry = '';
  }

  void setName(String newvalue) {
    name = newvalue;
  }

  void setSecondname(String newvalue) {
    secondname = newvalue;
  }

  void setBirthday(String newvalue) {
    birthday = newvalue;
  }

  void setCitizenship(String newvalue) {
    citizenship = newvalue;
  }

  void setInterpassnumber(String newvalue) {
    interpassnumber = newvalue;
  }

  void setInterpassexpiry(String newvalue) {
    interpassexpiry = newvalue;
  }

  bool check() {
    if(name != '' && secondname != '' && birthday != '' && citizenship != '' && interpassnumber != '' && interpassexpiry != '') {
      return true;
    } else {
      return false;
    }
  }
}