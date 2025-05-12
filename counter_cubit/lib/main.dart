import 'package:counter_cubit/bloc/counter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterBloc(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                  onPressed: () {
                    BlocProvider.of<CounterBloc>(context)
                        .add(CounterIncrementEvent());
                  },
                  icon: const Icon(Icons.add)),
              BlocConsumer<CounterBloc, CounterState>(
                listener: (context, state) {
                   if(state.wasIncremented == true){
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Incremented')));
          }
          else{
             ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Decremented ')));
          }
                },
                builder: (context, state) {
                  return Text(state.count.toString());
                },
              ),
              IconButton(
                  onPressed: () {
                    BlocProvider.of<CounterBloc>(context)
                        .add(CounterDecrementEvent());
                    // context.read<CounterBloc>().add(CounterDecrementEvent());
                  },
                  icon: const Icon(Icons.minimize)),
            ],
          ),
        ),
      );
    
  }
}
