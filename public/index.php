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
    $sent = $pdo->query("SELECT ca.id, ca.fecha, ci.circuito, ci.pais from carreras as ca 
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
            <table class="carreras">
                <tr>
                    <th colspan="2">Calendario</th>

                </tr>
                <?php foreach ($sent as $fila ) : ?>
                    <?php if (strtotime($fila['fecha']) < strtotime($actual)) : ?>
                        <tr>

                            <td class="finalizado"><?= $fila['fecha'] ?></td>
                            <td class="finalizado pais"> <img src="img/banderas/<?= $fila['pais'] ?>.png" alt="<?= $fila['pais'] ?>"> <?= $fila['circuito'] ?></td>
                        </tr>
                    <?php else: ?>
                    <tr>
                        <td class="pendiente"><?= $fila['fecha'] ?></td>
                        <td class="pendiente pais"><img src="img/banderas/<?= $fila['pais'] ?>.png" alt="<?= $fila['pais'] ?>"><?= $fila['circuito'] ?></td>
                    </tr>
                <?php endif ?>


                <?php endforeach ?>
            </table>

        </div>

        <div class="clasificacion">
            <div class="clasipilotos">
                <table>
                    
                </table>

            </div>
            <div class="clasiequipos">

            </div>
        </div>

        <div class="netxrace">

        </div>
        
    </div>
</body>

</html>