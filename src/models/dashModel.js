var database = require("../database/config");

function atualizarPeso(id_usuario, peso, altura) {
  var instrucaoSql = `
                 INSERT INTO progresso (peso, altura, fkUsuario) VALUES (${peso}, ${altura}, ${id_usuario});
              `;
  console.log("Executando a instrução SQL: \n" + instrucaoSql);
  return database.executar(instrucaoSql);
}

module.exports = {
    atualizarPeso
}