import 'package:flutter_svg/svg.dart';
import 'package:material_ui/material_ui.dart';
import 'package:mood_tracker/commons/global.dart';

class MoodCard extends StatelessWidget {
  final MoodType mood;
  final String subtitle;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  const MoodCard({
    super.key,
    required this.mood,
    required this.subtitle,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Global().surface,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Global().primary.withValues(alpha: 0.10),
            blurRadius: 16,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: ListTile(
        leading: Container(
          width: 44,
          height: 44,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: mood.color,
            borderRadius: BorderRadius.circular(14),
          ),
          child: SvgPicture.asset(mood.asset, width: 28, height: 28),
        ),
        title: Text(
          mood.label,
          style: TextStyle(fontWeight: Global().medium, fontSize: 16),
        ),
        subtitle: Text(
          subtitle,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(fontSize: 12, fontWeight: Global().regular),
        ),
        trailing: PopupMenuButton<String>(
          icon: Icon(Icons.more_vert, color: Global().textSecondary),
          onSelected: (v) => v == 'edit' ? onEdit() : onDelete(),
          itemBuilder: (_) => const [
            PopupMenuItem(value: 'edit', child: Text("Edit")),
            PopupMenuItem(value: 'delete', child: Text("Hapus")),
          ],
        ),
      ),
    );
  }
}
