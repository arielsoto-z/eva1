<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <div class="head">
        <div class="container">
            <div class="row">
                <div class="row justify-content-md-center">
                    logo.png
                </div>
                <div class="col-8">
                    <h1>BCIISA</h1>
                </div>
            </div>
            
        </div>    
    </div>
    <br>
    <br>
    <div class="center">
        <form action="NewServlet" method="post" onsubmit="return valida()">
            <div class="form-group">
                <label for="name">Nombre</label>
                <input type="text" class="form-control" id="name" name="name">
            </div>
            <div class="form-group">
                <label for="exampleInputPassword1">Password</label>
                <input type="password" class="form-control" id="password" name="password">
            </div>
            <br>
            <select class="form-control" id="admin">
                <option value="0">Administrativo</option>
                <option value="1">Administrador</option>
            </select>                        
            <br>
            <button type="submit" class="btn btn-primary">Submit</button>
        </form>
    </div>
    
</body>

<script>
    function valida(){
        mensaje = "";
        
        nombre = document.getElementById("name").value;
        if(nombre==""){
            mensaje += "El nombre esta en blanco \n";
        }
        
        pass = document.getElementById("password").value;
        if(pass==""){
            mensaje += "El nombre esta en blanco \n";
        }
        
        if (mensaje !=""){
            mensaje = "Datos faltantes en el formulario \n\n" + mensaje;
            alert (mensaje);
            return false;   
        }
    }
</script>
</html>
