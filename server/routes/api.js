const express= require('express')
const router = express.Router()
const Question=require('../models/question')

// router.get("/question", function(req,res,next){
  
//  Question.find({}).then(function(questions){
//     res.send(questions)
//   }).catch(next)
// })

router.post("/question",async function(req,res,next){
 try{
  const {question,answer}=req.body;
  let que= new Question({question,answer});
  que=await que.save();
  res.json(que);
 }catch(e){
    res.status(500).json({error:e.message});
 }
//  Question.create(req.body).then(function(question){
//     res.send(question)
//   }).catch(next)
});

// router.put("/question/:id",function(req,res,next){
//  Question.findOneAndUpdate({_id: req.params.id},req.body).then(
//     function(question){
//      Question.findOne({_id:req.params.id}).then(
//         function(question){
//           res.send(question) 
//         }
//       );
   
//   });
// });

// router.delete("/question/:id", function(req,res,next){
//  Question.findOneAndDelete(
//     {_id: req.params.id}
//   ).then(
//     function(question){
//       res.send(question)
//     }
//   )
// })
module.exports=router;

