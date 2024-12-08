import 'package:flutter/material.dart';

class SearchField extends StatefulWidget {
  const SearchField({super.key});

  @override
  _SearchFieldState createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  // Create a FocusNode to control focus
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _focusNode.dispose(); // Always dispose of focus nodes to prevent memory leaks
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Remove focus when tapping elsewhere
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Container(
        height: 40,
        child: TextField(
          focusNode: _focusNode, // Set focus to the TextField
          decoration: InputDecoration(
            hintText: "Search",
            hintStyle: const TextStyle(color: Colors.white70),
            filled: true,
            fillColor: Colors.blue.shade900,
            suffixIcon: const Icon(Icons.search, color: Colors.white),
            contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          style: const TextStyle(color: Colors.white),
          onTap: () {
            // Ensure the field gets focused when tapped
            FocusScope.of(context).requestFocus(_focusNode);
          },
        ),
      ),
    );
  }
}
