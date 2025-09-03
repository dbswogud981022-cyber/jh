import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class ContractUploader extends StatefulWidget {
  final void Function(PlatformFile picked) onPicked;
  const ContractUploader({super.key, required this.onPicked});

  @override
  State<ContractUploader> createState() => _ContractUploaderState();
}

class _ContractUploaderState extends State<ContractUploader> {
  PlatformFile? _file;
  bool _busy = false;

  Future<void> _pick() async {
    setState(() => _busy = true);
    try {
      final res = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['pdf', 'jpg', 'jpeg', 'png'],
        withData: true,
      );
      if (res != null && res.files.isNotEmpty) {
        setState(() => _file = res.files.first);
        widget.onPicked(res.files.first);
      }
    } finally {
      setState(() => _busy = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        OutlinedButton.icon(
          onPressed: _busy ? null : _pick,
          icon: const Icon(Icons.upload_file),
          label: Text(_busy ? '가져오는 중...' : '계약서(PDF/이미지) 업로드'),
        ),
        if (_file != null)
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Row(
              children: [
                const Icon(Icons.insert_drive_file, size: 18),
                const SizedBox(width: 6),
                Expanded(
                    child: Text(_file!.name, overflow: TextOverflow.ellipsis)),
              ],
            ),
          ),
      ],
    );
  }
}
