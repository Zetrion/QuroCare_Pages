import 'package:flutter/material.dart';
import '../core/app_colors.dart';
import '../core/app_styles.dart';
import '/models/patient_model.dart';

class AddPatientSheet extends StatefulWidget {
  const AddPatientSheet({Key? key}) : super(key: key);

  @override
  State<AddPatientSheet> createState() => _AddPatientSheetState();
}

class _AddPatientSheetState extends State<AddPatientSheet> {
  final _formKey = GlobalKey<FormState>();
  final _firstNameCtrl = TextEditingController();
  final _lastNameCtrl = TextEditingController();
  String _selectedRelation = 'Brother';
  int _selectedGenderIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
      // bottom: viewInsets handles keyboard, but we removed extra padding
      // to keep it tight to the Save button.
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min, // Tight fit to content
        children: [
          // --- FIXED HEADER (No Overlap) ---
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            child: Row(
              children: [
                // 1. Left placeholder to balance the "Cancel" button
                const SizedBox(width: 80),

                // 2. Centered Title
                Expanded(
                  child: Center(
                    child: Text(
                      'Add new Patient',
                      style: AppStyles.header.copyWith(fontSize: 18),
                    ),
                  ),
                ),

                // 3. Right-aligned Cancel Button
                SizedBox(
                  width: 80,
                  child: TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text(
                      'Cancel',
                      style: AppStyles.serviceSubtitle.copyWith(
                        color: const Color(0xFF231391),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Divider(height: 1),

          // Form Content
          Flexible(
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(16, 20, 16, 10),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _label('First Name'),
                    _textField(_firstNameCtrl, 'e.g John...'),
                    const SizedBox(height: 16),
                    _label('Last Name'),
                    _textField(_lastNameCtrl, 'e.g Smith...'),
                    const SizedBox(height: 16),
                    _label('Relationship'),
                    _buildDropdown(),
                    const SizedBox(height: 16),
                    _label('Gender'),
                    _buildGenderSelector(),
                    const SizedBox(height: 20),
                    _importantNoteBox(),
                    const SizedBox(height: 24),

                    // --- GRADIENT SAVE BUTTON ---
                    _buildSaveButton(),

                    // Smallest possible gap at bottom
                    const SizedBox(height: 16),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // --- Helper Methods ---

  Widget _buildSaveButton() {
    return GestureDetector(
      onTap: () {
        // 1. Validate (optional but recommended)
        if (_firstNameCtrl.text.isEmpty) return;

        // 2. Create the patient object
        final newPatient = PatientData(
          name: '${_firstNameCtrl.text} ${_lastNameCtrl.text}'.toUpperCase(),
          relation: _selectedRelation,
          genderAge: '${['M', 'F', 'O'][_selectedGenderIndex]} • New',
        );

        // 3. Pop with the data!
        // This sends the data back to the "await" in the previous sheet
        Navigator.pop(context, newPatient);
      },
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
            colors: [
              const Color(0xFF231391),
              const Color(0xFF231391).withOpacity(0.8),
            ],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
        ),
        child: const Center(
          child: Text(
            'Save Patient',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  Widget _label(String text) => Padding(
    padding: const EdgeInsets.only(bottom: 8),
    child: Text(text, style: AppStyles.serviceTitle),
  );

  Widget _textField(TextEditingController ctrl, String hint) {
    return TextFormField(
      controller: ctrl,
      decoration: InputDecoration(
        hintText: hint,
        filled: true,
        fillColor: Colors.grey.shade50,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
      ),
    );
  }

  Widget _buildDropdown() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: _selectedRelation,
          isExpanded: true,
          items: ['Self', 'Brother', 'Sister', 'Parent', 'Other'].map((val) {
            return DropdownMenuItem<String>(value: val, child: Text(val));
          }).toList(),
          onChanged: (val) => setState(() => _selectedRelation = val!),
        ),
      ),
    );
  }

  Widget _buildGenderSelector() {
    return Row(
      children: ['Male', 'Female', 'Other'].asMap().entries.map((entry) {
        bool isSel = _selectedGenderIndex == entry.key;
        return Expanded(
          child: GestureDetector(
            onTap: () => setState(() => _selectedGenderIndex = entry.key),
            child: Container(
              margin: EdgeInsets.only(right: entry.key == 2 ? 0 : 8),
              padding: const EdgeInsets.symmetric(vertical: 12),
              decoration: BoxDecoration(
                color: isSel ? const Color(0xFF231391) : Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: isSel ? const Color(0xFF231391) : Colors.grey.shade300,
                ),
              ),
              child: Center(
                child: Text(
                  entry.value,
                  style: TextStyle(
                    color: isSel ? Colors.white : Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _importantNoteBox() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.blue.shade50,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          const Icon(Icons.info_outline, color: Colors.blue, size: 20),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              'This patient will be added under your family and linked to your Phone number.For now, all booking updates and calls will be to your number.If they wish to manage their own account later You can change their phonelater from your Account settings.',
              style: TextStyle(fontSize: 12, color: Colors.blue.shade900),
            ),
          ),
        ],
      ),
    );
  }
}
