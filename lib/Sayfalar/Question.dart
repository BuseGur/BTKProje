import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

final String apiKey = 'AIzaSyDwNaw9p2lq-zaNxRQk6SK9P_mUNGYvoOg';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Soru Havuzu',
      home: QuestionPage(),
    );
  }
}

class QuestionPage extends StatefulWidget {
  const QuestionPage({super.key});

  @override
  _QuestionPageState createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  late final GenerativeModel model;
  List<String> questions = [];
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    model = GenerativeModel(model: 'gemini-1.5-flash', apiKey: apiKey);
    fetchQuestions();
  }

  Future<void> fetchQuestions() async {
    setState(() {
      isLoading = true;
    });

    try {
      final response = await model.generateContent(Iterable.empty(),safetySettings: List.empty(),generationConfig: GenerationConfig(),toolConfig: ToolConfig(), tools: List.empty() );

      // Eğer yanıt dönerse ve text boş değilse, soruları ayır
      if (response.text != null && response.text!.isNotEmpty) {
        setState(() {
          questions = response.text!.split('\n').where((q) => q.isNotEmpty).toList();
        });
      } else {
        setState(() {
          questions = []; // Eğer yanıt boşsa soruları temizle
        });
      }
    } on SocketException catch (e) {
      print("İnternet bağlantısı yok: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("İnternet bağlantısı yok.")),
      );
    } catch (e) {
      print("Bir hata oluştu: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Bir hata oluştu. Lütfen tekrar deneyin.")),
      );
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Soru Havuzu'),
        backgroundColor: Colors.blueAccent,
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : questions.isEmpty
          ? const Center(child: Text("Soru oluşturulamadı."))
          : ListView.builder(
        itemCount: questions.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(questions[index]),
          );
        },
      ),
    );
  }
}
