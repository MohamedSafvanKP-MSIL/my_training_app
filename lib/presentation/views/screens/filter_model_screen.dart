import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../view_models/home_view_model.dart';
import '../../view_models/search_filter_view_model.dart';

class FilterModalScreen extends StatelessWidget {
  const FilterModalScreen({super.key, required this.homeViewModel});

  final HomeViewModel homeViewModel;

  @override
  Widget build(BuildContext context) {
    return Consumer<SearchFilterViewModel>(
      builder: (BuildContext context, viewModel, Widget? child) {
        return Container(
          color: Theme.of(context).scaffoldBackgroundColor,
          child: Column(
            children: [
              // Header
              Padding(
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
              ),
              // Filters
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          _unSelectedWidget(context, 'Sort By', viewModel,
                              isFilter: false),
                          _buildFilterOption(context, 'Location', viewModel),
                          _buildFilterOption(
                              context, 'Training Name', viewModel),
                          _buildFilterOption(
                              context, 'Trainer Name', viewModel),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 8),
                            child: TextField(
                              onChanged: viewModel.updateSearchTerm,
                              decoration: const InputDecoration(
                                labelText: 'Search',
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ),
                          Flexible(
                            // height: 350,
                            // color: Colors.redAccent,
                            child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: viewModel
                                  .getAvailableOptions(homeViewModel)
                                  .length,
                              itemBuilder: (context, index) {
                                return CheckboxListTile(
                                  title: Text(viewModel.getAvailableOptions(
                                      homeViewModel)[index]),
                                  value: viewModel.selectedItems.contains(
                                      viewModel.getAvailableOptions(
                                          homeViewModel)[index]),
                                  onChanged: (_) =>
                                      viewModel.toggleSelectedItem(
                                          viewModel.getAvailableOptions(
                                              homeViewModel)[index]),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

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
      onTap: isFilter ? () => viewModel.updateSelectedFilter(title) : null,
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
              padding: const EdgeInsets.symmetric(vertical: 10),
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
              padding: const EdgeInsets.symmetric(vertical: 10),
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
}
