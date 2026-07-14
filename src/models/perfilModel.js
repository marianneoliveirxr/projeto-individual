const { add } = require("nodemon/lib/rules");
var database = require("../database/config");

function adicionarPerfil(perfilId, id_usuario, peso, altura, pesoMeta){
        var instrucaoSql = `
                UPDATE usuario SET fkPerfil = ${perfilId} WHERE id_usuario = ${id_usuario};
            `;
            console.log("Executando a instrução SQL: \n" + instrucaoSql);

            return database.executar(instrucaoSql).then(() => addProgresso(peso, altura, id_usuario, pesoMeta));
}

function addProgresso(peso, altura, id_usuario, pesoMeta){
    var instrucaoSql = `
        INSERT INTO progresso (peso, altura, fkUsuario) VALUES (${peso}, ${altura}, ${id_usuario});
    `;
    console.log("Executanto a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql).then(() => adicionarMeta(pesoMeta, id_usuario));
}

function adicionarMeta(pesoMeta, id_usuario){
    var instrucaoSql = `
    INSERT INTO meta (pesoMeta, fkUsuario) VALUES (${pesoMeta}, ${id_usuario});
    `;
    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

module.exports = {
    adicionarPerfil,
    addProgresso,
    adicionarMeta
}