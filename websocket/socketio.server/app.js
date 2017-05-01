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
    var monitor = 'sid_'+data.sid
    io.emit(monitor,data);
    console.log(monitor+":"+data);

  });
});
