var express = require("express");
var router = express.Router();

var dashController = require("../controllers/dashController");

router.post("/atualizarPeso", function (req, res) {
    dashController.atualizarPeso(req, res);
});

module.exports = router;