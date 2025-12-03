import 'package:flutter/material.dart';
import '../../core/app_colors.dart';
import '../../core/app_fonts.dart';
import '../exports.dart';

class AddPatientSheet extends StatefulWidget {
  const AddPatientSheet({Key? key}) : super(key: key);

  @override
  State<AddPatientSheet> createState() => _AddPatientSheetState();
}

class _AddPatientSheetState extends State<AddPatientSheet> {
  final _formKey = GlobalKey<FormState>();

  final _firstNameCtrl = TextEditingController();
  final _lastNameCtrl = TextEditingController();
  final _relationshipCtrl = TextEditingController();
  final _dobCtrl = TextEditingController();

  int _selectedGenderIndex = 0; // 0=Male,1=Female,2=Prefer not to say

  @override
  void dispose() {
    _firstNameCtrl.dispose();
    _lastNameCtrl.dispose();
    _relationshipCtrl.dispose();
    _dobCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context);

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: DraggableScrollableSheet(
        initialChildSize: 0.75, // open lower so it doesn't reach near the top
        maxChildSize: 0.95,
        minChildSize: 0.6,
        builder: (context, scrollController) {
          return Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.white, AppColor.secondary],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(24),
                topRight: Radius.circular(24),
              ),
            ),
            padding: EdgeInsets.only(
              left: 16,
              right: 16,
              top: 12,
              bottom: media.viewInsets.bottom + 16,
            ),
            child: SingleChildScrollView(
              controller: scrollController,
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // title row — center text exactly, keep Cancel at right
                    SizedBox(
                      height: 48,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Center(
                            child: Text(
                              'Add new Patient',
                              style: AppFonts.bodyBold.copyWith(
                                fontSize: 22,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          Positioned(
                            right: 0,
                            child: TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: Text(
                                'Cancel',
                                style: AppFonts.bodyBold.copyWith(
                                  fontSize: 14,
                                  color: AppColor.primary,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 12),

                    // First name
                    _label('First Name'),
                    const SizedBox(height: 4),
                    _textField(controller: _firstNameCtrl, hint: 'e.g John...'),
                    const SizedBox(height: 12),

                    // Last name
                    _label('Last Name'),
                    const SizedBox(height: 4),
                    _textField(controller: _lastNameCtrl, hint: 'e.g Smith...'),
                    const SizedBox(height: 12),

                    // Relationship
                    _label('Relationship'),
                    const SizedBox(height: 4),
                    _relationshipDropdown(),
                    const SizedBox(height: 12),

                    // DOB
                    _label('Date of Birth'),
                    const SizedBox(height: 4),
                    _dobField(context),
                    const SizedBox(height: 16),

                    // Gender
                    _label('Gender'),
                    const SizedBox(height: 8),
                    _genderSelector(),
                    const SizedBox(height: 16),

                    // Important note box
                    _importantNoteBox(),
                    const SizedBox(height: 20),

                    // Save button
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: _onSave,
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          backgroundColor: AppColor.primary,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24),
                          ),
                        ),
                        child: Text(
                          'Save Patient',
                          style: AppFonts.bodyBold.copyWith(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _label(String text) {
    return Text(
      text,
      style: AppFonts.bodyBold.copyWith(fontSize: 14, color: AppColor.textDark),
    );
  }

  Widget _textField({
    required TextEditingController controller,
    required String hint,
  }) {
    return TextFormField(
      controller: controller,
      validator: (v) => (v == null || v.trim().isEmpty) ? 'Required' : null,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: AppFonts.bodyRegular.copyWith(color: AppColor.textLight),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 12,
        ),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
      ),
    );
  }

  Widget _relationshipDropdown() {
    return TextFormField(
      controller: _relationshipCtrl,
      readOnly: true,
      validator: (v) =>
          (v == null || v.trim().isEmpty) ? 'Please select relationship' : null,
      decoration: InputDecoration(
        hintText: 'Select Relationship',
        hintStyle: AppFonts.bodyRegular.copyWith(color: AppColor.textLight),
        suffixIcon: const Icon(Icons.arrow_drop_down),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 12,
        ),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
      ),
      onTap: () async {
        final options = ['Self', 'Brother', 'Sister', 'Father', 'Mother'];
        final result = await showModalBottomSheet<String>(
          context: context,
          builder: (ctx) {
            return SafeArea(
              child: ListView(
                shrinkWrap: true,
                children: [
                  for (final o in options)
                    ListTile(
                      title: Text(o),
                      onTap: () => Navigator.pop(ctx, o),
                    ),
                ],
              ),
            );
          },
        );
        if (result != null) {
          setState(() => _relationshipCtrl.text = result);
        }
      },
    );
  }

  Widget _dobField(BuildContext context) {
    return TextFormField(
      controller: _dobCtrl,
      readOnly: true,
      validator: (v) =>
          (v == null || v.trim().isEmpty) ? 'Select date of birth' : null,
      decoration: InputDecoration(
        hintText: 'DD / MM / YYYY',
        hintStyle: AppFonts.bodyRegular.copyWith(color: AppColor.textLight),
        suffixIcon: const Icon(Icons.calendar_today_outlined, size: 18),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 12,
        ),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
      ),
      onTap: () async {
        final now = DateTime.now();
        final picked = await showDatePicker(
          context: context,
          initialDate: DateTime(now.year - 20),
          firstDate: DateTime(1900),
          lastDate: now,
        );
        if (picked != null) {
          setState(() {
            _dobCtrl.text =
                '${picked.day.toString().padLeft(2, '0')} / ${picked.month.toString().padLeft(2, '0')} / ${picked.year}';
          });
        }
      },
    );
  }

  Widget _genderSelector() {
    final labels = ['Male', 'Female', 'Prefer not to say'];

    return Row(
      children: [
        for (int i = 0; i < labels.length; i++) ...[
          Expanded(
            child: GestureDetector(
              onTap: () => setState(() => _selectedGenderIndex = i),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 6,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: _selectedGenderIndex == i
                      ? AppColor.primary.withOpacity(0.12)
                      : Colors.white,
                  border: Border.all(
                    color: _selectedGenderIndex == i
                        ? AppColor.primary
                        : Colors.grey.shade300,
                  ),
                ),
                alignment: Alignment.center,
                child: Text(
                  labels[i],
                  style: AppFonts.bodyBold.copyWith(
                    fontSize: 13,
                    color: _selectedGenderIndex == i
                        ? AppColor.primary
                        : AppColor.textDark,
                  ),
                ),
              ),
            ),
          ),
          if (i != labels.length - 1) const SizedBox(width: 8),
        ],
      ],
    );
  }

  Widget _importantNoteBox() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: AppColor.secondary.withOpacity(0.15),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Important Note :',
            style: AppFonts.bodyBold.copyWith(
              fontSize: 13,
              color: AppColor.textDark,
            ),
          ),
          const SizedBox(height: 6),
          _bullet(
            'This patient will be added under your family and linked to your Phone number.',
          ),
          _bullet(
            'For now, all booking updates and calls will be to your number.',
          ),
          _bullet(
            'If they wish to manage their own account later you can change their phone later from your Account settings.',
          ),
        ],
      ),
    );
  }

  Widget _bullet(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('•  ', style: TextStyle(fontSize: 12)),
          Expanded(
            child: Text(
              text,
              style: AppFonts.bodyRegular.copyWith(
                fontSize: 12,
                color: AppColor.textDark,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _onSave() {
    if (!_formKey.currentState!.validate()) return;

    final first = _firstNameCtrl.text.trim();
    final last = _lastNameCtrl.text.trim();
    final fullName = '$first $last'.trim();

    final genderLabel = ['M', 'F', '–'][_selectedGenderIndex];

    final patient = PatientData(
      name: fullName.isEmpty ? 'New Patient' : fullName,
      relation: _relationshipCtrl.text.trim().isEmpty
          ? 'Other'
          : _relationshipCtrl.text.trim(),
      // you can calculate age from DOB later if you want
      genderAge: '$genderLabel • --yr',
    );

    Navigator.pop(context, patient);
  }
}
