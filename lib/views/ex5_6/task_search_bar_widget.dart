import 'package:flutter/material.dart';

class TaskSearchBarWidget extends StatefulWidget {
  final bool isLoading;
  final Function(String) onSearch;

  const TaskSearchBarWidget({
    super.key,
    required this.isLoading,
    required this.onSearch,
  });

  @override
  State<TaskSearchBarWidget> createState() => _TaskSearchBarWidgetState();
}

class _TaskSearchBarWidgetState extends State<TaskSearchBarWidget> {
  final TextEditingController _searchController = TextEditingController();

  void _submitSearch() {
    FocusScope.of(context).unfocus(); // Ẩn bàn phím sau khi search
    widget.onSearch(_searchController.text);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              controller: _searchController,
              decoration: InputDecoration(
                labelText: 'Nhập từ khóa tìm kiếm...',
                prefixIcon: const Icon(Icons.search),
                border: const OutlineInputBorder(),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: () {
                    _searchController.clear();
                    _submitSearch(); // Tự động load lại list khi clear
                  },
                ),
              ),
              onFieldSubmitted: (_) => _submitSearch(),
            ),
          ),
          const SizedBox(width: 12),
          SizedBox(
            height: 55, // Đồng bộ chiều cao với TextFormField
            child: ElevatedButton(
              onPressed: widget.isLoading ? null : _submitSearch,
              child: const Text('Tìm'),
            ),
          ),
        ],
      ),
    );
  }
}