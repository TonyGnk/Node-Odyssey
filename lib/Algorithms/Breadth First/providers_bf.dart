//Create a bool provider for keep track if the algorithm has finished
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Ένας πάροχος που παρακολουθεί εάν ο αλγόριθμος έχει ολοκληρωθεί.
// Γίνεται true όταν ο αλγόριθμος τελειώνει και false όταν ξεκινά μια νέα αναζήτηση.
final isAlgorithmEndProviderBf = StateProvider<bool>((ref) => false);
