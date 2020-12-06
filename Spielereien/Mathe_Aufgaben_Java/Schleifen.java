import java.lang.Math;

class Schleifen{
    public static void main(String[] args){
        System.out.println("_______________________________________________");
        System.out.println("6.5.1");
        System.out.println("_______________________________________________");

        System.out.println(a(0,4));
        System.out.println(b(1,4));
        System.out.println(c(0,4));
        System.out.println(d(0,2,0));
        System.out.println(e(0,2,0));
        System.out.println(f(0,5));
        System.out.println(g(5,9));
        System.out.println(h(1,5));

        System.out.println("_______________________________________________");
        System.out.println("6.5.2");
        System.out.println("_______________________________________________");

        for (int i = 1; i<=10;i++){
            if (i<10){
                System.out.print(factorial(i) + ", ");
            }else{
                System.out.print(factorial(i) + "\n");

            }
        }

        for (int i = 1; i<=10;i++){
            if (i<10){
                System.out.print(fibonacci(i) + ", ");
            }else{
                System.out.print(fibonacci(i) + "\n");
            }
        }

        for (int i = 1; i<=10;i++){
            if (i<10){
                System.out.print(ah(i) + ", ");
            }else{
                System.out.print(ah(i) + "\n");
            }
        }
        
        for (int i = 1; i<=10;i++){
            if (i<10){
                System.out.print(bg(i) + ", ");
            }else{
                System.out.print(bg(i) + "\n");
            }
        }
    }   

    public static float a(int start, int end){
        float y = 0;
        for (int n = start; n<= end;n++){
            y+= Math.pow(2,-1*n);
        }
        return y;
    }

    public static double b(int start, int end){
        double y = 0;
        for( int k = start; k <= end; k++ ){
            y += Math.pow(k, 1/(float)(k)) ;
        }
        return y;
    }

    public static float c(int start, int end){
        float y = 0;
        for( int n = start; n <= end; n++ ){
            y += Math.pow(-1, n-1) * Math.pow(n,2);
        }
        return y; 
    }

    public static float d(int outerStart, int outerEnd, int innerStart){
        float y = 0;
        for( int i = outerStart; i <= outerEnd; i++ ){
            for( int k = innerStart; k <= i ; k++){
                y += Math.pow((i+k), i);
            }
        }
        return y;
    }

    public static float e(int outerStart, int outerEnd, int innerStart){
        float y = 0;
        for( int k = outerStart; k <= outerEnd; k++ ){
            for( int i = innerStart; i <= k ; i++){
                y += Math.pow((i+k), i);
            }
        }
        return y;
    }

    public static float f(int start, int end){
        float y = 1;
        for (int i = start; i<= end; i++){
            y *= Math.pow(2,i);
        }
        return y;
    }

    public static float g(int start, int end){
        float y = 1;
        for (int j = start; j<= end; j++){
            y *= (j+1);
        }
        return y;
    }
    public static float h(int start, int end){
        float y = 1;
        for (int j = start; j<= end; j++){
            y *= Math.pow(j,Math.pow(-1,j));
        }
        return y;
    }

    public static int factorial(int n){
        int y;
        if(n > 0){
            y = n* factorial(n-1);
        }else{
            y = 1;
        }
        return y;
    }

    public static int fibonacci(int n){
        int y;
        if (n == 1 || n == 2){
            y = 1;
        }else{
            y = fibonacci(n-1)+fibonacci(n-2);
        }
        return y;
    }

    public static int ah(int n){
        int y;
        if (n > 0){
            y = 2* ah(n-1) +2;
        }else{
            y = 0;
        }
        return y;
    }

    public static int bg(int n){
        int y;
        if (n<=0){
            y = 1;
        }else if (n%2==0){
            y = bg(n-1)-bg(n-2);
        }else{
            y = bg(n-1)+bg(n-2);
        }
        return y;
    }
}