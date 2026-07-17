var express = require("express");
var router = express.Router();

var dashController = require("../controllers/dashController");

router.post("/atualizarPeso", function (req, res) {
    dashController.atualizarPeso(req, res);
});

router.get("/buscarGraficoIMC/:id_usuario", function(req,res){
    dashController.buscarGraficoIMC(req,res);
});

router.get("/buscarGraficoMeta/:id_usuario", function(req,res){
    dashController.buscarGraficoMeta(req,res);
});

router.get("/buscarTotaldeRegistros/:id_usuario", function(req,res){
    dashController.buscarTotaldeRegistros(req,res);
});

module.exports = router;