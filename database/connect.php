<?php 
$host = "Seuip";
$dbname = "suaBaseDeDados";
$user = "seuUsuario";
$pass = "suaSenha";
try {
    $conexao = new PDO(
        "pgsql:host=$host;dbname=$dbname",
        $user,
        $pass
    );
} catch (PDOException $e) {
    echo "Erro: ". $e->getMessage();
}
?>
