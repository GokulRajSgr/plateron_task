import 'package:flutter/material.dart';
import 'package:plateron_task/core/models/salad.dart';

class SaladListItem extends StatefulWidget {
  final Salad salad;
  final VoidCallback onItemAdded;
  final VoidCallback onItemRemoved;

  const SaladListItem({
    Key? key,
    required this.salad,
    required this.onItemAdded,
    required this.onItemRemoved,
  }) : super(key: key);

  @override
  _SaladListItemState createState() => _SaladListItemState();
}

class _SaladListItemState extends State<SaladListItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Add your image widget here
          SizedBox(
            width: 100, // Adjust the width as needed
            height: 100, // Adjust the height as needed
            child: Image.asset(
              widget.salad.imagePath,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 10.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.salad.dishName,
                  style: const TextStyle(
                      fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 5.0),
                Text(
                  widget.salad.description,
                  style: const TextStyle(fontSize: 16.0),
                ),
                const SizedBox(height: 10.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '\$${widget.salad.price.toStringAsFixed(2)}',
                      style: const TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.bold),
                    ),
                    Row(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.remove),
                          onPressed: () {
                            setState(() {
                              if (widget.salad.selectedItems > 0) {
                                widget.salad.selectedItems--;
                                widget.onItemRemoved();
                              }
                            });
                          },
                        ),
                        Text(widget.salad.selectedItems.toString()),
                        IconButton(
                          icon: const Icon(Icons.add),
                          onPressed: () {
                            setState(() {
                              widget.salad.selectedItems++;
                              widget.onItemAdded();
                            });
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
