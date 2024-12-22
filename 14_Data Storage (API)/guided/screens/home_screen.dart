import 'package:flutter/material.dart';
import '../services/api_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ApiService _apiService = ApiService();
  List<dynamic> _posts = [];
  bool _isLoading = false;

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  Future<void> _handleApiOperation(
      Future<void> operation, String successMessage) async {
    setState(() {
      _isLoading = true;
    });
    try {
      await operation;
      setState(() {
        _posts = _apiService.posts;
      });
      _showSnackBar(successMessage);
    } catch (e) {
      _showSnackBar('Error: $e');
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('REST API Example'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (_isLoading)
            const Center(child: CircularProgressIndicator())
          else if (_posts.isEmpty)
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                "Tekan tombol GET untuk mengambil data",
                style: TextStyle(fontSize: 16),
              ),
            )
          else
            Expanded(
              child: ListView.builder(
                itemCount: _posts.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      elevation: 4,
                      child: ListTile(
                        title: Text(
                          _posts[index]['title'],
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        subtitle: Text(
                          _posts[index]['body'],
                          style: const TextStyle(fontSize: 14),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () => _handleApiOperation(
                    _apiService.fetchPosts(), 'Data berhasil diambil!'),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
                child: const Text('GET'),
              ),
              ElevatedButton(
                onPressed: () => _handleApiOperation(
                    _apiService.createPost(), 'Data berhasil ditambahkan!'),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                child: const Text('POST'),
              ),
              ElevatedButton(
                onPressed: () => _handleApiOperation(
                    _apiService.updatePost(), 'Data berhasil diperbarui!'),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                child: const Text('UPDATE'),
              ),
              ElevatedButton(
                onPressed: () => _handleApiOperation(
                    _apiService.deletePost(), 'Data berhasil dihapus!'),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                child: const Text('DELETE'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
