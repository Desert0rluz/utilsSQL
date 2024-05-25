BEGIN TRANSACTION;

INSERT INTO produto (
    nome_produto,
    id_categoria_produto,
    id_unidade_medida,
    descricao_produto,
    qtd_min_compra,
    is_removido,
    is_produto_almoxarifado,
    ipi,
    is_imobilizado,
    is_indisponivel,
    analiseTecnica,
    analisePatrimonio,
    icms,
    vida_util,
    taxa_depreciacao,
    ncm,
    qme,
    cod_tipo_erp,
    valor_maximo_permitido
)
SELECT 
    nome_produto,
    --@new_id_categoria_produto AS id_categoria_produto,
    id_unidade_medida,
    descricao_produto,
    qtd_min_compra,
    is_removido,
    is_produto_almoxarifado,
    ipi,
    is_imobilizado,
    is_indisponivel,
    analiseTecnica,
    analisePatrimonio,
    icms,
    vida_util,
    taxa_depreciacao,
    ncm,
    qme,
    cod_tipo_erp,
    valor_maximo_permitido
FROM produto
WHERE nome_produto = --@nome_produto 
AND id_categoria_produto = --@id_categoria_produto
ORDER BY nome_produto, id_produto;

COMMIT TRANSACTION;
