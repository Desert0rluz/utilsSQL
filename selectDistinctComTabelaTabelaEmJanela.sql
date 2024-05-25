WITH Entradas AS (
    SELECT 
        id_contrato_servico,
        valor,
        data_referencia
    FROM 
        entrada_servico
    WHERE 
        encerrar = 0
        AND pendente_aprovacao_recebimento = 0
)
SELECT DISTINCT 
    rel.*,
    ISNULL(es.valor, 0) AS valor_recebido,
    CASE 
        WHEN rel.valor_periodo = 0 THEN 0
        ELSE ISNULL(rel.valor_periodo - ISNULL(es.valor, 0), rel.valor_periodo) 
    END AS saldo_restante
FROM 
    relacao_aditivo_contrato_servico rel
LEFT JOIN 
    Entradas es 
    ON es.id_contrato_servico = rel.id_contrato_servico
    AND CONVERT(CHAR(6), es.data_referencia, 112) = CONVERT(CHAR(6), CONVERT(DATE, '01/' + REPLICATE('0', 7 - LEN(rel.mes_periodo_novo)) + rel.mes_periodo_novo, 103), 112)
WHERE 
    rel.id_contrato_servico IN ({string.Join(",", idsContratos.Distinct())});
