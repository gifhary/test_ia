import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:test_ia/core/theme/pallet.dart';
import 'package:test_ia/features/dashboard/data/models/rick_and_morty_character.dart';
import 'package:test_ia/features/dashboard/presentation/cubit/dashboard_cubit.dart';
import 'package:test_ia/features/dashboard/presentation/widgets/edit_char_dialog.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  final List<RickAndMortyCharacter> _items = [];
  final ScrollController _scrollController = ScrollController();
  bool _isLoadingMore = false;

  @override
  void initState() {
    super.initState();
    // Setup infinite scroll listener
    _scrollController.addListener(_onScroll);
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => GetIt.I<DashboardCubit>().fetchApi(1),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  // Triggered when user scrolls to the end of the list
  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 200) {
      if (!_isLoadingMore) {
        _loadMoreItems();
      }
    }
  }

  // Simulates fetching more data from an API
  void _loadMoreItems() {
    //the api is only returns 20 item per page
    //(_items.length / 20).ceil() is to get the current page number
    GetIt.I<DashboardCubit>().fetchApi((_items.length / 20).ceil() + 1);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: GetIt.I<DashboardCubit>(),
      child: Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Pallet.deepPurple,
                Pallet.mediumPurple,
                Pallet.vibrantPink,
              ],
            ),
          ),
          child: SafeArea(
            child: Column(
              children: [
                // Custom AppBar to support seamless gradient look
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12.0,
                    vertical: 8.0,
                  ),
                  child: Row(
                    children: [
                      IconButton(
                        icon: const Icon(
                          Icons.logout_rounded,
                          color: Colors.white,
                          size: 28,
                        ),
                        tooltip: 'Logout',
                        onPressed: () {
                          // Pop back to Login Screen
                          Navigator.of(context).pop();
                        },
                      ),
                      const SizedBox(width: 8),
                      const Text(
                        "Dashboard",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.2,
                        ),
                      ),
                    ],
                  ),
                ),

                // Scrollable Dashboard Content
                Expanded(
                  child: BlocListener<DashboardCubit, DashboardState>(
                    listener: (context, state) {
                      state.mapOrNull(
                        loading: (value) =>
                            setState(() => _isLoadingMore = true),
                        success: (value) => setState(() {
                          _isLoadingMore = false;
                          if (value.pageItem.isNotEmpty) {
                            _items.addAll(value.pageItem);
                          }
                        }),
                        successUpdate: (value) {
                          setState(() {
                            _isLoadingMore = false;
                            int index = _items.indexWhere(
                              (item) => item.id == value.char.id,
                            );
                            _items[index] = value.char;
                          });
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'Item ID: ${value.char.id} updated',
                              ),
                              duration: const Duration(seconds: 2),
                            ),
                          );
                        },
                        successDelete: (value) {
                          setState(() => _isLoadingMore = false);
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Item ID: ${value.id} deleted'),
                              duration: const Duration(seconds: 2),
                            ),
                          );
                        },
                        error: (value) {
                          setState(() => _isLoadingMore = false);
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(value.error.message),
                              duration: const Duration(seconds: 4),
                            ),
                          );
                        },
                      );
                    },
                    child: _items.isEmpty && !_isLoadingMore
                        ? const Center(
                            child: Text(
                              "No items",
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 16,
                              ),
                            ),
                          )
                        : ListView.builder(
                            controller: _scrollController,
                            padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
                            itemCount: _items.length + (_isLoadingMore ? 1 : 0),
                            itemBuilder: (context, index) {
                              // Return loading indicator at the bottom if loading more
                              if (index == _items.length) {
                                return const Padding(
                                  padding: EdgeInsets.all(16.0),
                                  child: Center(
                                    child: CircularProgressIndicator(
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                        Colors.white,
                                      ),
                                    ),
                                  ),
                                );
                              }

                              final itemText =
                                  '${_items[index].id} - ${_items[index].name ?? ''}';

                              // Swipe-to-delete container
                              return Dismissible(
                                key: Key(itemText),
                                direction: DismissDirection.endToStart,
                                onDismissed: (direction) {
                                  //delete item from ui and local storage
                                  _items.removeAt(index);
                                  GetIt.I<DashboardCubit>().deleteCharacter(
                                    _items[index],
                                  );
                                },
                                background: Container(
                                  alignment: Alignment.centerRight,
                                  padding: const EdgeInsets.only(right: 20.0),
                                  margin: const EdgeInsets.symmetric(
                                    vertical: 8,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.redAccent.withValues(
                                      alpha: 0.8,
                                    ),
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  child: const Icon(
                                    Icons.delete_sweep,
                                    color: Colors.white,
                                    size: 28,
                                  ),
                                ),
                                child: Card(
                                  elevation: 0,
                                  margin: const EdgeInsets.symmetric(
                                    vertical: 8,
                                  ),
                                  color: Colors.white.withValues(alpha: 0.9),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  child: ListTile(
                                    contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 20,
                                      vertical: 8,
                                    ),
                                    title: Text(
                                      itemText,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16,
                                        color: Color(
                                          0xFF4A148C,
                                        ), // Match purple theme dark accents
                                      ),
                                    ),
                                    trailing: IconButton(
                                      icon: const Icon(
                                        Icons.edit,
                                        color: Color(0xFF8E24AA),
                                      ),
                                      onPressed: () => EditCharDialog.show(
                                        context,
                                        currentText: _items[index].name ?? '',
                                        onSave: (text) =>
                                            GetIt.I<DashboardCubit>()
                                                .updateCharacter(
                                                  _items[index].copyWith(
                                                    name: text,
                                                  ),
                                                ),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
