package ptithcm.entity;

import java.util.Collection;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.validator.constraints.NotBlank;

@Entity
@Table(name="Users")
public class User {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer idUser;
	@NotBlank(message="Username cannot be left blank")
	private String username;
	@NotBlank(message="Password cannot be left blank")
	private String password;
	@NotBlank(message="Firstname cannot be left blank")
	private String firstName;
	@NotBlank(message="Lastname cannot be left blank")
	private String lastName;
	@NotBlank(message="Address cannot be left blank")
	private String address;
	@NotBlank(message="Phone number cannot be left blank")
	private String phone;
	@NotBlank(message="Email cannot be left blank")
	private String email;
	private Boolean admin;
	@OneToMany(mappedBy="user",fetch=FetchType.EAGER)
	private Collection<TheOrder> theOrders;
	public User() {
		super();
	}
	public User(String username, String password) {
		super();
		this.username = username;
		this.password = password;
	}
	public User(Integer idUser, String username, String password, String firstName, String lastName, String address, String phone,
			String email, Boolean admin) {
		super();
		this.idUser = idUser;
		this.username = username;
		this.password = password;
		this.firstName = firstName;
		this.lastName = lastName;
		this.address = address;
		this.phone = phone;
		this.email = email;
		this.admin = admin;
	}
	public Integer getIdUser() {
		return idUser;
	}
	public void setIdUser(Integer idUser) {
		this.idUser = idUser;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Collection<TheOrder> getTheOrders() {
		return theOrders;
	}
	public void setTheOrders(Collection<TheOrder> theOrders) {
		this.theOrders = theOrders;
	}
	public Boolean getAdmin() {
		return admin;
	}
	public void setAdmin(Boolean admin) {
		this.admin = admin;
	}
}
