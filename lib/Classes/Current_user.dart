class CurrentUser {
  CurrentUser() {
    QRText = 'MECARD:N:' +
        this.lastName +
        ',' +
        this.firstName +
        ';EMAIL:' +
        this.email +
        ';TEL:' +
        this.phone +
        ';';
  }
  String firstName = '';
  String lastName = 'Varghese';

  String designation = 'Engineer';

  String phone = '+91-9446050001';
  String email = 'mathewvarghesemanu@gmail.com';
  String QRText;
}

class NewUser {
  String firstName;
  String lastName;

  String designation;
  var phone;
  var email;
}
