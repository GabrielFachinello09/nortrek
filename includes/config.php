<?php
// Caminho inicial do projeto, relativo à pasta onde o servidor foi iniciado.
// Servidor em projeto-fachinelo -> '/mini-sistema/nortrek'
// Servidor em mini-sistema      -> '/nortrek'
// Servidor em nortrek           -> ''
const BASE_URL_PADRAO = '/mini-sistema/nortrek';

// Guarda o caminho inicial atual (começa com o padrão acima).
function base_url($novo_caminho = null)
{
    static $base = BASE_URL_PADRAO;

    if ($novo_caminho !== null) {
        $base = rtrim($novo_caminho, '/');
    }

    return $base;
}

// Altera o caminho inicial. Ex.: definir_base_url('/nortrek');
function definir_base_url($novo_caminho)
{
    base_url($novo_caminho);
}

// Monta uma URL do projeto. Ex.: url('css/style.css') -> /mini-sistema/nortrek/css/style.css
function url($caminho = '')
{
    return base_url() . '/' . ltrim($caminho, '/');
}
