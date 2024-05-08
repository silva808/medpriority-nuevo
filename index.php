<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Medpriority ADMIN</title>
    <link rel="stylesheet" href="Css/estilos2.css">
</head>

<body>
    <section class="general_todo">
        <div class="conheader">  <!-- contenedor header o barra principal -->


            <div class="logo"><!-- contenedor del logo y la letras del logo -->
                <div class="img_logo"></div>
                <div class="letras_logo">
                    <p>MedPriority</p>
                </div>
            </div>

            <div class="datos_barra">
                <p>ADMIN</p>

                <div class="img_notificaion"></div>
    
                <div class="img_usuario"></div>
            </div>

        </div>

        <div class="congeneral"><!--contendor 2 general para el menu y los formularios -->

            <div class="con_menu"><!-- contenedor del menu -->
                <div class="cont_menu_sub">


                
                <div class="inicio"><!-- contenedores de el menu -->
                    <a href="#inicio">
                        <div class="con_imagen" id="icono"> <img src="imagenes/casa.png" alt=""></div>
                    </a>
                    <a href="#inicio" class="inicio">
                        <div class="con_opcion">
                            <h4>Inicio</h4>
                        </div>
                    </a>

                </div>


                
                <div class="secion1">
                    <div class="seci_notificaiones">
                        <h2>Gestionar medicos</h2>
                    </div>
                    <div class="linecita">
                        <hr>
                    </div>
                </div>
                <div class="inicio">
                    <a href="#reg_med">
                        <div class="con_imagen" id="icono"> <img src="imagenes/alarma.png" alt=""></div>
                    </a>
                    <a href="#reg_med" class="inicio">
                        <div class="con_opcion">
                            <h4>Registrar medico</h4>
                        </div>
                    </a>
                </div>

                <div class="inicio">
                    <a href="#panel_med">
                        <div class="con_imagen" id="icono"> <img src="imagenes/alarma.png" alt=""></div>
                    </a>
                    <a href="#panel_med" class="inicio">
                        <div class="con_opcion">
                            <h4>Panel medicos</h4>
                        </div>
                    </a>
                </div>

                
                <div class="secion1">
                    <div class="seci_notificaiones">
                        <h2>Gestionar pacientes</h2>
                    </div>
                    <div class="linecita">
                        <hr>
                    </div>
                </div>
                <div class="inicio">
                    <a href="#reg_pac">
                        <div class="con_imagen" id="icono"> <img src="imagenes/historiaclinica.png" alt=""></div>
                    </a>
                    <a href="#reg_pac" class="inicio">
                        <div class="con_opcion">
                            <h4>Registrar paciente</h4>
                        </div>
                    </a>
                </div>

                <div class="inicio">
                    <a href="#panel_pac">
                        <div class="con_imagen" id="icono"> <img src="imagenes/historiaclinica.png" alt=""></div>
                    </a>
                    <a href="#panel_pac" class="inicio">
                        <div class="con_opcion">
                            <h4>Panel pacientes</h4>
                        </div>
                    </a>
                </div>

                </div>
            </div> 


            <!--   contenedor main donde se recargaran los contenedores  -->
            <main>

                    <div id="inicio" class="contain_main">
                        <div class="cont_titulo">Home</div>
                        
                        <div class="cont_general_all">
                            since youve been like this.
                            <BR>
                            baby i dont wanna really be in like this.
                        </div>
                    </div>

                    <!-- ---------------REGISTRO MEDICOS---------------- -->
                    <div id="reg_med" class="contain_main">
                        <div class="cont_titulo">
                            <p>Registrar medico</p>
                        </div>
                        
                            <div class="cont_general_all">

                                <div class="survey-container">
                                    <div class="question">
                                        <label for="id-number">No. Identificación</label>
                                        <input type="text" name="doc_id-number" required>
                                    </div>
                                    <div class="question">
                                        <label for="name">Nombre</label>
                                        <input type="text" name="doc_name" required>
                                    </div>
                                    <div class="question">
                                        <label for="age">Edad</label>
                                        <input type="text" name="doc_age" required>
                                    </div>
                                    <div class="question">
                                        <label for="phone-number">Teléfono</label>
                                        <input type="text" name="doc_phone-number" required>
                                    </div>
                                    <div class="question">
                                        <label for="email">Correo Electronico</label>
                                        <input type="text" name="doc_email" required>
                                    </div>
                                    <div class="question">
                                        <label for="sex">Sexo</label>
                                        <input type="text" name="doc_sex" required>
                                    </div>
                                    <div class="save">
                                        <div class="save-button">
                                        <a href="#" id="guardar-button">Guardar</a>
                                        </div>
                                    </div>
                                </div>

                            </div>
                    </div>

                    <!-- --------------PANEL MEDICOS----------------- -->
                    <div id="panel_med" class="contain_main">
                        <div class="cont_titulo">
                            <p>Panel medicos</p>
                        </div>
                        <div class="cont_general_all">

                            <div class="panel-main" id="contain_tablas">
                                <table>
                                    <thead>
                                    <tr>
                                        <th>Identificación</th>
                                        <th>Nombres</th>
                                        <th>Edad</th>
                                        <th>Teléfono</th>
                                        <th style="width: 15%;"></th>
                                        <th style="width: 15%;"></th>
                                    </tr>
                                    </thead>

                                    <tbody>
                                        <?php 
                                        
                                        require_once 'php/connection.php';

                                        $sql = "SELECT * FROM usuario WHERE id_rol='3'";    //medico
                                        $consulta = mysqli_query($mysqli, $sql);
                                        if(mysqli_num_rows($consulta)>0){
                                            while($fila =mysqli_fetch_assoc($consulta)){
                                        ?>
                                        <tr id=table_row_<?php echo $fila['id_usuario']?>>
                                            <td> <?php echo $fila['id_usuario'];?></td>
                                            <td> <?php echo $fila['nombre'];?></td>
                                            <td> <?php echo $fila['edad'];?></td>
                                            <td> <?php echo $fila['telefono'];?></td>
                                            <td><button data-modal-target="#modal_<?php echo $fila['id_usuario'];?>">Detalles</button></td>
                                            <td><button id="delete" data-user-id="<?php echo $fila['id_usuario'];?>">Eliminar</button></td>
                                        </tr>

                                        <?php
                                            }
                                        }
                                        ?>
                                    </tbody>

                                </table>
                            </div>
                        </div>
                    </div>

                    <!-- --------------REGISTRO PACIENTES-------------- -->
                    <div id="reg_pac" class="contain_main">
                        <div class="cont_titulo">Registrar paciente</div>
                            <div class="cont_general_all">

                                    <div class="pat-survey-container">
                                        <div class="pat-question">
                                            <label for="pat-id-type">Tipo de Documento</label>
                                            <select name="pat-id-type" id="pat-id-type">
                                                <option value="null"></option>
                                                <option value="Cedula de Ciudadania">Cédula de Ciudadanía</option>
                                                <option value="Tarjeta de Identidad">Tarjeta de Identidad</option>
                                                <option value="Registro Civil">Registro Civil</option>
                                                <option value="Pasaporte">Pasaporte</option>
                                            </select>
                                        </div>
                                        <div class="pat-question">
                                            <label for="pat-id-number">No. Documento</label>
                                            <input type="text" name="pat_id-number" required>
                                        </div>
                                        <div class="pat-question">
                                            <label for="pat-name">Nombres</label>
                                            <input type="text" name="pat_name" required>
                                        </div>
                                        <div class="pat-question">
                                            <label for="pat-email">Correo Electronico</label>
                                            <input type="text" name="pat_email" required>
                                        </div>
                                        <div class="pat-question">
                                            <label for="pat-age">Edad</label>
                                            <input type="text" name="pat_age" required>
                                        </div>
                                        <div class="pat-question">
                                            <label for="pat-phone-number">Teléfono</label>
                                            <input type="text" name="pat_phone-number" required>
                                        </div>
                                        <div class="pat-question">
                                            <label for="pat-sex">Genero</label>
                                            <input type="text" name="pat_sex" required>
                                        </div>
                                        <div class="pat-question">
                                            <label for="pat-residence-area">Tipo de Afiliacion</label>
                                            <select name="pat-afi" id="pat-afi">
                                                <option value="null"></option>
                                                <option value="Contributivo">Contributivo</option>
                                                <option value="Subsidiado">Subsidiado</option>
                                            </select>
                                        </div>
                                        <div class="save-patient">
                                            <div class="save-pat-button">
                                                <a href="#" id="paciente-nuevo">Guardar</a>
                                            </div>
                                        </div>
                                    </div>
                            </div>
                    </div>

                    <!-- ------------PANEL PACIENTES--------------- -->
                    <div id="panel_pac" class="contain_main">
                        <div class="cont_titulo">Panel pacientes</div>                      
                            <div class="cont_general_all">
                            <div class="patient-main">
                        <table>
                            <thead>
                            <tr>
                                <th>Identificación</th>
                                <th>Nombres</th>
                                <th>Edad</th>
                                <th>Género</th>
                                <th style="width: 15%;"></th>
                                <th style="width: 15%;"></th>
                            </tr>
                            </thead>
                            
                            <tbody>

                            <?php

                            require_once  'php/connection.php';
 
                            $sql2 = "SELECT * FROM usuario WHERE id_rol='2'";   //paciente
                            $query = mysqli_query($mysqli, $sql2 );
                            if(mysqli_num_rows($query)>0){
                                while($row = mysqli_fetch_assoc($query)){

                            ?>
                                <tr id=table_row_<?php echo $row['id_usuario']?>>
                                    <td><?php echo $row['id_usuario'];?></td>
                                    <td><?php echo $row['nombre'];?></td>
                                    <td><?php echo $row['edad'];?></td>
                                    <td><?php echo $row['genero'];?></td>
                                    <td><button data-modal-target="#modal_<?php echo $row['id_usuario'];?>">Detalles</button></td>
                                    <td><button id="delete" data-user-id="<?php echo $row['id_usuario'];?>">Eliminar</button></td>
                                </tr>
                                    
                                <?php
                                        }
                                    }
                                ?>
                            </tbody>
                        </table>
                    </div>
                            </div>

                    </div>

            </main>
        </div>
    </section>

</body>
<script src="Js/script13.js"></script>
<script src="Js/sqli.js"></script>
</html>