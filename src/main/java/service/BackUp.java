/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package service;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.sql.Connection;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;
import util.Conexao;
import util.UserSession;

/**
 *
 * @author juanb
 */
public class BackUp {
    
    
    public void executarBackUp(){
        Connection conn = Conexao.getConn(); 
        
        new Thread(() -> {
            
            try{
            
            //pega a data que foi feito o backup
            LocalDateTime now = LocalDateTime.now();
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd_HH-mm-ss");
            String timestamp = now.format(formatter);
            
            String path = "C:\\Users\\juanb\\OneDrive\\Área de Trabalho\\JavaCrudProject-main\\JavaCrudProject-main\\BackUp\\backup.sql -" +timestamp;
            Runtime r = Runtime.getRuntime();
            
            //PostgreSQL variables    
            String host = "localhost";
            String user = UserSession.getUserLogged().getName();
            String dbase = "trabalhoFinal";
            String password =  UserSession.getUserLogged().getPassword();
            String pgdumpPath = "C:\\Program Files\\PostgreSQL\\17\\bin\\pg_dump.exe";
            Process p;
            ProcessBuilder pb;


            r = Runtime.getRuntime();        
            pb = new ProcessBuilder(pgdumpPath, "-v", "-h", host, "-f", path, "-U", user, dbase);
            pb.environment().put("PGPASSWORD", password);
            pb.redirectErrorStream(true);
            p = pb.start();    
            
//            int exitCode = p.waitFor(); 
//           
//            if(exitCode == 0 ){
//            System.out.println("Backup realizado com sucesso em: " + path);
//
//            }else{
//                 System.out.println("Erro ao realizar o backup.");
//            }
//            
//            InputStream is = p.getInputStream();
//            BufferedReader reader = new BufferedReader(new InputStreamReader(is));
//            String line;
//            while ((line = reader.readLine()) != null) {
//                System.out.println(line);
//            }
     
        
            System.out.println("user: " + user + " Senha: " + password ); 

        
        }catch(IOException ex){
                ex.printStackTrace();

        }
        
        }).start();  
        

    } 
    
    public void backupAgendado(String periodo){
        ScheduledExecutorService scheduler = Executors.newScheduledThreadPool(1);

        Runnable tarefaBackup = () -> {
            System.out.println("Iniciando backup automático...");
            executarBackUp();
        };

        if(periodo.equals("Diario")){
            // Agenda a execução da tarefa a cada 30 dias
            scheduler.scheduleAtFixedRate(tarefaBackup, 0, 1, TimeUnit.DAYS);
        }
        
        if(periodo.equals("Semanal")){
            // Agenda a execução da tarefa a cada 30 dias
            scheduler.scheduleAtFixedRate(tarefaBackup, 0, 7, TimeUnit.DAYS);
        }
        
        if(periodo.equals("Mensal")){
            // Agenda a execução da tarefa a cada 30 dias
            scheduler.scheduleAtFixedRate(tarefaBackup, 0, 30, TimeUnit.DAYS);
        }

    }

}



