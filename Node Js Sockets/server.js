//load expres Library :
const express=require('express');
//  Create Instance of express server
const app= express();
// load cors Library :
const cors=require('cors');
// Load mysql library :
const mysql=require('mysql');
// load http
const http = require('http').Server(app);
// load io
const io = require('socket.io')(http);
//Define port :
const port=3000;



// let  server cors free:
app.use(cors());

//Let express to accepts incoming form data 
//i)x-url-encoded[post]
//ii)JSON 
app.use(express.urlencoded({extended:true}));
app.use(express.json());

// Seeting up MYSQL connection string :
const con=mysql.createConnection({
    'host':'127.0.0.1',
    'user':'root',
    'password':'',
    'database':'mydb'
});
// Testing the connections :
con.connect((err)=>{
    if(err) throw err;
    else
    console.log('Successfully connecteed to MYSQL DataBase');
})


// Create a basic get request :
app.get('/',(req,res)=>{
    res.send("<h1>Welcome To Express ....!</h1>");
});
// Binding port number or starting the server :

io.on('connection', (socket) => {
    console.log('a user connected');
    socket.on('chat_message', (msg) => {
      console.log('message: ' + msg);
      io.emit('chat_message', msg);
      console.log('user connected');
    });
    socket.on('disconnect', () => {
      console.log('user disconnected');
    });
  });

app.listen(port,()=>{
    console.log(`Sever has started at ${port}`);
  });
  
