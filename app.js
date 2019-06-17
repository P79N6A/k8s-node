const express = require('express');
const path = require("path");
const index = require('./routes/index.js');

const app =  express();
// app.set("views", path.join(__dirname, 'views'));
// app.set('view engine','html');
app.use('/node',index);
//根据电话号码返回省市
app.post('/phoneLocation',(req,res)=>{

    setTimeout(()=>{
        res.json({
            success: true,
            obj:{
                province: '河北',
                city: '保定'
            }
        })
    },1000)
})

//根据省市返回面值列表
app.post('/faceList',(req,res)=>{

    setTimeout(()=>{
        res.json({
            success: true,
            obj:['20元','50元','100元']
        })
    a
    },1000)
    
})

app.listen(80,()=>{
    console.log('server start')
})