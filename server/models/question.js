const mongoose = require('mongoose')
const Schema =mongoose.Schema

const QuestionsSchema = new Schema(
  {
    question:{
    type:String,
    required:true
  },
  answer:{
    type:[String],
    required:true
    
  }
})

const Questions=mongoose.model('Question',QuestionsSchema)

module.exports= Questions;