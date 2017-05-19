import com.sun.istack.internal.NotNull;
import org.hibernate.validator.constraints.NotEmpty;

import javax.validation.constraints.Size;

/**
 * Class description
 *
 * @author Sarah Guarino
 * @version 1.0
 */
public class User {
    @Size(min = 2,max = 25, message = "First name must be between 2 and 25 characters long.")
    @NotEmpty(message = "Please enter a first name.")
    // confirm that this has no numbers. Only letters, spacing, ' and -
    private String fname;

    @Size(min = 2,max = 25, message = "Last name must be between 2 and 25 characters long.")
    // confirm that this has no numbers. Only letters, spacing, ' and -
    private String lname;

    @NotEmpty(message = "Please enter an email.")
    // how to validate that this is an email?
    private String email;

    @NotEmpty(message = "Please enter a username.")
    private String username;

    // have to validate that this is the right format
    private long phonenumber;

    @NotEmpty(message = "Please enter a password.")
    @Size(min = 6,max = 30, message = "Please enter a password between 6 and 30 characters.")
    private String password1;

    @NotEmpty(message = "Please validate your password.")
    private String password2;

    public User() {
    }

    public String getFname() {
        return fname;
    }

    public void setFname(String fname) {
        this.fname = fname;
    }

    public String getLname() {
        return lname;
    }

    public void setLname(String lname) {
        this.lname = lname;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public long getPhonenumber() {
        return phonenumber;
    }

    public void setPhonenumber(long phonenumber) {
        this.phonenumber = phonenumber;
    }

    public String getPassword1() {
        return password1;
    }

    public void setPassword1(String password1) {
        this.password1 = password1;
    }

    public String getPassword2() {
        return password2;
    }

    public void setPassword2(String password2) {
        this.password2 = password2;
    }
}
