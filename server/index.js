const express =require('express')
const mongoose = require('mongoose')

const app =express();
const DB="mongodb+srv://dawarepramod:dawarepramod@cluster0.lsbzpu0.mongodb.net/test"
mongoose.connect(DB).then(()=>{
  console.log("connection successful")
})
mongoose.Promise=global.Promise;

app.use(express.json());

// app.get ('/api',(req,res)=>res.send('API WORKING!!'))
app.use('/api',require('./routes/api'))
app.use(function(err,req,res,next){
  res.status(422).send({error: err.message})
})

app.listen(process.env.port ||4000,function(){
  console.log('Now Listening for Request');
})