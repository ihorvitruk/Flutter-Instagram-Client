import 'package:flutter/material.dart';
import 'package:flutter_telegram_client/presentation/base/BaseView.dart';
import 'package:flutter_telegram_client/presentation/contacts/ContactsPresenter.dart';

class ContactsWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ContactsView();
}

class ContactsView extends BaseView<ContactsPresenter> {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text("Contacts"));
  }
}
