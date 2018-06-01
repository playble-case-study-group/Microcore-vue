let server = require('http').Server();
let io = require('socket.io')(server);
let Redis = require('ioredis');
let redis = new Redis();

redis.subscribe('progress');

redis.on('message', function (channel, message) {
    console.log(channel, message);

    message = JSON.parse(message);

    io.emit(chaneel + ':' + message.event, message.data);
});

server.listen(6379);

