var database = require("../database/config");

function adicionarPerfil(perfilId, id_usuario, peso, altura, pesoMeta){
        var instrucaoSql = `
                UPDATE usuario SET fkPerfil = ${perfilId} WHERE id_usuario = ${id_usuario};
            `;
            console.log("Executando a instrução SQL: \n" + instrucaoSql);

            return database.executar(instrucaoSql).then(() => addProgresso(peso, altura, id_usuario, pesoMeta));
}

module.exports = {
    adicionarPerfil
}