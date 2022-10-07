import 'Contact.dart';

class PhoneBook {
  List<Contact> _contacts;
  PhoneBook(this._contacts);

  void displayAllContacts() {
    for (var contact in _contacts) {
      print("------------------");
      print("Id: ${contact.id}");
      print("Name: ${contact.firstName} ${contact.lastName}");
      print("Phone Number: ${contact.phoneNumber}");
      print("Address: ${contact.address}");
    }
  }

  Contact _dummyContact = Contact(
      "XXXXXX", "XXXXXX", "XXXXXX", "XXXXXX", 000); //If contact misinput

  Contact? _findContact(int id) {
    Contact? result =
        _contacts.firstWhere((x) => x.id == id, orElse: () => _dummyContact);
    return result;
  }

  void deleteContact(int id) {
    Contact? contact = _findContact(id);
    if (contact != null && contact != _dummyContact) {
      _contacts.removeWhere((x) => x.id == contact.id);
      print("---------Deleting Contact---------");
      print('ID ${contact.id} is deleted.');
    } else {
      print("$id is not found.");
    }
  }

  void displayContact(int id) {
    Contact? contact = _findContact(id);

    if (contact != null && contact != _dummyContact) {
      print("---------Displaying Specific Contact---------");
      print("Id: ${contact.id}");
      print("Name: ${contact.firstName} ${contact.lastName}");
      print("Phone Number: ${contact.phoneNumber}");
      print("Address: ${contact.address}");
    } else {
      print("$id is not found.");
    }
  }
}
