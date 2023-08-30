package membership;
// 내장객체 영역112p 참조
public class MemberDTO
{	// 멤버 변수 : member 테이블의 컬럼과 동일하게 설정한다
	// 멤버 변수 선언 
	private String id;
	private String pass;
	private String name;
	private String Regidate;
	//변수선언은 대체적으로 private로 선언함(보안)
	/*
	 	생성자의 경우 꼭 필요한 경우가 아니라면 생성하지 않아도 된다(생략)
	 	생성자를 생성하지 않는 경우 컴파일러에 의해 디폴트생성자(기본생성자)가
	 	자동으로 추가되기 때문이다.
	 */
	
	// 정보은닉된 멤버변수에 접근을 위해 public으로 정의된 getter, setter를 정의한다.
	//public으로 해야함 private로 하면 불러 올 수가 없기 때문임
	//백엔드만 보는 부분은 다 정보보호를 위한 private라고 생각하면 될 듯?
	
	//정보 보안을 위해서 private을 사용 / private와 source를 만든 상태 생성자를 아직 만들지 않은 상태
	//DAO는 정보를 받고 주는 데이터만 있는 상태를 말한다. 변수를 다 받아서 처리를 해야 프로그램이 돌아감
	//데이터 처리를 위해 DAO에서 정보를 빼는것 
	public String getId()
	{
		return id;
	}
	public void setId(String id)
	{
		this.id = id;
	}
	public String getPass()
	{
		return pass;
	}
	public void setPass(String pass)
	{
		this.pass = pass;
	}
	public String getName()
	{
		return name;
	}
	public void setName(String name)
	{
		this.name = name;
	}
	public String getRegidate()
	{
		return Regidate;
	}
	public void setRegidate(String regidate)
	{
		this.Regidate = regidate;
	}
	
	
}
