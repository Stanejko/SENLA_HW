public class NumberUtility {
    
    public List<Integer> simpleNumber(Integer N){
        List<Integer> numberSimple = new List<Integer>();
        Boolean flag = true;
        
        for(Integer i = 2; i <= N; i++)
        {
            for(Integer j = 2; j <= Math.sqrt(i)+1; j++)
            {
                if (Math.mod(i, j) == 0)
                {
                    
                    flag = false;
                    break;
                }
            }
            
            if (flag == true)
            {
                numberSimple.add(i);
            }
            else if(flag == false)
            {flag = true;}
        }
        
        return numberSimple;
    }
    
    public List<Integer> fiboNumber(Integer N){ 
        List<Integer> numberFibbo = new List<Integer>();
        
        numberFibbo.add(1);
        numberFibbo.add(1);
        
        for (Integer i = 2; i <= N; i++)
        {
            numberFibbo.add(numberFibbo.get(i-1)+numberFibbo.get(i-2));
        }
        
        return numberFibbo;
    }
    
    public Boolean palindromeNumber(Integer N){
        String str = String.valueOf(N);
        String str1 = str.reverse();
        
        if (str != str1){ return false;}
        
        return true;
    }
}