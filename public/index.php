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

    $fecha = getdate();
    $actual = implode('-', [$fecha['year'], $fecha['mon'], $fecha['mday']]);

    $pdo = conectar();
    $sent = $pdo->query("SELECT ca.id, ca.fecha, ci.circuito from carreras as ca 
                        JOIN circuitos as ci 
                        ON ca.circuito_id = ci.id;");
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

    <div class="container">

        <div class="calendario">
            <table>
                <tr>
                    <th>Fecha</th>
                    <th>Circuito</th>
                </tr>
                <?php foreach ($sent as $fila ) : ?>
                    <?php if (strtotime($fila['fecha']) < strtotime($actual)) : ?>
                        <tr>

                            <th style="background-color: grey;"><?= $fila['fecha'] ?></th>
                            <th style="background-color: grey;"><?= $fila['circuito'] ?></th>
                        </tr>
                    <?php else: ?>
                    <tr>
                        <th><?= $fila['fecha'] ?></th>
                        <th><?= $fila['circuito'] ?></th>
                    </tr>
                <?php endif ?>


                <?php endforeach ?>
            </table>

        </div>

        <div class="clasificacion">
            <div class="clasipilotos">

            </div>
            <div class="clasiequipos">

            </div>
        </div>

        <div class="netxrace">

        </div>
        
    </div>
</body>

</html>