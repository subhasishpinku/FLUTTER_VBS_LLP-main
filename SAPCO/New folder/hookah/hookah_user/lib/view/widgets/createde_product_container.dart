import 'package:flutter/material.dart';

class CreatedProductContainer extends StatelessWidget {
  const CreatedProductContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 15, top: 10, bottom: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 140,
            width: 200,
            color: Colors.grey,
            child: Image.network(
              'https://www.fumari.com/fumariwp/wp-content/uploads/2019/04/blog-hookah-beginners.jpg',
              fit: BoxFit.cover,
            ),
          ),
          const Text(
            'Lorem Ipsum',
            style: TextStyle(
                color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                ' ₹ 200',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(width: 40),
              ElevatedButton(
                  style: ButtonStyle(
                      padding:
                          MaterialStateProperty.all(const EdgeInsets.symmetric(
                    horizontal: 16,
                  ))),
                  onPressed: () {},
                  child: const Text('Add to cart')),
            ],
          ),
        ],
      ),
    );
  }
}
