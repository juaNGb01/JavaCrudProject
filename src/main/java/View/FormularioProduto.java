
//package View;
//import javax.swing.*;
//import java.awt.*;
//import java.math.BigDecimal;
//import model.Produto;
//
///**
// *
// * @author tais8
// */
//public class FormularioProduto extends JDialog {
//        private boolean submitted = false;
//        private Produto produto;
//        
//        private JTextField codeField = new JTextField(10);
//        private JTextField descField = new JTextField(20);
//        private JTextField priceField = new JTextField(10);
//        private JTextField quantityField = new JTextField(5);
//        private JTextField supplierField = new JTextField(10);
//
//        public FormularioProduto(JFrame parent, Produto produto) {
//            super(parent, "Product Form", true);
//            this.produto = produto;
//            initializeUI();
//        }
//
//        private void initializeUI() { 
//            setSize(300, 250);
//            JPanel panel = new JPanel(new GridLayout(5, 2));
//
//            panel.add(new JLabel("Code:"));
//            panel.add(codeField);
//            panel.add(new JLabel("Description:"));
//            panel.add(descField);
//            panel.add(new JLabel("Price:"));
//            panel.add(priceField);
//            panel.add(new JLabel("Quantity:"));
//            panel.add(quantityField);
//            panel.add(new JLabel("Supplier Code:"));
//            panel.add(supplierField);
//
//            if (produto != null) {
//                codeField.setText(String.valueOf(produto.getCodigo()));
//                descField.setText(produto.getDescricao());
//                priceField.setText(produto.getValor().toString());
//                quantityField.setText(String.valueOf(produto.getQuantidade()));
//                supplierField.setText(String.valueOf(produto.getFornecedorCodigo()));
//            }
//
//            JButton submitButton = new JButton("Submit");
//            submitButton.addActionListener(e -> {
//                submitted = true;
//                createProduto();
//                dispose();
//            });
//
//            JButton cancelButton = new JButton("Cancel");
//            cancelButton.addActionListener(e -> dispose());
//
//            JPanel buttonPanel = new JPanel();
//            buttonPanel.add(submitButton);
//            buttonPanel.add(cancelButton);
//
//            add(panel, BorderLayout.CENTER);
//            add(buttonPanel, BorderLayout.SOUTH);
//        }
//
//        private void createProduto() {
//            produto = new Produto(
//                Long.parseLong(codeField.getText()),
//                descField.getText(),
//                new BigDecimal(priceField.getText()),
//                Integer.parseInt(quantityField.getText()),
//                Long.parseLong(supplierField.getText())
//            );
//        }
//
//        public boolean isSubmitted() { return submitted; }
//        public Produto getProduto() { return produto; }
//    }
