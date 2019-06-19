/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package proyek2;


import java.util.Scanner;
import java.sql.*;
import java.io.*;

public class Proyek2 {
    public static Connection conn;
    public static Statement st;
    public static ResultSet rs;
    public static int nim,gel,angsuran;
    public static boolean statusKetemu=false;
    public static void koneksi(){
       try{
            conn=DriverManager.getConnection("jdbc:mysql://localhost/dbakademik","root","");
            //System.out.println("Koneksi kedatabase berhasil");
        }catch (Exception e){
            System.out.println("Koneksi kedatabase gagal");
        }
    }
    
    public static void menu(){
		Scanner scan = new Scanner(System.in);
		System.out.println("Pembayaran SPP");
		System.out.print("Nim : ");
		nim = scan.nextInt();
                System.out.print("Gelombang(1,2,3) : ");
		gel = scan.nextInt();
		System.out.print("Angsuran(1,2,3,4,5,6,7,8,9,10,11,12,13,14) : ");
		angsuran = scan.nextInt();
		
    }
    
    
    public static void main (String[]args) {
        koneksi();
        rs=null;
        try{
            st=conn.createStatement();
            rs=st.executeQuery("select * from mahasiswa , angsuran , pembayaran,spa" );
        }
        catch (Exception ex){
            System.err.println("Error(3):"+ex);
            System.exit(1);
        }
        
        try {
        do{
            menu();
            while(rs.next()){
                if((nim==rs.getInt("NIM")) && (gel==rs.getInt("Gelombang")) && (angsuran==rs.getInt("Angsuran"))){
                    System.out.println("======= DATA DITEMUKAN ======");
                    System.out.println("NIM : "+nim);
                    System.out.println("Nama : "+rs.getString("Nama"));
                    System.out.println("Jurusan : "+rs.getString("Jurusan"));
                    int a =rs.getInt("nilai");
                    int totspa = 0;
                    if(gel == 1){
                       totspa = (a* 20 ) /100;
                       System.out.println("Pembayaran SPA : "+ totspa);
                    }
                    else if(gel == 2){
                       totspa = (a* 15 ) /100;
                       System.out.println("Pembayaran SPA : "+ totspa);
                    }else{
                       totspa = (a ) /100;
                       System.out.println("Pembayaran SPA : "+ totspa);
                    }
                    System.out.println("SPP Tetap : "+rs.getInt("SPP_Tetap"));
                    System.out.println("NIIT : "+rs.getInt("NIIT"));
                    int total=rs.getInt("Spp_Tetap")+rs.getInt("NIIT") + totspa ;
                    System.out.println("Total Biaya : " + total);
                    statusKetemu=true;
                    break;
                }
                
            }
        }while(statusKetemu==false);
        
        }catch (Exception ex){
            System.err.println("Error (4):"+ex);
            System.exit(1);
        }
  }
} 

