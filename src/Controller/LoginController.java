package Controller;

import Model.LoginModel;
import View.LoginView;
import View.ManagerView;
import View.CashierView;
import javax.swing.*;

public class LoginController {

    private final LoginView login;
    private final LoginModel model;

    public LoginController(LoginView login,LoginModel model) {
        this.login = login;
        this.model = model;
    }

    public void initializeController() {
        this.login.setController(this);
    }

    public void handleLogin() {
        String username = login.getUsername().trim();
        char[] password = login.getPassword();
//        String acctype = login.getAccType();

        if (username.isEmpty()) {
            JOptionPane.showMessageDialog(login, "Username Cannot Be Empty,\nPlease Enter Username!");
        } else if (password.length == 0) {
            JOptionPane.showMessageDialog(login, "Password Cannot Be Empty,\nPlease Enter Password!");
        } //        else if (acctype.equals("Select Account Type")) {
        //            JOptionPane.showMessageDialog(login, "Account Type Not Selected,\nPlease Select Account Type!");
        //        } 
        else {
            try {
                String userType = model.getUserType(username, new String(password));

                if (userType != null) {
                    JOptionPane.showMessageDialog(login, "Login Details Are Correct,\nLogin as a " + userType + " !");

                    switch (userType) {
                        case "Manager":
                            ManagerView manager = new ManagerView();
                            manager.setVisible(true);
                            login.dispose();
                            break;
                        case "Cashier":
                            CashierView cashier = new CashierView();
                            cashier.setVisible(true);
                            login.dispose();
                            break;
                    }

                } else {
                    JOptionPane.showMessageDialog(login, "Login Details Are Incorrect!");
                }
            } catch (RuntimeException ex) {
                JOptionPane.showMessageDialog(login, ex.getMessage(), "Error", JOptionPane.ERROR_MESSAGE);
            }
        }
    }
}
