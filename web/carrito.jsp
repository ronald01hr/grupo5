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
                        <a class="nav-link" href="Controlador?accion=home">Seguir Comprando</a></i>
                    </li>
                </ul>
                <form class="form-inline my-2 my-lg-0">
                    <input class="form-control mr-sm-2" type="search" placeholder="Buscar" aria-label="Search">
                    <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Buscar</button>
                </form>
                <ul class="navbar-nav">
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <a class="dropdown-item" href="#">Iniciar Sesión</a>
                            <a class="dropdown-item" href="#">Registrarse</a>
                        </div>
                    </li>
                </ul>
            </div>
        </nav>

        <div class="container">
            <h3> CARRITO </h3><br>
            <div class="row">
                <div class="col">
                    <table class="table table-hover">
                        <thead>
                            <tr class="text-center">
                                <th>ITEM</th>
                                <th>ARTICULO</th>
                                <th>DESCRIPCION</th>
                                <th>PRECIO</th>
                                <th>CANTIDAD</th>
                                <th>SUBTOTAL</th>
                                <th>ACCIONES</th>
                            </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="car" items="${carrito}">     
                            <tr>
                                <td>${car.getItem()}</td>
                                <td>
                                <img src="<c:url value="${car.getNombre()}" />" width="180" height="180"/>
                                </td>
                                <td>${car.getDescripcion()}</td>
                                <td>${car.getPreciocompra()}</td>
                                <td>
                                    <input type="hidden" id="idpro" value="${car.getIdproducto()}">
                                    <input type="number" id="Cantidad" value="${car.getCantidad()}" class="form-control text-center" min="1">                                
                                </td>                                
                                <td>${car.getSubtotal()}</td>
                                <td>
                                    <input type="hidden" id="idp" value="${car.getIdproducto()}">
                                    <a href="#" id="btnDelete"> Eliminar </a>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>

                </div>
                <div class="col">
                    <div class="card">
                        <div class="card-header">
                            <h3>Generar Compra</h3>
                        </div>
                        <div class="card-body">
                            <label>Subtotal: </label>
                            <input type="text" readonly="" class="form-control" value="S/. ${totalPagar}0">
                            <label>Descuento: </label>
                            <input type="text" readonly="" class="form-control" value="S/. 0.00">
                            <label>Total a Pagar: </label>
                            <input type="text" readonly="" class="form-control" value="S/. ${totalPagar}0">
                        </div>
                        <div class="card-footer">
                            <a href="#" class="btn btn-outline-info btn-block">Realizar Pago</a>
                            <a href="#" class="btn btn-outline-danger btn-block">Generar Compra</a>
                        </div>
                    </div>
                </div>                
            </div>
        </div>

        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
        <script src="js/funciones.js" type="text/javascript"></script>
    </body>
</html>