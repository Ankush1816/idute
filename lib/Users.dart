import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:idute/Firestoreservices.dart';


abstract class UsersEvent {}

class LoadUsers extends UsersEvent {}


abstract class UsersState {}

class UsersLoading extends UsersState {}

class UsersLoaded extends UsersState {
  final List<DocumentSnapshot> users;

  UsersLoaded(this.users);
}

class UsersError extends UsersState {
  final String errorMessage;

  UsersError(this.errorMessage);
}

class UsersBloc extends Bloc<UsersEvent, UsersState> {
  final Firestoreservices firestoreService;

  UsersBloc(this.firestoreService) : super(UsersLoading()) {
    on<LoadUsers>(_onLoadUsers);
  }

  void _onLoadUsers(LoadUsers event, Emitter<UsersState> emit) async {
    emit(UsersLoading());
    try {
      final users = await Firestoreservices.getProducts("t");
      emit(UsersLoaded(users));
    } catch (e) {
      emit(UsersError(e.toString()));
    }
  }

  @override
  Stream<UsersState> mapEventToState(UsersEvent event) async* {

  }
}


class Users extends StatelessWidget {
  final UsersBloc _usersBloc = UsersBloc(Firestoreservices());

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _usersBloc..add(LoadUsers()),
      child: Scaffold(
        backgroundColor: Colors.black87,
        appBar: AppBar(
          titleSpacing: 0,
          backgroundColor: Colors.black87,
          iconTheme: IconThemeData(color: Colors.white),
          title: Text(
            "Users",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          actions: [
            IconButton(
                onPressed: () {}, icon: Icon(Icons.filter_alt_outlined)),
            IconButton(
                onPressed: () {},
                icon: Icon(Icons.stacked_bar_chart_outlined)),
            IconButton(onPressed: () {}, icon: Icon(Icons.search)),
          ],
        ),
        body: BlocBuilder<UsersBloc, UsersState>(
          builder: (context, state) {
            if (state is UsersLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is UsersLoaded) {
              return _buildUsersList(state.users);
            } else if (state is UsersError) {
              return Center(child: Text(state.errorMessage));
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }

  Widget _buildUsersList(List<DocumentSnapshot> users) {
    return Container(
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: GridView.builder(
          physics: ScrollPhysics(),
          shrinkWrap: true,
          itemCount: users.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1,
            crossAxisSpacing: 2,
            mainAxisSpacing: 4,
            mainAxisExtent: 70,
          ),
          itemBuilder: (context, index) {
            return ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage("${users[index]['p_image'][0]}"),
              ),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("User name", style: TextStyle(color: Colors.white)),
                      Text("Tech", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w200)),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Text("Details", style: TextStyle(color: Colors.white)),
                          Text("Company", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w200)),
                        ],
                      ),
                      SizedBox(width: 10),
                      CircleAvatar(backgroundColor: Colors.grey),
                      SizedBox(width: 5),
                      Icon(Icons.more_vert_outlined, color: Colors.white),
                    ],
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }


}
