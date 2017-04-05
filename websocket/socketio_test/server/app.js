var app = require('http').createServer(handler)
var io = require('socket.io')(app);
var fs = require('fs');

app.listen(8888);

function handler (req, res) {
  fs.readFile(__dirname + '/index.html',
  function (err, data) {
    if (err) {
      res.writeHead(500);
      return res.end('Error loading index.html');
    }

    res.writeHead(200);
    res.end(data);
  });
}

io.on('connection', function (socket) {
  socket.emit('news', { hello2: 'worldwww',guohan:'values' });
  socket.on('listmessage', function (data) {
    // if (data.sid = '13947965133') {
    //   io.emit('sid_13947965133',data);
    //   console.log(data);
    // }else{
    //   console.log("no find match user");
    // }
      switch(data.sid)
      {

        case '13947965133':
            io.emit('sid_13947965133',data);
            //   console.log(data);
            break;

        case '17004957578':
           io.emit('sid_17004957578',data);
            //   console.log(data);
            break;

        case '15771337133':
            io.emit('sid_15771337133',data);
            //   console.log(data);
            break;

        default:
          console.log("no find match user");
      }
  });
});
