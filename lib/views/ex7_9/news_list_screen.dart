import 'package:btlt7/controllers/news_controller.dart';
import 'package:btlt7/views/ex7_9/news_item_widget.dart';
import 'package:flutter/material.dart';

class NewsListScreen extends StatefulWidget {
  const NewsListScreen({super.key});

  @override
  State<NewsListScreen> createState() => _NewsListScreenState();
}

class _NewsListScreenState extends State<NewsListScreen> {
  final NewsController _controller = NewsController();

  @override
  void initState() {
    super.initState();
    // Tải dữ liệu khi vừa mở màn hình (Sẽ ưu tiên load từ Cache cực nhanh)
    _controller.loadNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bản tin hôm nay - 6451071033'),
      ),
      body: ListenableBuilder(
        listenable: _controller,
        builder: (context, child) {
          // 1. Trạng thái Loading ban đầu
          if (_controller.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          // 2. Xử lý hiển thị Layout chính
          return Column(
            children: [
              // Hiển thị báo lỗi nếu có (ví dụ: mất mạng khi pull to refresh)
              if (_controller.errorMessage != null)
                Container(
                  width: double.infinity,
                  color: Colors.red.shade100,
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    _controller.errorMessage!,
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.red),
                  ),
                ),

              // Nếu danh sách trống
              if (_controller.newsList.isEmpty && _controller.errorMessage == null)
                const Expanded(
                  child: Center(child: Text('Chưa có tin tức nào.')),
                ),

              // 3. ListView với chức năng Pull to Refresh
              if (_controller.newsList.isNotEmpty)
                Expanded(
                  child: RefreshIndicator(
                    // Gọi lại hàm loadNews với cờ isRefresh = true để ép tải API mới
                    onRefresh: () => _controller.loadNews(isRefresh: true),
                    child: ListView.builder(
                      physics: const AlwaysScrollableScrollPhysics(), // Bắt buộc để kéo thả được cả khi list ngắn
                      itemCount: _controller.newsList.length,
                      itemBuilder: (context, index) {
                        return NewsItemWidget(news: _controller.newsList[index]);
                      },
                    ),
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}