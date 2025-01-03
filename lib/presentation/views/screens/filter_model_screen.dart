import 'package:flutter/material.dart';
import 'package:my_training_app/presentation/view_models/search_filter_view_model.dart';
import 'package:provider/provider.dart';

class FilterModalScreen extends StatelessWidget {
  const FilterModalScreen({super.key});

  Widget _buildFilterOption(
      BuildContext context, String title, SearchFilterViewModel viewModel) {
    return viewModel.selectedFilter == title
        ? _selectedWidget(context, title)
        : _unSelectedWidget(context, title, viewModel);
  }

  Widget _unSelectedWidget(
      BuildContext context, String title, SearchFilterViewModel viewModel,
      {bool isFilter = true}) {
    return InkWell(
      onTap: isFilter
          ? () => viewModel.updateSelectedFilter(title)
          : null,
      child: SizedBox(
        height: 50,
        child: Row(
          children: [
            const Padding(
              padding: EdgeInsets.only(right: 8),
              child: SizedBox(
                width: 5,
                height: double.infinity,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Text(
                title,
                style: Theme.of(context).textTheme.displaySmall,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _selectedWidget(BuildContext context, String title) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: SizedBox(
        height: 50,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 8),
              child: Container(
                color: Theme.of(context).primaryColor,
                width: 5,
                height: double.infinity,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Text(
                title,
                style: Theme.of(context).textTheme.displaySmall,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _heading(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Sort and Filters',
            style: Theme.of(context).textTheme.displayMedium,
          ),
          IconButton(
            icon: Icon(
              Icons.close,
              color: Theme.of(context).disabledColor,
            ),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => SearchFilterViewModel(),
      child: Consumer<SearchFilterViewModel>(
        builder: (context, viewModel, _) {
          final double screenHeight = MediaQuery.of(context).size.height;

          return Container(
            color: Theme.of(context).scaffoldBackgroundColor,
            height: screenHeight * 0.75,
            child: Column(
              children: [
                _heading(context),
                Divider(color: Theme.of(context).disabledColor),
                Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Container(
                        color: Theme.of(context).canvasColor,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _unSelectedWidget(context, 'Sort by', viewModel,
                                isFilter: false),
                            _buildFilterOption(context, 'Location', viewModel),
                            _buildFilterOption(
                                context, 'Training Name', viewModel),
                            _buildFilterOption(
                                context, 'Trainer Name', viewModel),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextField(
                              decoration: const InputDecoration(
                                labelText: 'Search',
                                border: OutlineInputBorder(),
                              ),
                            ),
                            const SizedBox(height: 20),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: viewModel.availableOptions
                                  .map((option) => CheckboxListTile(
                                title: Text(option),
                                value: viewModel.selectedItems
                                    .contains(option),
                                onChanged: (isSelected) {
                                  viewModel.toggleSelection(option);
                                },
                              ))
                                  .toList(),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
