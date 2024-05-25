WITH Requisicoes AS (
    SELECT 
        f.nome_fantasia_empresa,
        f.cnpj_empresa
    FROM 
        requisicao r
    INNER JOIN 
        departamento d ON r.id_departamento = d.id_departamento
    INNER JOIN 
        filial f ON f.id_filial = d.id_filial
    WHERE 
        f.is_removido = 0
        AND d.is_removido = 0
), 
RequisicoesServico AS (
    SELECT 
        f.nome_fantasia_empresa,
        f.cnpj_empresa
    FROM 
        requisicao_servico r
    INNER JOIN 
        departamento d ON r.id_departamento = d.id_departamento
    INNER JOIN 
        filial f ON f.id_filial = d.id_filial
    WHERE 
        f.is_removido = 0
        AND d.is_removido = 0
)
SELECT 
    nome_fantasia_empresa,
    cnpj_empresa,
    COUNT(*) AS total_requisicoes
FROM (
    SELECT * FROM Requisicoes
    UNION ALL
    SELECT * FROM RequisicoesServico
) AS Combined
GROUP BY 
    nome_fantasia_empresa,
    cnpj_empresa
ORDER BY 
    nome_fantasia_empresa;
