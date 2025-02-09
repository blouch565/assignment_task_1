import 'package:flutter/material.dart';

class PlantDetailsPage extends StatelessWidget {
  final Map<String, dynamic> plant;

  const PlantDetailsPage({super.key, required this.plant});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(plant['name']),
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite_border),
            onPressed: () {
              // Handle adding to wishlist
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('${plant['name']} added to wishlist')),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset(
                plant['image'],
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: Text(
                plant['name'],
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 10),
            Center(
              child: Text(
                '\$${plant['price']}',
                style: const TextStyle(fontSize: 20, color: Colors.green),
              ),
            ),
            const SizedBox(height: 20),
            // Plant Details
            Text(
              'Description: ${plant['description'] ?? 'No description available.'}',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 10),
            Text(
              'Water Needs: ${plant['water'] ?? 'Unknown'}',
              style: const TextStyle(fontSize: 16),
            ),
            Text(
              'Sunlight: ${plant['sunlight'] ?? 'Unknown'}',
              style: const TextStyle(fontSize: 16),
            ),
            const Spacer(),
            // Price and Buy Button
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Handle buy action
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Purchased ${plant['name']}')),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  ),
                  child: const Text(
                    'Buy Now',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Handle price details
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text('Price Details'),
                        content: Text('\$${plant['price']} - Includes taxes and delivery charges.'),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: const Text('OK'),
                          ),
                        ],
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  ),
                  child: const Text(
                    'View Price',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
