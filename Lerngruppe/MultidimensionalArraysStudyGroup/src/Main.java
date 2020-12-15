
public class Main {
	
	public static void main(String[] args) {
		Names n = new Names(); 
		
		char[][][] names = n.names;
		
		String myName = "";
		
		for (int i = 0; i < names.length; i++) {
			for (int j = 0; j < names[i].length; j++) {
				for (int h = 0; h < names[i][j].length; h++) {
					myName += names[i][j][h];
				}
				myName += " ";
			}
			System.out.println(myName);
			myName = "";
		}

	}
	
	

}
