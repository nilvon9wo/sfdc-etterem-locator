public class ClassHelper {
    public String getNameFor (Object obj){
    	return String.valueOf(obj)
    			.substring(0, String.valueOf(obj).indexOf(':'));
    }
}