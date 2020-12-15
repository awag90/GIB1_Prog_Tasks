
public class Names {
	public char[][][] names;
	
	public Names() {
		prepare3DArray();
	}
	
	
	public char[][] cutNames(String firstName, String lastName){
		char[] name1 = new char[firstName.length()];
		char[] name2 = new char[lastName.length()];
		char[][] result = {name1, name2};
		
		for (int i = 0; i < result.length; i++ ) {
			for (int j = 0; j < result[i].length; j++){
				if (i==0) {
					result[i][j] = firstName.charAt(j);
				}else {
					result[i][j] = lastName.charAt(j);
				}
			}
		}
		return result;
	}
	
	
	public void prepare3DArray() {
		names = new char[5][][];
		names[0] = cutNames("FIONA","WUNDERLICH");
		names[1] = cutNames("SINA","WOELKI");
		names[2] = cutNames("STEFFEN", "MARZ");
		names[3] = cutNames("MARIUS", "ALBESER");
		names[4] = cutNames("ANDREAS", "WAGNER");
	}

}
