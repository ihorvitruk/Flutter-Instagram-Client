import 'package:flutter/material.dart';
import 'package:flutter_telegram_client/presentation/base/BaseView.dart';
import 'package:flutter_telegram_client/presentation/contacts/ContactsPresenter.dart';
import 'package:flutter_telegram_client/presentation/contacts/ContactsViewCallback.dart';

class ContactsView extends BaseView<ContactsState> {
  @override
  ContactsState state() => ContactsState();
}

class ContactsState extends BaseState<ContactsPresenter>
    implements ContactsViewCallback {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text("Contacts"));
  }
}
