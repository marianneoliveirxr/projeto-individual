var express = require("express");
var router = express.Router();

var treinosController = require("../controllers/treinosController");

router.get("/buscarTreinos/:id_usuario", function (req, res) {
    treinosController.buscarTreinos(req, res);
});

module.exports = router;