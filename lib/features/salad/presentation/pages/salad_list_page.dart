import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plateron_task/features/salad/bloc/salad_bloc.dart';
import 'package:plateron_task/features/salad/bloc/salad_event.dart';
import 'package:plateron_task/features/salad/bloc/salad_state.dart';
import 'package:plateron_task/features/salad/presentation/widgets/salad_list_item.dart';

class SaladListPage extends StatefulWidget {
  const SaladListPage({super.key});

  @override
  State<SaladListPage> createState() => _SaladListPageState();
}

class _SaladListPageState extends State<SaladListPage> {
  @override
  void initState() {
    super.initState();
    // Dispatch the LoadSalads event when the screen is initialized
    context.read<SaladBloc>().add(LoadSalads());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Salad List'),
      ),
      body: BlocBuilder<SaladBloc, SaladState>(
       
        builder: (context, state) {
          if (state is SaladLoadInProgress) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is SaladLoadSuccess) {
            return ListView.builder(
              itemCount: state.salads.length,
              itemBuilder: (context, index) {
                final salad = state.salads[index];
                return SaladListItem(
                  salad: salad,
                  onItemAdded: () {
                    context.read<SaladBloc>().add(AddToCart(salad));
                  },
                  onItemRemoved: () {
                    context.read<SaladBloc>().add(RemoveFromCart(salad));
                  },
                );
              },
            );
          } else if (state is SaladLoadFailure) {
            return const Center(
              child: Text('Failed to load salads'),
            );
          } else {
            return Container(); // Placeholder, you can handle other states if needed
          }
        },
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: const Icon(Icons.shopping_cart),
                onPressed: () {
                  // Navigate to cart page
                },
              ),
              BlocBuilder<SaladBloc, SaladState>(
                
                builder: (context, state) {
                  if (state is SaladLoadSuccess) {
                    return Text('Total Items: ${state.totalItems}');
                  } else{
                    return const SizedBox.shrink();
                  }
                },
              ),
              ElevatedButton(
                onPressed: () {
                  // Place order logic
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
                child: const Text('Place Order'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
