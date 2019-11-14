package modelo;

import config.Conexion;
import interfaces.CRUD;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ArticuloDAO implements CRUD {

    Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    Articulo a = new Articulo();

    @Override
    public List listar() {
        ArrayList<Articulo> articulo = new ArrayList();
        String sql = "select * from articulo";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Articulo art = new Articulo();
                art.setID_ART(rs.getInt("ID_ART"));
                art.setMODELO_ART(rs.getString("MODELO_ART"));
                art.setPRECIO_ART(rs.getDouble("PRECIO_ART"));
                art.setSTOCK_ART(rs.getInt("STOCK_ART"));
                art.setDESC_ART(rs.getString("DESC_ART"));
                art.setESTADO_ART(rs.getString("ESTADO_ART"));
                art.setIMAGEN_ART(rs.getString("IMAGEN_ART"));
                art.setID_CAT(rs.getInt("ID_CAT"));
                art.setID_MARCA(rs.getInt("ID_MARCA"));
                articulo.add(art);
            }
        } catch (Exception e) {
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (ps != null) {
                    ps.close();
                }
            } catch (Exception e) {
            }
        }

        return articulo;
    }

    @Override
    public Articulo Detalle(int id) {
        String sql = "select * from articulo where ID_ART=" + id;
        Articulo a = new Articulo();
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                a.setID_ART(rs.getInt(1));
                a.setMODELO_ART(rs.getString(2));
                a.setPRECIO_ART(rs.getDouble(3));
                a.setSTOCK_ART(rs.getInt(4));
                a.setDESC_ART(rs.getString(5));
                a.setESTADO_ART(rs.getString(6));
                a.setIMAGEN_ART(rs.getString(7));
                a.setID_CAT(rs.getInt(8));
                a.setID_MARCA(rs.getInt(9));
            }
        } catch (Exception e) {
        }
        return a;
    }

    @Override
    public boolean agregar(Articulo art) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean Editar(Articulo art) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean Eliminar(int id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}
