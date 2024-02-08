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
  SaladListItemState createState() => SaladListItemState();
}

class SaladListItemState extends State<SaladListItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 100,
            height: 100,
            child: Image.asset(
              widget.salad.imagePath,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.salad.dishName,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 5),
                Text(
                  widget.salad.description,
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 10),
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
