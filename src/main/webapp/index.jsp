<!DOCTYPE html>
<html lang="es">
<head>
    <meta http-equiv=?Content-Type? content=?text/html; charset=UTF-8? />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <div class="container formaster">
        <form action="NewServlet" onsubmit="return valida()">
            <div class="row">
                <h1>Cabañas</h1>
            </div>
            <br><br>
            <div class="row">
                <input class="form-control col-md-3" type="text" name="nombre" id="nombre" placeholder="Nombre">
            </div>
            <div class="row">
                <input class="form-control col-md-3" type="text" name="apellidoP" id="apellidoP" placeholder="Apellido Paterno">
            </div>
            <div class="row">
                <input class="form-control col-md-3" type="text" name="apellidoM" id="apellidoM" placeholder="Apellido Materno">
            </div>
            <div class="row">
                <input class="form-control col-md-3" type="text" name="rut" id="rut" placeholder="RUT" onkeyup="validarut()"> - <input type="text" class="col-sm-1" name="dv" id="dv" disabled> 
            </div>
            <div class="row">
                <input class="form-control col-md-3" type="text" name="cantDias" id="cantDias" placeholder="Cantidad Dias">
            </div>
            <div class="row">
                <input class="form-control col-md-3" type="text" name="acom" id="acom" placeholder="Acompañantes">
            </div>
            <div class="row">
                <label for="menores">Tiene AcompaÃ±antes menores de edad?</label>
                <select class="form-control" name="menores" id="menores">
                    <option value="0">No</option>
                    <option value="1">Si</option>
                </select>
            </div>
            <div class="row">
                <input class="form-control col-md-3" type="text" name="cantMenores" id="cantMenores">
            </div>
            <div class="row">
                <button class="form-control col-md-3" type="submit" class="btn btn-primary">Enviar</button>
            </div>
        </form> 
    </div>
    
</body>

<script>
    function validarut(){
        var aRut = new Array(8);
        var i, j, dv;
        
        if((document.getElementById("rut").value.length) = 0){
            alert("debe ingresar un numero de rut");
        }
        else{
            for (i = 1; i < 9; i++){
                aRut[i] = 0;
            }
            
            i = 0;
            for (j = (9 - (document.getElementById("rut").value.length)); j < 9; j++) {
                if(( document.getElementById("rut").value.substr(i, 1) >= 0) & (document.getElementById("rut").value.substr(i, 1) <= 9)){
                    aRut[j] = document.getElementById("rut").value.substr(i, 1);
                    i++;
                }
                else{
                    alert("Debe ingresar solo numeros!!!");
                    i = 0;
                    break;
                }   
            }
            
            if(i > 0){
                dv = 11 - (( (aRut[1]*3) + (aRut[2]*2) + (aRut[3]*7) + (aRut[4]*6) + (aRut[5]*5) + (aRut[6]*4) + (aRut[7]*3) + (aRut[8]*2 ) )%11);
                if(dv === 10){
                    dv = "K";
                }
                else if (dv === 11){
                    dv = "0";
                }
                document.getElementById("dv").value = dv;
                return dv;
            }
        }
    }
    
    function valida(){
        mensaje = "";
        
        nombre = document.getElementById("nombre").value;
        if(nombre==""){
            mensaje += "El nombre esta en blanco \n";
        }

        apellidoP = document.getElementById("apellidoP").value;
        if(apellidoP==""){
            mensaje += "El Apellido paterno esta en blanco \n";
        }

        apellidoM = document.getElementById("apellidoM").value;
        if(apellidoM==""){
            mensaje += "El Apellido materno esta en blanco \n";
        }

        rut = document.getElementById("rut").value;
        if(rut==""){
            mensaje += "El rut esta en blanco \n";
        }

        cantDias = document.getElementById("cantDias").value;
        if(cantDias == ""){
            mensaje+= "La cantidad de dias esta en blanco \n"
        }
        else if( cantDias < 1){
            mensaje += "La cantidad de dias no puede ser menor a 1\n"
        }

        acom = document.getElementById("acom").value
        if(acom == ""){
            mensaje += "La cantidad de acompañantes esta en blanco\n"
        }
        else if (acom < 0){
            mensaje += "La cantidad de acompañantes no puede ser menor a 0\n"
        }

        menores = document.getElementById("menores").value
        if(menores > 0){
            cantMenores = document.getElementById("cantMenores").value
            acom = document.getElementById("acom").value
            if(cantMenores == ""){
                mensaje += "La cantidad de menores esta en blanco\n"
            }
            else if(cantMenores > (parseInt(acom) - parseInt(cantMenores))){
                mensaje += "La cantidad de menores sobrepasa los acompañantes\n"
            }
            else if(!isNaN(cantMenores)){
            mensaje += "La Cantidad de menores tiene que ser un numero\n"
        }
            else if(cantMenores <= 0){
                mensaje += "La cantidad de menores tiene que ser mayor a 0\n"
            }
        }

        if (mensaje !=""){
            mensaje = "Datos faltantes en el formulario \n\n" + mensaje;
            alert (mensaje);
            return false;   
        }
    }
</script>
</html>
