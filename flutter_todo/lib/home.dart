import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'create.dart';
import 'edit.dart';
import 'login.dart';
import 'profile.dart';

class TodoListPage extends StatefulWidget {
  const TodoListPage({super.key});

  @override
  State<TodoListPage> createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  List todos = [];
  bool isLoading = false;

  Future<void> fetchTodos() async {
    setState(() => isLoading = true);
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    if (token == null) {
      print('Token tidak ditemukan, user belum login.');
      if (!mounted) return;
      setState(() => isLoading = false);
      return;
    }

    final response = await http.get(
      Uri.parse('http://127.0.0.1:8000/api/todos'),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      if (!mounted) return;
      setState(() => todos = jsonDecode(response.body));
    } else {
      print('Gagal fetch todos: ${response.statusCode} - ${response.body}');
    }

    if (!mounted) return;
    setState(() => isLoading = false);
  }

  Future<void> deleteTodo(int id) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    if (token == null) {
      print('Token tidak ditemukan, user belum login.');
      return;
    }

    final response = await http.delete(
      Uri.parse('http://127.0.0.1:8000/api/todos/$id'),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200 || response.statusCode == 204) {
      if (!mounted) return;
      fetchTodos();
    } else {
      print('Gagal menghapus: ${response.statusCode}');
    }
  }

  Future<void> toggleIsDone(int id, bool value) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    if (token == null) {
      print('Token tidak ditemukan, user belum login.');
      return;
    }

    final response = await http.put(
      Uri.parse('http://127.0.0.1:8000/api/edit/$id'),
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
      body: jsonEncode({'selesai': value}),
    );

    if (response.statusCode == 200) {
      if (!mounted) return;
      fetchTodos();
    } else {
      print('Gagal update is_done: ${response.body}');
    }
  }

  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('token');
    if (!mounted) return;
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const SignInPage()),
    );
  }

  @override
  void initState() {
    super.initState();
    fetchTodos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFD2E5E9),
      appBar: AppBar(
        backgroundColor: const Color(0xFF2563EB),
        title: const Text(
          'Todo List App',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
        ),
        leading: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: PopupMenuButton<String>(
            icon: const Icon(Icons.menu, color: Colors.white),
            onSelected: (value) {
              if (value == 'profile') {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const ProfilePage()),
                );
              } else if (value == 'logout') {
                logout();
              }
            },
            itemBuilder: (context) => [
              const PopupMenuItem(
                value: 'profile',
                child: Text('Profile'),
              ),
              const PopupMenuItem(
                value: 'logout',
                child: Text('Logout'),
              ),
            ],
          ),
        ),
        // actions: [], // dihapus karena sudah dipindah ke leading
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator(color: Colors.black))
          : todos.isEmpty
              ? const Center(
                  child: Text('Kamu belum punya tugas nih!',
                      style: TextStyle(color: Colors.black54)),
                )
              : ListView.builder(
                  itemCount: todos.length,
                  itemBuilder: (_, i) {
                    final item = todos[i];
                    final selesai =
                        item['selesai'] == 1 || item['selesai'] == true;

                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 6),
                      child: Card(
                        color: selesai ? const Color(0xFFD1E7DD) : Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        elevation: 3,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: CheckboxListTile(
                            value: selesai,
                            onChanged: (value) =>
                                toggleIsDone(item['id_todo'], value!),
                            title: Text(
                              '${item['list'] ?? ''} | ${item['status'] ?? ''}',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Colors.black,
                                decoration: selesai
                                    ? TextDecoration.lineThrough
                                    : TextDecoration.none,
                              ),
                            ),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  item['tanggal'],
                                  style: TextStyle(
                                    color: Colors.black54,
                                    decoration: selesai
                                        ? TextDecoration.lineThrough
                                        : TextDecoration.none,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  item['deskripsi'] ?? '',
                                  style: TextStyle(
                                    color: Colors.black87,
                                    decoration: selesai
                                        ? TextDecoration.lineThrough
                                        : TextDecoration.none,
                                  ),
                                ),
                                if (selesai)
                                  const Padding(
                                    padding: EdgeInsets.only(top: 6),
                                    child: Text(
                                      '✔ Tugas telah selesai',
                                      style: TextStyle(
                                        color: Colors.green,
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FontStyle.italic,
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                            secondary: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  icon: const Icon(Icons.edit,
                                      color: Colors.amber),
                                  onPressed: () async {
                                    final updated = await Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => EditTodoPage(
                                          todo: item,
                                          id: item['id_todo'],
                                        ),
                                      ),
                                    );
                                    if (updated == true) fetchTodos();
                                  },
                                ),
                                IconButton(
                                  icon: const Icon(Icons.delete_forever,
                                      color: Colors.redAccent),
                                  onPressed: () => deleteTodo(item['id_todo']),
                                ),
                              ],
                            ),
                            controlAffinity: ListTileControlAffinity.leading,
                            activeColor: Colors.green,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            tileColor: selesai
                                ? const Color(0xFFE8F5E9)
                                : Colors.white,
                          ),
                        ),
                      ),
                    );
                  },
                ),
      floatingActionButton: GestureDetector(
        onTap: () async {
          final created = await Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const CreateTodoPage()),
          );
          if (created == true) fetchTodos();
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            gradient: const LinearGradient(
              colors: [Color(0xFF2563EB), Color(0xFF1E40AF)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                offset: const Offset(0, 4),
                blurRadius: 8,
              ),
            ],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: const [
              Icon(Icons.add_task, color: Colors.white),
              SizedBox(width: 8),
              Text(
                'Tambah Tugas',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  letterSpacing: 1.1,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
