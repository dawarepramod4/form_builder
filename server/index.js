const express =require('express')
const app =express();

app.get ('/api',(req,res)=>res.send('API WORKING!!'))

app.listen(process.env.port ||4000,function(){
  console.log('Now Listening for Request');
})