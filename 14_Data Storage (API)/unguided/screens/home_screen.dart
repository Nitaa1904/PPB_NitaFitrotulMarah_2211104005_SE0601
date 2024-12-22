import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/api_controller.dart';

class HomeScreen extends StatelessWidget {
  final ApiController _apiController = Get.put(ApiController());

  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('REST API with GetX'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: Obx(() {
                if (_apiController.isLoading.value) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (_apiController.posts.isEmpty) {
                  return const Center(
                    child: Text(
                      "Tekan tombol GET untuk mengambil data",
                      style: TextStyle(fontSize: 16),
                    ),
                  );
                }

                return ListView.builder(
                  itemCount: _apiController.posts.length,
                  itemBuilder: (context, index) {
                    return Card(
                      elevation: 4,
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      child: ListTile(
                        title: Text(
                          _apiController.posts[index]['title'] ?? '',
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 14),
                        ),
                        subtitle: Text(
                          _apiController.posts[index]['body'] ?? '',
                          style: const TextStyle(fontSize: 12),
                        ),
                      ),
                    );
                  },
                );
              }),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () => _apiController.fetchPosts(),
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.orange),
                  child: const Text('GET'),
                ),
                ElevatedButton(
                  onPressed: () => _apiController.createPost(),
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.green),
                  child: const Text('POST'),
                ),
                ElevatedButton(
                  onPressed: () => _apiController.updatePost(),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                  child: const Text('UPDATE'),
                ),
                ElevatedButton(
                  onPressed: () => _apiController.deletePost(),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                  child: const Text('DELETE'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
