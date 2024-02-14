import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:idute/Home.dart';
import 'package:idute/signup_bloc.dart';

class SignUpPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final SignUpBloc _signUpBloc = BlocProvider.of<SignUpBloc>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Sign Up'),backgroundColor: Colors.black87,),
      body: BlocListener<SignUpBloc, SignUpState>(
        listener: (context, state) {
          if (state is SignUpSuccess) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Home()),
            );

          } else if (state is SignUpFailure) {

            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.errorMessage)),
            );
          }
        },
        child: BlocBuilder<SignUpBloc, SignUpState>(
          builder: (context, state) {
            if (state is SignUpLoading) {
              return Center(child: CircularProgressIndicator());
            }
            return Container(
              color: Colors.black87,
              child: Center(
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "IDUTE",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w300,
                            fontSize: 55),
                      ),
                      SizedBox(height: 40,),
                      TextField(
                        controller: _emailController,
                        decoration: InputDecoration(labelText: 'Email'),
                      ),
                      SizedBox(height: 20),
                      TextField(
                        controller: _passwordController,
                        decoration: InputDecoration(labelText: 'Password'),
                        obscureText: true,
                      ),
                      SizedBox(height: 80),
                      Container(
                        height: 50,
                        width: 120,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(backgroundColor: Colors.blue,),
                          onPressed: () {
                            _signUpBloc.add(
                              SignUpWithEmailAndPassword(
                                email: _emailController.text,
                                password: _passwordController.text,
                              ),
                            );
                          },
                          child:  const Text(
                            'Sign in',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w300,
                                fontSize: 20),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
