var express = require("express");
var router = express.Router();

var perfilController = require("../controllers/perfilController");

//Recebendo os dados do html e direcionando para a função cadastrar de perfilController.js
router.post("/adicionarPerfil", function (req, res) {
    perfilController.adicionarPerfil(req, res);
})
module.exports = router;