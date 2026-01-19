import 'package:flutter/material.dart';
import '../constants.dart';

class RequestFormScreen extends StatefulWidget {
  const RequestFormScreen({super.key});

  @override
  State<RequestFormScreen> createState() => _RequestFormScreenState();
}

class _RequestFormScreenState extends State<RequestFormScreen> {
  String? selectedDoc;
  final List<String> documents = [
    'Transcript of Records',
    'Diploma',
    'Form 137',
    'Good Moral'
  ];

  String? selectedPurp;
  final List<String> purposes = [
    'Employment',
    'Board Exam',
    'Personal Use',
    'Transfer to another school',
    'Others'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FB_BACKGROUND_LIGHT,
      appBar: AppBar(
        backgroundColor: FB_PRIMARY,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.chevron_left, color: Colors.white, size: 30),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text("Request Form",
            style: TextStyle(
                color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: IntrinsicHeight( 
                  child: Column(
                    children: [
                      // Document Selection
                      DropdownButtonFormField<String>(
                        value: selectedDoc,
                        hint: const Text("Select Document"),
                        decoration: _inputDecoration(),
                        items: documents
                            .map((doc) => DropdownMenuItem(value: doc, child: Text(doc)))
                            .toList(),
                        onChanged: (val) => setState(() => selectedDoc = val),
                      ),
                      const SizedBox(height: 20),

                      TextFormField(decoration: _inputDecoration(hint: "Full Name")),
                      const SizedBox(height: 20),

                      TextFormField(decoration: _inputDecoration(hint: "Year Graduated")),
                      const SizedBox(height: 20),

                      DropdownButtonFormField<String>(
                        value: selectedPurp,
                        hint: const Text("Select Purpose"),
                        decoration: _inputDecoration(),
                        items: purposes
                            .map((purpose) => DropdownMenuItem(
                                value: purpose, child: Text(purpose)))
                            .toList(),
                        onChanged: (val) => setState(() => selectedPurp = val),
                      ),

                      // Condition for 'Others'
                      if (selectedPurp == 'Others') ...[
                        const SizedBox(height: 20),
                        TextFormField(
                          decoration: _inputDecoration(hint: "Please specify purpose"),
                        ),
                      ],

                      
                      const Spacer(),

                      const SizedBox(height: 20),

                      Align(
                        alignment: Alignment.bottomRight,
                        child: SizedBox(
                          width: 140,
                          height: 45,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: FB_DARK_PRIMARY,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8)),
                            ),
                            onPressed: () {
                              // Handle submission
                            },
                            child: const Text("SUBMIT",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  InputDecoration _inputDecoration({String? hint}) {
    return InputDecoration(
      hintText: hint,
      filled: true,
      fillColor: Colors.white,
      contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
        borderSide: BorderSide(color: Colors.grey.shade300),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
        borderSide: BorderSide(color: Colors.grey.shade300),
      ),
    );
  }
}