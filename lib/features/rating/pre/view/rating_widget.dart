import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../view_model/rating_cubit.dart';
import '../view_model/rating_state.dart';

class RatingWidget extends StatefulWidget {
  final int unitId;
  final double? currentRating;

  const RatingWidget({super.key, required this.unitId, this.currentRating});

  @override
  RatingWidgetState createState() => RatingWidgetState();
}

class RatingWidgetState extends State<RatingWidget> {
  late double rating;

  @override
  void initState() {
    super.initState();
    rating = widget.currentRating ?? 0.0;
  }

  void _showRatingDialog() {
    int selectedRating = rating.round();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Rate this unit'),
          content: StatefulBuilder(
            builder: (context, setStateDialog) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(5, (index) {
                  return IconButton(
                    icon: Icon(
                      index < selectedRating ? Icons.star : Icons.star_border,
                      color: Colors.amber,
                      size: 30,
                    ),
                    onPressed: () {
                      setStateDialog(() {
                        selectedRating = index + 1;
                      });
                    },
                  );
                }),
              );
            },
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                context.read<RatingCubit>().submitRating(
                  widget.unitId,
                  selectedRating,
                );
                Navigator.pop(context);
              },
              child: const Text('Submit'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RatingCubit, RatingState>(
      listener: (context, state) {
        if (state is RatingSuccess) {
          setState(() {
            rating = rating;
          });
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Rating submitted successfully')),
          );
        } else if (state is RatingFailure) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.message)));
        }
      },
      builder: (context, state) {
        return Row(
          children: [
            Icon(Icons.star, color: Colors.amber, size: 20),
            SizedBox(width: 4),
            Text(
              rating > 0 ? rating.toStringAsFixed(1) : "No rating",
              style: TextStyle(fontSize: 14),
            ),
            SizedBox(width: 10),
            ElevatedButton(
              onPressed: state is RatingLoading ? null : _showRatingDialog,
              child:
                  state is RatingLoading
                      ? const SizedBox(
                        width: 16,
                        height: 16,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                      : const Text('Rate'),
            ),
          ],
        );
      },
    );
  }
}
