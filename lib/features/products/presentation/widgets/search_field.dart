import 'package:e_commerce/features/products/presentation/screens/search_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SearchField extends StatelessWidget {
  final Function(String) changeState;
  const SearchField({
    super.key,
    required this.changeState,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Expanded(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          width: double.infinity,
          decoration: BoxDecoration(
              border: Border.all(
                  color: const Color.fromARGB(255, 196, 196, 196), width: 2),
              borderRadius: BorderRadius.circular(10)),
          child: TextField(
            onChanged: changeState,
            controller: controller,
            style: const TextStyle(
                color: Color.fromARGB(255, 196, 196, 196),
                letterSpacing: 1,
                fontSize: 20,
                fontWeight: FontWeight.w300),
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: "Search here..",
              hintStyle: const TextStyle(
                  color: Color.fromARGB(255, 196, 196, 196),
                  letterSpacing: 1,
                  fontSize: 20,
                  fontWeight: FontWeight.w300),
              prefixIcon: Padding(
                padding: EdgeInsets.only(right: 10),
                child: BackButton(
                  color: Colors.white,
                  onPressed: () {
                    GoRouter.of(context).pop();
                    controller.clear();
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
