/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package service;

import java.io.IOException;
import java.sql.Connection;
import util.Conexao;
import util.UserSession;

/**
 *
 * @author juanb
 */
public class BackUp {
    
    private String user; 
    private String password; 
    private String path = "C:\\Users\\juanb\\OneDrive\\Área de Trabalho\\JavaCrudProject-main\\JavaCrudProject-main\\BackUp\\backup.sql";
    private String host = "localhost"; 
    private String port ="5432";
    private String database = "trabalhoFinal"; 

    public String getUser() {
        return user;
    }

    public void setUser(String user) {
        this.user = user;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
    
    
    
    public void executarBackUp(){
        Connection conn = null; 
        String User = UserSession.getUserLogged().getName();
        String userSenha = UserSession.getUserLogged().getPassword();
        setUser(User); 
        setPassword(userSenha);
        
        System.out.println("user: " + User + " Senha: " + userSenha ); 

        try{
            conn = Conexao.getConn(); 
            
            ProcessBuilder pb = new ProcessBuilder(
            "pg_dump",           // Comando para fazer o dump do banco
            "-h", host,         // Define o host do banco de dados
            "-p", port,         // Define a porta do banco de dados
            "-U", user,         // Define o usuário do banco de dados
            "-F", "plain",        // Define o formato do backup (customizado, pode ser "plain" para SQL puro)
            "-f", path,  // Define o arquivo de saída onde o backup será salvo
            database           // Nome do banco de dados a ser exportado
            );
            
            // Definir a senha no ambiente para evitar prompt
            pb.environment().put("PGPASSWORD",password); 
            pb.redirectErrorStream(true); // Redireciona erro para a saída padrão
            
            Process process = pb.start(); 
            int exitCode = process.waitFor(); 
            
            if(exitCode == 0 ){
                System.out.println("Backup realizado com sucesso em: " + path);

            }else{
                System.out.println("Erro ao realizar o backup.");

            }
 
        
        }catch(IOException | InterruptedException ex){
                ex.printStackTrace();

        }
    
    
    } 
    
        

}

