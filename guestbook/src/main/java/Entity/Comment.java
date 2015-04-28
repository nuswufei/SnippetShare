package Entity;

public class Comment {
	int id;
	String content;
	int snippetID;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getSnippetID() {
		return snippetID;
	}
	public void setSnippetID(int snippetID) {
		this.snippetID = snippetID;
	}
}
