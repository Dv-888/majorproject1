import 'package:mongo_dart/mongo_dart.dart';
import 'package:sevr/sevr.dart';

void start() async {
  // Log into database
  final db = await Db.create(
      'mongodb+srv://phantom:test12345678@whalien.n6ytg.mongodb.net/MPR_DB?retryWrites=true&w=majority');
  await db.open();
  //var srt = 1;
  final coll = db.collection('FarmDB');

  //print(await coll.find().toList());

  //server connection
  const port = 6001;
  final serv = Sevr();

  serv.get('/', [
    (ServRequest req, ServResponse res) async {
      final Count_doc = await coll.count() - 1;
      final FarmDB = await coll.find().skip(Count_doc).toList();
      //var count_doc = FarmDB as String;
      //print(count_doc);
      return res.status(200).json({'UserDB': FarmDB});
    }
  ]);

  //server listening for connections
  serv.listen(port, callback: () {
    print('server listening on port: $port');
  });
}
