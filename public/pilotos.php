<?php session_start() ?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>MotoGP</title>
    <link rel="shortcut icon" href="/img/Moto_Gp_logo.svg" type="image/x-icon">
    <link rel="stylesheet" href="/styles/piloto.css">
    <link rel="stylesheet" href="/styles/navbar.css">
</head>

<body>

    <?php
    require '../vendor/autoload.php';

    $pdo = conectar();
    $sent = $pdo->query("SELECT * FROM pilotos");
    ?>
    <header>
        <img src="img/Moto_Gp_logo.svg" alt="MotoGP" class="logo">

        <nav>
            <a href="index.php">Inicio</a>
            <a href="">Calendario</a>
            <a href="pilotos.php">Pilotos</a>
            <a href="equipos.php">Equipos</a>
            <a href="">Resultados</a>
            <a href="">Multimedia</a>
            <a href="">Tienda</a>

        </nav>
    </header>

    <h1>Mundial de MotoGP 2023</h1>

    <section class="articles">
    <?php foreach ($sent as $fila) : ?>
            <article>
                <div class="article-wrapper">
                    <figure>
                        <img src="img/<?= hh($fila['nombre']) ?>.png" alt="<?= $fila['nombre'] ?>" />
                    </figure>
                    <div class="article-body">
                        <h4><?= hh($fila['nombre']) ?></h4>
                        <h3><?= hh($fila['apellido']) ?></h3>
                    </div>
                </div>
            </article>
            <?php endforeach ?>
        </section>
</body>

</html>