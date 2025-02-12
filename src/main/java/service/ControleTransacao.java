/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import util.Conexao;

/**
 *
 * @author juanb
 */
public class ControleTransacao {
    
//    private static void iniciarTransacoes() {
//        //apenas 2T podem ser executadas ao mesmo tempo
//        ExecutorService executor = Executors.newFixedThreadPool(2);
//
//        executor.execute(() -> {
//            try {
//                //executarTransacao(1, 150.75);
//            } catch (SQLException e) {
//                System.err.println("Erro ao executar transacao 1: " + e.getMessage());
//            }
//        });
//
//        executor.execute(() -> {
//            try {
//                //executarTransacao(2, 200.50);
//            } catch (SQLException e) {
//                System.err.println("Erro ao executar transacao 2: " + e.getMessage());
//            }
//        });
//
//        executor.shutdown();
//    }
//    
//    
//    private static void executarTransacao(int usuarioId, double valor) throws SQLException {
//        try (Connection conn = Conexao.getConn()) {
//            conn.setAutoCommit(false);
//
//            LocalDateTime inicio = LocalDateTime.now();
//            System.out.println("[" + inicio + "] Transacao iniciada para usuario " + usuarioId);
//
//            try (PreparedStatement stmt = conn.prepareStatement(
//                    "INSERT INTO venda (data_venda, id_usuario, total) VALUES (?, ?, ?)"
//            )) {
//                stmt.setTimestamp(1, Timestamp.valueOf(LocalDateTime.now()));
//                stmt.setInt(2, usuarioId);
//                stmt.setDouble(3, valor);
//                stmt.executeUpdate();
//
//                conn.commit();
//                LocalDateTime fim = LocalDateTime.now();
//                System.out.println("[" + fim + "] Transacao concluida com sucesso para usuario " + usuarioId);
//            } catch (SQLException e) {
//                conn.rollback();
//                throw e;
//            }
//        }
//    }
//    
    
}
