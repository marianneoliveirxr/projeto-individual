var database = require("../database/config");

function buscarTreinos(id_usuario){
    var instrucaoSql = `
    SELECT *
    FROM vw_treinos_usuario
    WHERE id_usuario = ${id_usuario}
    ORDER BY divisao;`;

    console.log(instrucaoSql);

    return database.executar(instrucaoSql);
}

module.exports = {
  buscarTreinos
};