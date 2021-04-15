public class ExceptionsPlayground {
    public class CustomException extends Exception {}
    
    public static void generateCustomException() {
        throw new CustomException('CustomException');
    }
    
    public static void generateRegularException() {
        try {
            	Integer i = 28 / 0;
        } catch(Exception e) {
            System.debug(e.getMessage() + e.getStackTraceString());
        }
    }
    
    public static void handleExceptions() {
        try {
            	generateCustomException();
            	generateRegularException();
        } catch(CustomException ce) {
            System.debug('Custom Exception!');
        }
        catch(Exception ex) {
            System.debug(ex.getMessage());
        } finally {
            System.debug('Method handleExceptions executed');
        }
    }
}
