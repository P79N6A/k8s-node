const express = require('express');
const router =  express.Router();

router.get('/', function(req, res){
    res.sendfile('views/index.html');
});

module.exports = router;