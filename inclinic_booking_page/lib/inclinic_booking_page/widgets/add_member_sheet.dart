import 'package:flutter/material.dart';
import '/core/app_colors.dart';
import '/core/app_fonts.dart';

class AddMemberSheet extends StatefulWidget {
  final void Function(Map<String, String>) onSave;
  const AddMemberSheet({super.key, required this.onSave});

  @override
  State<AddMemberSheet> createState() => _AddMemberSheetState();
}

class _AddMemberSheetState extends State<AddMemberSheet> {
  final _formKey = GlobalKey<FormState>();
  String first = '';
  String last = '';
  String relation = '';
  String dob = '';
  String gender = 'Male';

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);
    return DraggableScrollableSheet(
      initialChildSize: 0.82,
      minChildSize: 0.5,
      maxChildSize: 0.95,
      builder: (context, controller) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
            boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10)],
          ),
          child: SingleChildScrollView(
            controller: controller,
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    width: 60,
                    height: 6,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(6),
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Expanded(
                      child: Center(
                        child: Text('Add new Patient', style: AppFonts.h6),
                      ),
                    ),
                    GestureDetector(
                      onTap: () => Navigator.of(context).pop(),
                      child: const Text(
                        'Cancel',
                        style: TextStyle(color: AppColor.primary),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 18),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      _inputField(
                        'First Name',
                        hint: 'e.g John...',
                        onSaved: (v) => first = v ?? '',
                      ),
                      const SizedBox(height: 12),
                      _inputField(
                        'Last Name',
                        hint: 'e.g Smith...',
                        onSaved: (v) => last = v ?? '',
                      ),
                      const SizedBox(height: 12),
                      _dropDown(
                        'Relationship',
                        items: [
                          'Select Relationship',
                          'Brother',
                          'Sister',
                          'Father',
                          'Mother',
                          'Friend',
                        ],
                      ),
                      const SizedBox(height: 12),
                      _inputField(
                        'Date of Birth',
                        hint: 'DD / MM / YYYY',
                        onSaved: (v) => dob = v ?? '',
                      ),
                      const SizedBox(height: 12),
                      // gender buttons
                      Row(
                        children: [
                          _genderChip('Male'),
                          const SizedBox(width: 8),
                          _genderChip('Female'),
                          const SizedBox(width: 8),
                          _genderChip('Prefer not to say'),
                        ],
                      ),
                      const SizedBox(height: 18),
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: AppColor.lightGrey,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'Important Note :',
                              style: TextStyle(fontWeight: FontWeight.w700),
                            ),
                            SizedBox(height: 6),
                            Text(
                              '• This patient will be added under your family and linked to your Phone number.',
                            ),
                            Text(
                              '• For now, all booking updates and calls will be to your number.',
                            ),
                            Text(
                              '• If they wish to manage their own account later You can change their phone later from your Account settings.',
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 18),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: _save,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColor.primary,
                            padding: const EdgeInsets.symmetric(vertical: 14),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: const Text('Save Member'),
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _inputField(
    String label, {
    String? hint,
    void Function(String?)? onSaved,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: AppFonts.bodyBold),
        const SizedBox(height: 6),
        TextFormField(
          onSaved: onSaved,
          decoration: InputDecoration(
            hintText: hint,
            filled: true,
            fillColor: AppColor.lightGrey,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 12,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ],
    );
  }

  Widget _dropDown(String label, {required List<String> items}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: AppFonts.bodyBold),
        const SizedBox(height: 6),
        DropdownButtonFormField<String>(
          value: items.first,
          items: items
              .map((e) => DropdownMenuItem(value: e, child: Text(e)))
              .toList(),
          onChanged: (v) => setState(() => relation = v ?? ''),
          decoration: InputDecoration(
            filled: true,
            fillColor: AppColor.lightGrey,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 0,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ],
    );
  }

  Widget _genderChip(String label) {
    final bool active = gender == label;
    return Expanded(
      child: GestureDetector(
        onTap: () => setState(() => gender = label),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            color: active ? AppColor.primary.withOpacity(0.12) : Colors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: active ? AppColor.primary : Colors.grey.shade300,
            ),
          ),
          child: Center(child: Text(label, style: AppFonts.body)),
        ),
      ),
    );
  }

  void _save() {
    _formKey.currentState?.save();
    widget.onSave({
      'name': '$first $last'.trim(),
      'relation': relation == '' ? 'Relation' : relation,
      'age': '0yr',
    });
    Navigator.of(context).pop();
  }
}
