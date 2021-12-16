class SetOrder{
  String? branch_id;
  String? type;
  String? vehicle_id;

  String?paymentMethod;
  Reservation ?reservation;

  SetOrder({this.type,this.paymentMethod,this.branch_id,this.reservation,this.vehicle_id});
 Map<String,dynamic> toMap(){

   return
       {
         "branch_id":branch_id,
         "type":type,
         "vehicle_id":vehicle_id,
         "payment_method":paymentMethod,
         "reservation":reservation!=null? {
           "persons":reservation!.persons,
           "date":"13-12-2025",
           "time":reservation!.time
         }:{}
    };
 }
}
class Reservation{
  String ?persons;
  String ?date;
  String ?time;

  Reservation({this.date,this.time,this.persons});
}