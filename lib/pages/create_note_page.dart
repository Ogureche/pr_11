import 'package:flutter/material.dart';
import 'package:pr_11/models/note.dart';

class CreateNotePage extends StatefulWidget {
  final Function(Note) onCreate;

  const CreateNotePage({Key? key, required this.onCreate}) : super(key: key);

  @override
  _CreateNotePageState createState() => _CreateNotePageState();
}

class _CreateNotePageState extends State<CreateNotePage> {
  final TextEditingController _imageUrlController = TextEditingController();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();

  @override
  void dispose() {
    _imageUrlController.dispose();
    _titleController.dispose();
    _descriptionController.dispose();
    _priceController.dispose();
    super.dispose();
  }

  final Color _focusedBorderColor = Color.fromARGB(211, 255, 153, 115);
  final Color _enabledBorderColor = Color.fromARGB(211, 193, 193, 193);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Создать карточку'),
      ),
      backgroundColor: const Color.fromARGB(211, 255, 195, 175),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                controller: _titleController,
                decoration: InputDecoration(
                  labelText: 'Заголовок',
                  floatingLabelStyle: TextStyle(color: Color.fromARGB(211, 255, 255, 255)),
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: _focusedBorderColor, width: 2.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: _enabledBorderColor, width: 1.0),
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              TextField(
                controller: _descriptionController,
                decoration: InputDecoration(
                  labelText: 'Описание',
                  floatingLabelStyle: TextStyle(color: Color.fromARGB(211, 255, 255, 255)),
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: _focusedBorderColor, width: 2.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: _enabledBorderColor, width: 1.0),
                  ),
                ),
                maxLines: 3,
              ),
              const SizedBox(height: 16.0),
              TextField(
                controller: _imageUrlController,
                decoration: InputDecoration(
                    labelText: 'URL изображения',
                    floatingLabelStyle: TextStyle(color: Color.fromARGB(211, 255, 255, 255)),
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: _focusedBorderColor, width: 2.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: _enabledBorderColor, width: 1.0),
                    ),
                ),
              ),
              const SizedBox(height: 16.0),
              TextField(
                controller: _priceController,
                decoration: InputDecoration(
                  labelText: 'Цена',
                  floatingLabelStyle: TextStyle(color: Color.fromARGB(211, 255, 255, 255)),
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: _focusedBorderColor, width: 2.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: _enabledBorderColor, width: 1.0),
                  ),
                ),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  final newNote = Note(
                    id: DateTime.now().millisecondsSinceEpoch,
                    imagePath: _imageUrlController.text,
                    title: _titleController.text,
                    description: _descriptionController.text,
                    price: double.tryParse(_priceController.text) ?? 0.0,
                  );
                  widget.onCreate(newNote);
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15), // Квадратные углы
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  backgroundColor: Color.fromARGB(211, 255, 153, 115),
                  foregroundColor: Color.fromARGB(211, 255, 255, 255),// Цвет кнопки, измените по необходимости
                ),
                child: const Text('Сохранить товар'),
              ),
             ),
            ],
          ),
        ),
      ),
    );
  }
}