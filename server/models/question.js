const mongoose = require('mongoose')
const Schema =mongoose.Schema

const QuestionsSchema = new Schema(
  {
    //type of the form element
    element:{
      type:String,
      required:true
    },
    //question 
    question:{
    type:String,
    required:true
   },
   //all the available options
  options:{
    type :[String],
    required:true
  },
  // answer from the options
  answer:{
    type:[String],
    required:true
    
  }

})

const Questions=mongoose.model('Question',QuestionsSchema)

module.exports= Questions;
