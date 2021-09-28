import java.sql.Connection;
import java.sql.DriverManager;
import javax.swing.JOptionPane;

public class koneksi {
    Connection koneksi;
    Connection conn;
    public Connection getConnection(){
        try {
            koneksi = DriverManager.getConnection("jdbc:mysql://localhost/dbgudang","root","");            
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, "koneksi ke database Gagal", "informasi", JOptionPane.INFORMATION_MESSAGE);           
        }
        return koneksi;
    }
}