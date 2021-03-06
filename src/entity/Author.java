package entity;
// Generated May 22, 2017 7:24:23 PM by Hibernate Tools 5.2.3.Final

/**
 * Author generated by hbm2java
 */
public class Author implements java.io.Serializable {

	private static final long serialVersionUID = 842591771495708183L;
	private int accountId;
	private Accounts accounts;
	private String authorName;
	private String biography;

	public Author() {
	}

	public Author(Accounts accounts) {
		this.accounts = accounts;
	}

	public Author(Accounts accounts, String authorName, String biography) {
		this.accounts = accounts;
		this.authorName = authorName;
		this.biography = biography;
	}

	public int getAccountId() {
		return accountId;
	}

	public void setAccountId(int accountId) {
		this.accountId = accountId;
	}

	public Accounts getAccounts() {
		return accounts;
	}

	public void setAccounts(Accounts accounts) {
		this.accounts = accounts;
	}

	public String getAuthorName() {
		return authorName;
	}

	public void setAuthorName(String authorName) {
		this.authorName = authorName;
	}

	public String getBiography() {
		return biography;
	}

	public void setBiography(String biography) {
		this.biography = biography;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Author [Id=");
		builder.append(accountId);
		builder.append(", accounts=");
		builder.append(accounts);
		builder.append(", authorName=");
		builder.append(authorName);
		builder.append(", biography=");
		builder.append(biography);
		builder.append("]");
		return builder.toString();
	}

}
