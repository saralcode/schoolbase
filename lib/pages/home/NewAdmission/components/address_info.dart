import 'package:flutter/material.dart';

class AddressInfo extends StatefulWidget {
  const AddressInfo({Key? key}) : super(key: key);

  @override
  State<AddressInfo> createState() => _AddressInfoState();
}

class _AddressInfoState extends State<AddressInfo> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
            onChanged: (value) {},
            decoration: const InputDecoration(
              hintText: "Village, Post, PS, etc. ",
              constraints: BoxConstraints(maxWidth: 800),
              label: Text("Address Line 1"),
            )),
        const SizedBox(
          height: 20,
        ),
        TextFormField(
            onChanged: (value) {},
            decoration: const InputDecoration(
              hintText: "Street, Landmark, etc.",
              constraints: BoxConstraints(maxWidth: 800),
              label: Text("Address Line 2"),
            )),
        const SizedBox(
          height: 20,
        ),
        Wrap(
          spacing: 20, 
          runSpacing: 20,
          children: [
            TextFormField(
                onChanged: (value) {},
                decoration: const InputDecoration(
                  constraints: BoxConstraints(maxWidth: 390),
                  hintText: "City / District",
                  label: Text("City / District"),
                )),
            
            TextFormField(
                onChanged: (value) {},
                decoration: const InputDecoration(
                  constraints: BoxConstraints(maxWidth: 390),
                  hintText: "State / Province",
                  label: Text("State / Province"),
                )),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Wrap(
          spacing: 20,
          runSpacing: 20, 
          children: [
            TextFormField(
                onChanged: (value) {},
                decoration: const InputDecoration(
                  constraints: BoxConstraints(maxWidth: 390),
                  hintText: "Country",
                  label: Text("Country"),
                )),
         
            TextFormField(
                onChanged: (value) {},
                decoration: const InputDecoration(
                  constraints: BoxConstraints(maxWidth: 390),
                  hintText: "PIN Code",
                  label: Text("PIN Code"),
                )),
          ],
        )
      ],
    );
  }
}
