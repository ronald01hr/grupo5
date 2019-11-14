package controlador;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.*;

public class Controlador extends HttpServlet {

    ArticuloDAO adao = new ArticuloDAO();
    Articulo a = new Articulo();
    List<Articulo> articulos = new ArrayList<>();

    List<carrito> listaCarrito = new ArrayList<>();
    int item;
    double totalPagar = 0.0;
    int cantidad = 1;

    int idp;
    carrito car;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String accion = request.getParameter("accion");
        articulos = adao.listar();
        int pos = 0;

        switch (accion) {
            case "Comprar":
                totalPagar = 0.0;
                idp = Integer.parseInt(request.getParameter("id"));
                a = adao.Detalle(idp);

                if (listaCarrito.size() > 0) {
                    for (int i = 0; i < listaCarrito.size(); i++) {
                        if (idp == listaCarrito.get(i).getIdproducto()) {
                            pos = i;
                        }
                    }
                    if (idp == listaCarrito.get(pos).getIdproducto()) {
                        cantidad = listaCarrito.get(pos).getCantidad() + cantidad;
                        double subtotal = listaCarrito.get(pos).getPreciocompra() * cantidad;
                        listaCarrito.get(pos).setCantidad(cantidad);
                        listaCarrito.get(pos).setSubtotal(subtotal);
                    } else {
                        item = item + 1;
                        car = new carrito();
                        car.setItem(item);
                        car.setIdproducto(a.getID_ART());
                        car.setNombre(a.getIMAGEN_ART());
                        car.setDescripcion(a.getDESC_ART());
                        car.setPreciocompra(a.getPRECIO_ART());
                        car.setCantidad(cantidad);
                        car.setSubtotal(cantidad * a.getPRECIO_ART());
                        listaCarrito.add(car);
                    }
                } else {
                    item = item + 1;
                    car = new carrito();
                    car.setItem(item);
                    car.setIdproducto(a.getID_ART());
                    car.setNombre(a.getIMAGEN_ART());
                    car.setDescripcion(a.getDESC_ART());
                    car.setPreciocompra(a.getPRECIO_ART());
                    car.setCantidad(cantidad);
                    car.setSubtotal(cantidad * a.getPRECIO_ART());
                    listaCarrito.add(car);
                    for (int i = 0; i < listaCarrito.size(); i++) {
                        totalPagar = totalPagar + listaCarrito.get(i).getSubtotal();
                    }
                }
                request.setAttribute("totalPagar", totalPagar);
                request.setAttribute("carrito", listaCarrito);
                request.setAttribute("contador", listaCarrito.size());
                request.getRequestDispatcher("carrito.jsp").forward(request, response);
                break;

            case "AgregarCarrito":
                cantidad = 1;
                idp = Integer.parseInt(request.getParameter("id"));
                a = adao.Detalle(idp);
                if (listaCarrito.size() > 0) {
                    for (int i = 0; i < listaCarrito.size(); i++) {
                        if (idp == listaCarrito.get(i).getIdproducto()) {
                            pos = i;
                        }
                    }
                    if (idp == listaCarrito.get(pos).getIdproducto()) {
                        cantidad = listaCarrito.get(pos).getCantidad() + cantidad;
                        double subtotal = listaCarrito.get(pos).getPreciocompra() * cantidad;
                        listaCarrito.get(pos).setCantidad(cantidad);
                        listaCarrito.get(pos).setSubtotal(subtotal);
                    } else {
                        item = item + 1;
                        car = new carrito();
                        car.setItem(item);
                        car.setIdproducto(a.getID_ART());
                        car.setNombre(a.getIMAGEN_ART());
                        car.setDescripcion(a.getDESC_ART());
                        car.setPreciocompra(a.getPRECIO_ART());
                        car.setCantidad(cantidad);
                        car.setSubtotal(cantidad * a.getPRECIO_ART());
                        listaCarrito.add(car);
                    }

                } else {
                    item = item + 1;
                    car = new carrito();
                    car.setItem(item);
                    car.setIdproducto(a.getID_ART());
                    car.setNombre(a.getIMAGEN_ART());
                    car.setDescripcion(a.getDESC_ART());
                    car.setPreciocompra(a.getPRECIO_ART());
                    car.setCantidad(cantidad);
                    car.setSubtotal(cantidad * a.getPRECIO_ART());
                    listaCarrito.add(car);
                }
                request.setAttribute("contador", listaCarrito.size());
                request.getRequestDispatcher("Controlador?accion=home").forward(request, response);
                break;

            case "Carrito":
                totalPagar = 0.0;
                request.setAttribute("carrito", listaCarrito);
                for (int i = 0; i < listaCarrito.size(); i++) {
                    totalPagar = totalPagar + listaCarrito.get(i).getSubtotal();
                }
                request.setAttribute("totalPagar", totalPagar);
                request.setAttribute("contador", listaCarrito.size());
                request.getRequestDispatcher("carrito.jsp").forward(request, response);
                break;

            case "Delete":
                int idproducto = Integer.parseInt(request.getParameter("idp"));
                for (int i = 0; i < listaCarrito.size(); i++) {
                    if (listaCarrito.get(i).getIdproducto() == idproducto) {
                        listaCarrito.remove(i);
                    }
                }
                break;

            case "ActualizarCantidad":
                int idpro = Integer.parseInt(request.getParameter("idp"));
                int cant = Integer.parseInt(request.getParameter("Cantidad"));
                for (int i = 0; i < listaCarrito.size(); i++) {
                    if (listaCarrito.get(i).getIdproducto() == idpro) {
                        listaCarrito.get(i).setCantidad(cant);
                        double st = listaCarrito.get(i).getPreciocompra() * cant;
                        listaCarrito.get(i).setSubtotal(st);
                    }
                }

                break;
            default:
                request.setAttribute("contador", listaCarrito.size());
                request.setAttribute("articulos", articulos);
                request.getRequestDispatcher("index.jsp").forward(request, response);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
