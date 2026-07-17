var treinosModel = require("../models/treinosModel");

function buscarTreinos(req, res){
    var id_usuario = req.params.id_usuario;


    if(id_usuario == undefined){
        res.status(400).send("id_usuario undefined");
    }

    treinosModel.buscarTreinos(id_usuario)
    .then(function (resultado){

        res.json(resultado);
    })
    .catch(function(erro){

        console.log(erro);
        res.status(500).json(erro.sqlMessage);
    })
}

module.exports = {
    buscarTreinos
};