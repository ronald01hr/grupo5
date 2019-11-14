<%@page import="modelo.ArticuloDAO"%>
<%@page import="modelo.Articulo"%>
<%
    int id = Integer.parseInt(request.getParameter("id"));
    Articulo art = new ArticuloDAO().Detalle(id);
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link href="recursos/estilos.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <a class="navbar-brand" href="Controlador?accion=home">REBELION DIGITAL</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>  
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item active">
                        <a class="nav-link" href="Controlador?accion=home">Home<span class="sr-only">(current)</span></a>
                    </li>
                    
                    <li class="nav-item" >
                        <a class="nav-link"  href="#" tabindex="-1" aria-disabled="true">
                            <i class="fa fa-shopping-cart">(<label style="color: darkorange">${contador}</label>) </i>Carrito</a>
                    </li>
                </ul>
                <form class="form-inline my-2 my-lg-0">
                    <input class="form-control mr-sm-2" type="search" placeholder="Buscar" aria-label="Search">
                    <button class="btn btn-outline-success my-2 my-sm-0" type="submit">BUSCAR</button>
                </form>
                <ul class="navbar-nav">
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            INICIAR SESION ${usuario[0].NOM_CLI}
                        </a>
                        <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdown" >
                            <a class="dropdown-item" href="login.htm">INGRESAR</a>
                            <a class="dropdown-item" href="#">REGISTRARSE</a>
                        </div>
                    </li>
                </ul>

            </div>
        </nav>
        <div class="contenedor">
            <div class="caja">
                <h1 class="mod text-center"><%=art.getMODELO_ART()%></h1><br>
                <div class="row">
                    <div class="izquierda ">
                        <img src="<%=art.getIMAGEN_ART()%>" width="350" height="300"/>
                    </div>
                    <div class="derecha ">
                        <h2 class="desc"><%=art.getDESC_ART()%></h2>
                        <label class="txt">Disponibles (<%=art.getSTOCK_ART()%>)</label>

                        <h2 class="precio">S/. <%=art.getPRECIO_ART()%> </h2>
                        <p><b>Disponibilidad:</b> En Stock</p>
                        <p><b>Condición:</b> Nuevo</p>
                        <p><b>Marca:</b> ...</p>
                        <div class="btns">
                            <a class="btn btn-outline-success" href="Controlador?accion=AgregarCarrito&id=<%=art.getID_ART()%>"><i class="fa fa-shopping-cart"> AGREGAR AL CARRITO</i></a>&nbsp;
                            <a class="btn btn-outline-danger" href="Controlador?accion=Comprar&id=<%=art.getID_ART()%>">COMPRAR</a><br>
                            <div class="text-center">
                                <a class="regresar" href="Controlador?accion=home">Regresar </a>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>

    </div>
</div>
</div>
</div>
</div>
</body>
</html>
