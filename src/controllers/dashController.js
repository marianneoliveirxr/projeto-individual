var dashModel = require("../models/dashModel");

function buscarGraficoIMC(req, res) {
  var id_usuario = req.params.id_usuario;

  dashModel
    .buscarGraficoIMC(id_usuario)

    .then(function (resultado) {
      res.json(resultado);
    })

    .catch(function (erro) {
      console.log(erro);

      res.status(500).send(erro.sqlMessage);
    });
}

function buscarGraficoMeta(req, res) {
  var id_usuario = req.params.id_usuario;

  dashModel
    .buscarGraficoMeta(id_usuario)

    .then(function (resultado) {
      res.json(resultado);
    })

    .catch(function (erro) {
      console.log(erro);

      res.status(500).send(erro.sqlMessage);
    });
}

function atualizarPeso(req, res) {
  var id_usuario = req.body.id_usuario;
  var peso = req.body.peso;
  var altura = req.body.altura;
  var meta = req.body.meta;

  if (id_usuario == undefined) {
    res.status(400).send("id_usuario está undefined");
  } else if (peso == undefined) {
    res.status(400).send("peso está undefined");
  } else if (altura == undefined) {
    res.status(400).send("altura está undefined");
  } else {
    dashModel
      .atualizarPeso(id_usuario, peso, altura)
      .then(function () {
        if (meta != undefined && meta > 0) {
          return dashModel.atualizarMeta(id_usuario, meta);
        }

        return Promise.resolve();
      })

      .then(function () {
        res.status(200).json({
          mensagem: "Peso e meta atualizados!",
        });
      })

      .catch(function (erro) {
        console.log(erro);
        console.log("\nHouve um erro ao atualizar! Erro:", erro.sqlMessage);

        res.status(500).json(erro.sqlMessage);
      });
  }
}

function buscarTotaldeRegistros(req,res){
    var id_usuario = req.params.id_usuario;

    dashModel
    .buscarTotaldeRegistros(id_usuario)

    .then(function (resultado) {
      res.json(resultado);
    })

    .catch(function (erro) {
      console.log(erro);

      res.status(500).send(erro.sqlMessage);
    });
}

module.exports = {
buscarGraficoMeta,
  buscarGraficoIMC,
  atualizarPeso,
  buscarTotaldeRegistros
};
