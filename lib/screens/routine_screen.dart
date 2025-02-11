import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

import '../utilities/common_methods.dart';

class RoutineScreen extends StatefulWidget {
  const RoutineScreen({super.key});

  @override
  State<RoutineScreen> createState() => _RoutineScreenState();
}

class _RoutineScreenState extends State<RoutineScreen> {
  final List<String> routines = ['cleanser', 'toner', 'moisturizer', 'sunscreen', 'lipBalm'];

  Map<int, String?> uploadedImages = {}; // Store uploaded image URLs

  final ImagePicker _picker = ImagePicker();

  Future<void> _pickAndUploadImage(int index) async {
    final XFile? image = await _picker.pickImage(source: ImageSource.camera);
    if (image == null) return;

    File file = File(image.path);
    String fileName = 'skincare_${routines[index]}_${DateTime.now().millisecondsSinceEpoch}.jpg';

    try {
      TaskSnapshot snapshot = await FirebaseStorage.instance.ref('skincare/$fileName').putFile(file);
      String downloadUrl = await snapshot.ref.getDownloadURL();

      setState(() {
        uploadedImages[index] = downloadUrl;
      });

      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Image uploaded successfully!")));
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Upload failed: $e")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Daily Skincare")),
      body: ListView.builder(
        itemCount: routines.length,
        itemBuilder: (context, ind) {
          return ListTile(
            leading: Container(
              decoration: BoxDecoration(
                color: Colors.pink.shade800.withOpacity(.2),
                borderRadius: BorderRadius.circular(5),
              ),
              width: 40,
              height: 40,
              child: const Icon(Icons.check),
            ),
            title: Text(getTitle(ind), style: const TextStyle(fontWeight: FontWeight.w500)),
            subtitle: Text(getSubtitle(ind), style: TextStyle(color: Colors.pink.shade800, fontSize: 15)),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                GestureDetector(
                  onTap: () => _pickAndUploadImage(ind),
                  child: Icon(Icons.camera_alt_outlined, color: Colors.pink.shade800),
                ),
                const SizedBox(width: 10),
                if (uploadedImages.containsKey(ind))
                  Icon(Icons.check_circle, color: Colors.green) // Show check when uploaded
              ],
            ),
          );
        },
      ),
    );
  }

  String getSubtitle(int ind) {
    return [
      "Cetaphil Gentle Skin Cleanser",
      "Thayers Witch Hazel Toner",
      "Kiehl's Ultra Facial Cream",
      "Supergoop Unseen Sunscreen SPF 40",
      "Glossier Birthday Balm Dotcom"
    ][ind];
  }

  String getTitle(int ind) {
    return ind == 4 ? "Lip Balm" : capitalize(routines[ind]);
  }


}
