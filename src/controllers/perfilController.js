var perfilModel = require("../models/perfilModel");

function adicionarPerfil(req, res) {
    // Crie uma variável que vá recuperar os valores do arquivo cadastro.html
    var perfilId = req.body.perfilServer;
    var id_usuario = req.body.usuarioServer;
    var peso = req.body.pesoServer;
    var altura = req.body.alturaServer;
    var pesoMeta = req.body.metaServer;

    // Faça as validações dos valores
    if (perfilId == undefined) {
        res.status(400).send("Seu perfilId está undefined!");
    } else {

        // Passe os valores como parâmetro e vá para o arquivo perfilModel.js
        perfilModel.adicionarPerfil(perfilId, id_usuario, peso, altura, pesoMeta)
            .then(
                function (resultado) {
                    res.json(resultado);
                }
            ).catch(
                function (erro) {
                    console.log(erro);
                    console.log(
                        "\nHouve um erro no perfil! Erro: ",
                        erro.sqlMessage
                    );
                    res.status(500).json(erro.sqlMessage);
                }
            );
    }
}

module.exports = {
    adicionarPerfil
}