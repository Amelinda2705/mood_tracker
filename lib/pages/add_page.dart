import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:material_ui/material_ui.dart';
import 'package:mood_tracker/commons/global.dart';
import 'package:mood_tracker/model/mood.dart';
import 'package:mood_tracker/services/mood_service.dart';

class AddPage extends StatefulWidget {
  final Mood? mood; // null = tambah, ada isi = edit
  const AddPage({super.key, this.mood});

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  final _notesController = TextEditingController();
  DateTime _date = DateTime.now();
  MoodType? _selected;

  bool get _isEdit => widget.mood != null;

  @override
  void initState() {
    super.initState();
    final m = widget.mood;
    if (m != null) {
      _date = m.date;
      _selected = Global().moodByKey(m.mood);
      _notesController.text = m.notes;
    }
  }

  @override
  void dispose() {
    _notesController.dispose();
    super.dispose();
  }

  String get _dateLabel {
    final n = DateTime.now();
    final isToday =
        _date.year == n.year && _date.month == n.month && _date.day == n.day;
    final f = DateFormat('d MMMM yyyy').format(_date);
    return isToday ? "Hari ini, $f" : f;
  }

  Future<void> _pickDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _date,
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      setState(
        () => _date = DateTime(
          picked.year,
          picked.month,
          picked.day,
          _date.hour,
          _date.minute,
        ),
      );
    }
  }

  void _save() {
    if (_selected == null) return;
    final notes = _notesController.text.trim();

    if (_isEdit) {
      widget.mood!
        ..date = _date
        ..mood = _selected!.key
        ..notes = notes
        ..save();
    } else {
      MoodService.box.add(
        Mood(date: _date, mood: _selected!.key, notes: notes),
      );
    }
    Navigator.pop(context);
  }

  Widget _label(String t) => Padding(
    padding: const EdgeInsets.only(bottom: 8),
    child: Text(
      t,
      style: TextStyle(
        fontSize: 13,
        fontWeight: Global().regular,
        color: Global().textSecondary,
      ),
    ),
  );

  OutlineInputBorder _border(Color c) => OutlineInputBorder(
    borderRadius: BorderRadius.circular(12),
    borderSide: BorderSide(color: c),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        scrolledUnderElevation: 0,
        backgroundColor: Global().surface,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          _isEdit ? "Edit Mood" : "Tambah Mood",
          style: TextStyle(
            fontWeight: Global().semiBold,
            fontSize: 18,
            color: Global().textPrimary,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _label("Tanggal"),
              InkWell(
                onTap: _pickDate,
                borderRadius: BorderRadius.circular(12),
                child: Container(
                  height: 48,
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                    color: Global().surface,
                    border: Border.all(color: Global().borderDefault),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.calendar_today_outlined, size: 18),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          _dateLabel,
                          style: const TextStyle(fontSize: 14),
                        ),
                      ),
                      const Icon(Icons.keyboard_arrow_down),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),
              _label("Bagaimana perasaanmu?"),
              GridView.count(
                crossAxisCount: 3,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                childAspectRatio: 1.08,
                children: Global().moodTypes.map((m) {
                  final selected = _selected?.key == m.key;
                  return GestureDetector(
                    onTap: () => setState(() => _selected = m),
                    child: Container(
                      decoration: BoxDecoration(
                        color: selected ? m.color : Global().surface,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: selected ? m.color : Global().borderDefault,
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 44,
                            height: 44,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: selected ? Colors.transparent : m.color,
                              borderRadius: BorderRadius.circular(14),
                            ),
                            child: SvgPicture.asset(
                              m.asset,
                              width: 28,
                              height: 28,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            m.label,
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: selected
                                  ? Global().semiBold
                                  : Global().regular,
                              color: selected
                                  ? Global().textPrimary
                                  : Global().textSecondary,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ),
              const SizedBox(height: 24),
              _label("Catatan (opsional)"),
              TextField(
                controller: _notesController,
                minLines: 3,
                maxLines: 4,
                style: const TextStyle(fontSize: 14),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Global().surface,
                  contentPadding: const EdgeInsets.all(16),
                  enabledBorder: _border(Global().borderDefault),
                  focusedBorder: _border(Global().primary),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24, 8, 24, 16),
          child: SizedBox(
            height: 48,
            child: FilledButton(
              onPressed: _save,
              style: FilledButton.styleFrom(
                backgroundColor: Global().primary,
                shape: const StadiumBorder(),
              ),
              child: Text(
                "Simpan Mood",
                style: TextStyle(
                  fontWeight: Global().medium,
                  fontSize: 16,
                  color: Global().textOnPrimary,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
