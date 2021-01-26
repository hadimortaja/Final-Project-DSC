import 'dart:io';

var tripList = <Trip>[];
// var idCout = 1;
void main() {
  var isLoop = true;

  while (isLoop) {
    print(">>>>>>>>>>Welcome Back<<<<<<<<<<");

    print("(1)add trip");
    print("(2)edit trip");
    print("(3)delete trip");
    print("(4)view trip");
    print("(5)search trip");
    print("(6)revice trip");
    print("(7)exit");
    var entertype = stdin.readLineSync();
    switch (entertype) {
      case "1":
        AddTrip();
        break;
      case "2":
        print("Enter id to Update the trip");
        var id = stdin.readLineSync();
        EditTrip(id);
        break;
      case "3":
        print("Enter id to Delete the trip");
        var id = stdin.readLineSync();
        DeleteTrip(id);
        break;
      case "4":
        ViewTrip();
        break;
      case "5":
        print(" Enter trip price to Search ");
        var price = stdin.readLineSync();
        SearchTrip(price);
        break;
      case "6":
        Reverse();
        break;
      case "7":
        isLoop = false;
        break;
      default:
        print("Please Add number from the numbers above");
    }
  }
}

void AddTrip() {
  print("Enter trip id");
  var id = stdin.readLineSync();
  print("Enter Location");
  var location = stdin.readLineSync();
  print("Enter Passenger Limit");
  var passenger_limit = stdin.readLineSync();
  print("Enter trip date");
  var date = stdin.readLineSync();
  print("Enter trip Price");
  var price = stdin.readLineSync();
  tripList.add(Trip(id, location, passenger_limit, date, price, 0));
  print("Successfully added trip");
}

void EditTrip(String id) {
  for (int i = 0; i < tripList.length; i++) {
    if (id == tripList[i].id) {
      var trip = tripList[i];
      print("Enter new trip Location");
      var location = stdin.readLineSync();
      trip.location = location;
      print("Enter new Passenger Limit");
      var passenger_limit = stdin.readLineSync();
      trip.passenger_limit = passenger_limit;
      print("Enter new trip date");
      var date = stdin.readLineSync();
      trip.date = date;
      print("Enter new trip Price");
      var price = stdin.readLineSync();
      trip.price = price;
      tripList.remove(tripList[i]);
      tripList.insert(i, trip);
      print("Successfully Updated trip");

      break;
    }
  }
}

void DeleteTrip(String id) {
  for (int i = 0; i < tripList.length; i++) {
    if (id == tripList[i].id) {
      var trip = tripList[i];
      tripList.remove(trip);
      print("Successfully Deleted trip");
      break;
    }
  }
}

void ViewTrip() {
  for (int i = 0; i < tripList.length; i++) {
    var trip = tripList[i];
    print(
        "id: ${trip.id}, location: ${trip.location}, passenger_limit: ${trip.passenger_limit}, date: ${trip.date}, price:  ${trip.price}");
  }
}

void SearchTrip(String price) {
  for (int i = 0; i < tripList.length; i++) {
    if (price == tripList[i].price) {
      var trip = tripList[i];
      print(
          "id: ${trip.id}, location: ${trip.location}, passenger_limit: ${trip.passenger_limit}, date: ${trip.date}, price:  ${trip.price}");
    }
  }
}

void Reverse() {
  print("Enter the Trip id");
  var id = stdin.readLineSync();
  for (int i = 0; i < tripList.length; i++) {
    if (id == tripList[i].id) {
      var trip = tripList[i];
      print("enter person count");
      var person = int.parse(stdin.readLineSync());
      if ((person + trip.count) < int.parse(trip.passenger_limit)) {
        trip.count = (person + trip.count);
        tripList.remove(tripList[i]);
        tripList.insert(i, trip);
        print("Successfully added person to trip");
      } else {
        print("Sorry the trip is full");
      }
    }
  }
}

class Trip {
  var id, location, passenger_limit, date, price, count;
  Trip(id, location, passenger_limit, date, price, count) {
    this.id = id;
    this.count = count;
    this.location = location;
    this.passenger_limit = passenger_limit;
    this.date = date;
    this.price = price;
  }
}
