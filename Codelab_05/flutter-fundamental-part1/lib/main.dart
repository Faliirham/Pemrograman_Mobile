import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DateTimePickerExample(),
    );
  }
}

class DateTimePickerExample extends StatefulWidget {
  const DateTimePickerExample({super.key});

  @override
  State<DateTimePickerExample> createState() => _DateTimePickerExampleState();
}

class _DateTimePickerExampleState extends State<DateTimePickerExample> {
  DateTime? selectedDate;
  TimeOfDay? selectedTime;

  // Fungsi untuk menampilkan DatePicker
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(), // tanggal default
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  // Fungsi untuk menampilkan TimePicker
  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (picked != null && picked != selectedTime) {
      setState(() {
        selectedTime = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Date & Time Picker")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ElevatedButton(
              onPressed: () => _selectDate(context),
              child: const Text("Pilih Tanggal"),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => _selectTime(context),
              child: const Text("Pilih Waktu"),
            ),
            const SizedBox(height: 24),
            const Divider(),
            const SizedBox(height: 8),

            // Menampilkan hasil pilihan
            Text(
              selectedDate == null
                  ? "Tanggal belum dipilih"
                  : "Tanggal: ${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}",
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 8),
            Text(
              selectedTime == null
                  ? "Waktu belum dipilih"
                  : "Waktu: ${selectedTime!.format(context)}",
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}