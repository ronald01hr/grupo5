<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script src="https://kit.fontawesome.com/82cfc793a0.js" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
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
                        <a class="nav-link" href="Controlador?accion=home">Home <span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="Controlador?accion=Carrito"><i class="fas fa-cart-plus">(<label style="color: orange">${contador}</label>)</i>Carrito</a></i>
                    </li>
                </ul>
                <form class="form-inline my-2 my-lg-0">
                    <input class="form-control mr-sm-2" type="search" placeholder="Buscar" aria-label="Search">
                    <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Buscar</button>
                </form>
                <ul class="navbar-nav">
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            Iniciar Sesión
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <a class="dropdown-item" href="#">Iniciar Sesiòn</a>
                            <a class="dropdown-item" href="#">Ingresar</a>
                        </div>
                    </li>
                </ul>
            </div>
        </nav>
        <div class="container mt-4">
            <div class="row" >   
                <c:forEach var="a" items="${articulos}"> 
                    <div class="col-sm-4 form-group">
                        <div class="card text-center" >                    
                            <div class="card-header">
                                <h3>${a.MODELO_ART}</h3><br>
                                <label class="txt">Disponibles</label>
                                <i class="stock">(${a.STOCK_ART})</i>
                            </div>
                            <div class="card-body">                          
                                <img src="<c:url value="${a.IMAGEN_ART}" />" width="200" height="180"/>      
                            </div >
                            <div class="card-footer"> 
                                <i class="precio">S/.${a.PRECIO_ART}</i>
                                <div>
                                    <p><a href="Controlador?accion=AgregarCarrito&id=${a.ID_ART}" class="btn btn-outline-info"><i class="fa fa-shopping-cart"> AGREGAR AL CARRITO</i></a></p>
                                    <a href="detalle.jsp?id=${a.ID_ART}" class="btn btn-outline-info">VER DETALLES</a>
                                    <a href="Controlador?accion=Comprar&id=${a.ID_ART}" class="btn btn-outline-danger">Comprar</a>
                                </div>
                            </div>  
                        </div> 
                    </div>
                </c:forEach> 
            </div>
        </div>
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>    </body>
</html>
