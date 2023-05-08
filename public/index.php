<?php session_start() ?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>MotoGP</title>
    <link rel="shortcut icon" href="/img/Moto_Gp_logo.svg" type="image/x-icon">
    <link rel="stylesheet" href="/styles/index.css">
    <link rel="stylesheet" href="/styles/navbar.css">
</head>

<body>

    <?php
    require '../vendor/autoload.php';

    $pdo = conectar();
    $sent = $pdo->query("SELECT e.equipo, 
                            STRING_AGG(DISTINCT p.nombre || ' ' || p.apellido, ', ') AS pilotos, 
                            STRING_AGG(DISTINCT m.moto, ', ') AS motos
                            FROM equipos AS e 
                            INNER JOIN pilotos AS p ON e.moto_id = p.moto_id 
                            INNER JOIN motos AS m ON m.id = e.moto_id 
                            GROUP BY e.equipo;");
    ?>
    <header>
        <img src="img/Moto_Gp_logo.svg" alt="MotoGP" class="logo">

        <nav>
            <a href="index.php">Inicio</a>
            <a href="">Calendario</a>
            <a href="">Pilotos</a>
            <a href="">Equipos</a>
            <a href="">Resultados</a>
            <a href="">Multimedia</a>
            <a href="">Tienda</a>

        </nav>
    </header>

    <h1>Mundial de MotoGP 2023</h1>

    <section class="articles">
    <?php foreach ($sent as $fila) : ?>
        <?php $piloto = explode(',',$fila['pilotos']); ?>
            <article>
                <div class="article-wrapper">
                    <figure>
                        <img src="img/<?= hh($fila['equipo']) ?>.png" alt="<?= $fila['equipo'] ?>" />
                    </figure>
                    <div class="article-body">
                        <h3 align="center"><?= $fila['equipo'] ?></h3>
                    </div>
                </div>
            </article>
            <?php endforeach ?>
        </section>
</body>

</html>