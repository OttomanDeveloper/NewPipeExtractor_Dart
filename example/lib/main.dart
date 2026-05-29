import 'package:flutter/material.dart';
import 'package:newpipeextractor_dart/newpipeextractor_dart.dart';

void main() => runApp(const ExampleApp());

class ExampleApp extends StatelessWidget {
  const ExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'NewPipeExtractor Example',
      home: SearchScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<StreamInfoItem> _results = [];
  List<String> _suggestions = [];
  bool _loading = false;
  final _controller = TextEditingController();

  Future<void> _search(String query) async {
    setState(() => _loading = true);
    try {
      final page = await SearchExtractor.searchYoutube(
        query,
        [SearchFilter.videos.value],
      );
      setState(() {
        _results = page.result.videos;
        _loading = false;
      });
    } catch (e) {
      setState(() => _loading = false);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: $e')),
        );
      }
    }
  }

  Future<void> _getSuggestions(String query) async {
    if (query.length < 2) {
      setState(() => _suggestions = []);
      return;
    }
    try {
      final suggestions = await SearchExtractor.getSearchSuggestions(query);
      setState(() => _suggestions = suggestions);
    } catch (_) {}
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('NewPipeExtractor Example')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                hintText: 'Search YouTube...',
                suffixIcon: IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () => _search(_controller.text),
                ),
              ),
              onChanged: _getSuggestions,
              onSubmitted: _search,
            ),
          ),
          if (_suggestions.isNotEmpty)
            SizedBox(
              height: 40,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: _suggestions.length,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: ActionChip(
                    label: Text(_suggestions[index]),
                    onPressed: () {
                      _controller.text = _suggestions[index];
                      _search(_suggestions[index]);
                      setState(() => _suggestions = []);
                    },
                  ),
                ),
              ),
            ),
          if (_loading)
            const Padding(
              padding: EdgeInsets.all(16),
              child: CircularProgressIndicator(),
            ),
          Expanded(
            child: ListView.builder(
              itemCount: _results.length,
              itemBuilder: (context, index) {
                final item = _results[index];
                return ListTile(
                  leading: item.thumbnails.isNotEmpty
                      ? Image.network(
                          item.thumbnails.first,
                          width: 120,
                          height: 68,
                          fit: BoxFit.cover,
                          errorBuilder: (_, __, ___) =>
                              const Icon(Icons.video_library),
                        )
                      : const Icon(Icons.video_library),
                  title: Text(
                    item.name ?? 'Unknown',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  subtitle: Text(
                    '${item.uploaderName ?? 'Unknown'} • ${_formatDuration(item.duration)}',
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  String _formatDuration(int? seconds) {
    if (seconds == null) return '--:--';
    final m = seconds ~/ 60;
    final s = seconds % 60;
    return '${m.toString().padLeft(2, '0')}:${s.toString().padLeft(2, '0')}';
  }
}
