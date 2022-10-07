import 'dart:io';
import 'models/Contact.dart';
import 'models/PhoneBook.dart';

bool isNumericUsing_tryParse(String? string) {
  // Null or empty string is not a number
  if (string == null || string.isEmpty) {
    return false;
  }

  // Try to parse input string to number.
  // Both integer and double work.
  // Use int.tryParse if you want to check integer only.
  // Use double.tryParse if you want to check double only.
  final number = int.tryParse(string);

  if (number == null || number.isNegative) {
    return false;
  }

  return true;
}

bool isString(String? string) {
  // Null or empty string is not a number
  if (string == null || string.isEmpty) {
    return false;
  }

  return true;
}

List<Contact> populateContacts(List<Contact> contacts) {
  contacts.add(Contact("Danisa", "Limocon", "0912378324", "PlanetMars", 001));
  contacts.add(Contact("Lourinsi", "Husky", "0912372315", "Florida", 002));
  contacts.add(Contact("Lebron", "James", "021237314", "Cleveland", 003));
  contacts.add(Contact("Kobe", "Bryant", "021242315", "Lakers", 004));
  contacts.add(Contact("Luka", "Doncic", "0612363329", "Dallas", 005));

  return contacts;
}

Contact addNewContact(int contactID) {
  print("--------ADD NEW CONTACT----------");
  String? firstName;
  do {
    stdout.writeln('First Name: ');
    firstName = stdin.readLineSync();
    if (isString(firstName) == false) {
      print("Please enter a name.");
    }
  } while (isString(firstName) == false);

  String? lastName;
  do {
    stdout.writeln('Last Name: ');
    lastName = stdin.readLineSync();
    if (isString(lastName) == false) {
      print("Please enter a name.");
    }
  } while (isString(lastName) == false);

  String? phoneNumber;
  do {
    stdout.writeln('Phone Number: ');
    phoneNumber = stdin.readLineSync();
    if (isNumericUsing_tryParse(phoneNumber) == false) {
      print('Please input a whole integer.');
    }
  } while (isNumericUsing_tryParse(phoneNumber) == false);

  String? address;
  do {
    stdout.writeln('Address: ');
    address = stdin.readLineSync();
    if (isString(address) == false) {
      print("Please enter an Address.");
    }
  } while (isString(address) == false);

  return Contact(firstName, lastName, phoneNumber, address, contactID);
}

void deleteID(PhoneBook phonebook) {
  stdout.writeln('Delete ID: ');
  var ID = stdin.readLineSync();
  if (isNumericUsing_tryParse(ID)) {
    // print('parsing');
    var IDint = int.parse(ID ?? "");
    phonebook.deleteContact(IDint);
  } else {
    print('Please input a whole integer.');
  }
}

void findID(PhoneBook phonebook) {
  stdout.writeln('Find ID: ');
  var ID = stdin.readLineSync();
  if (isNumericUsing_tryParse(ID) == true) {
    var IDint = int.parse(ID ?? "");
    phonebook.displayContact(IDint);
  } else {
    print('Please input a whole integer.');
  }
}

void main() {
  List<Contact> contacts = <Contact>[];
  PhoneBook phonebook = PhoneBook(populateContacts(contacts));
  print('---------Displaying All Contacts---------');
  phonebook.displayAllContacts();

  contacts.add(addNewContact(contacts.last.id + 1));
  print('---------New Contact Added---------');

  print('---------Displaying All Contacts---------');
  phonebook.displayAllContacts();

  deleteID(phonebook);
  print('---------Displaying All Contacts---------');
  phonebook.displayAllContacts();

  findID(phonebook);
}
