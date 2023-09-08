import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ihun_jobfindie/features/jobs/search/controllers/search_job_provider.dart';
import 'package:ihun_jobfindie/shared/theme/text_styles.dart';
import 'package:ihun_jobfindie/shared/widgets/app_appbar.dart';

class SearchPage extends ConsumerWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextEditingController controller = TextEditingController();
    final requestStatus = ref.watch(searchJobProviderStateProvider);
    final jobNotifier = ref.watch(searchJobProviderStateProvider.notifier);
    return Scaffold(
        appBar: buildPreferredSizeWidget(context),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              child: Center(
                child: TextField(
                  cursorColor: Colors.black,
                  controller: controller,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(
                      Icons.search,
                      color: Colors.black,
                    ),
                    labelText: 'Find your dream job',
                    border: const OutlineInputBorder(),
                    focusColor: Colors.black,
                    labelStyle: TextStyles.defaultStyle,
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                  ),
                  onSubmitted: (value) {
                    value = controller.text;
                    jobNotifier.fetch(value);
                  },
                ),
              ),
            ),
            requestStatus.when(
              data: (data) {
                return Expanded(
                  child: ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      final job = data[index];
                      return ListTile(
                        title: Text(job.title),
                        subtitle: Text(job.company),
                      );
                    },
                  ),
                );
              },
              loading: () => const Center(
                child: CircularProgressIndicator.adaptive(),
              ),
              error: (error, stackTrace) => Center(
                child: Text(error.toString()),
              ),
            ),
          ],
        ));
  }
}
