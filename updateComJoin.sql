-- Seleciona os registros distintos de condicao_pagamento
SELECT DISTINCT cp.*
FROM pedido_item pid
INNER JOIN pedido p ON pid.id_pedido = p.id_pedido
INNER JOIN cotacao cs ON p.id_cotacao = cs.id_cotacao
INNER JOIN cotacao_fornecedor cf ON cs.id_cotacao = cf.id_cotacao
INNER JOIN condicao_pagamento cp ON cf.id_condicao_pagamento = cp.id_condicao_pagamento
WHERE p.id_pedido = @id_pedido AND cf.id_fornecedor = @id_fornecedor;

-- Atualiza os registros de condicao_pagamento
UPDATE cp
SET cp.is_removido = 0
FROM condicao_pagamento cp
INNER JOIN cotacao_fornecedor cf ON cp.id_condicao_pagamento = cf.id_condicao_pagamento
INNER JOIN cotacao cs ON cf.id_cotacao = cs.id_cotacao
INNER JOIN pedido p ON cs.id_cotacao = p.id_cotacao
INNER JOIN pedido_item pid ON p.id_pedido = pid.id_pedido
WHERE cp.is_removido = 1
AND p.id_pedido = @id_pedido
AND cf.id_fornecedor = @id_fornecedor;
