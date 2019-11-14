package interfaces;

import java.util.List;
import modelo.Articulo;

public interface CRUD {
    public List listar();
    public Articulo Detalle(int id);
    public boolean agregar(Articulo art);
    public boolean Editar(Articulo art);
    public boolean Eliminar(int id);
}
