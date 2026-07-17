var database = require("../database/config");

function buscarGraficoIMC(id_usuario) {
  var instrucaoSql = `
    SELECT 
    ROUND(peso / POWER(altura / 100, 2), 1) AS imc,
    DATE_FORMAT(dtRegistro, '%d/%m') AS dtRegistro
    FROM VW_dashboard
    WHERE fkUsuario = ${id_usuario}
    ORDER BY dtRegistro ASC;
  `;
  console.log("Executando a instrução SQL: \n" + instrucaoSql);
  return database.executar(instrucaoSql);
}

function buscarGraficoMeta(id_usuario) {
  var instrucaoSql = `
  SELECT
    pg.peso AS pesoAtual,
    m.pesoMeta
    FROM progresso pg
    JOIN meta m
    ON m.fkUsuario = pg.fkUsuario
    WHERE pg.fkUsuario = ${id_usuario}
    ORDER BY pg.dtRegistro DESC
    LIMIT 1;
  `;
  console.log("Executando a instrução SQL: \n" + instrucaoSql);
  return database.executar(instrucaoSql);
}

function atualizarPeso(id_usuario, peso, altura) {
  var instrucaoSql = `
                 INSERT INTO progresso (peso, altura, fkUsuario) VALUES (${peso}, ${altura}, ${id_usuario});
              `;
  console.log("Executando a instrução SQL: \n" + instrucaoSql);
  return database.executar(instrucaoSql);
}

function buscarTotaldeRegistros(id_usuario) {
  var instrucaoSql = `
  SELECT COUNT(*) AS totalRegistros
  FROM VW_dashboard
  WHERE fkUsuario = ${id_usuario};`;
  console.log("Executando a instrução SQL: \n" + instrucaoSql);
  return database.executar(instrucaoSql);
}

function buscarIMCAtual(id_usuario){
  var instrucaoSql = `
  SELECT
    ROUND(peso / POWER(altura / 100, 2), 1) AS imc
  FROM progresso
  WHERE fkUsuario = ${id_usuario}
  ORDER BY dtRegistro DESC
  LIMIT 1;`
}
module.exports = {
  buscarGraficoMeta,
  buscarGraficoIMC,
  atualizarPeso,
  buscarTotaldeRegistros,
};
