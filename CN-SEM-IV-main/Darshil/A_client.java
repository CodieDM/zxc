import java.net.*; //socket
import java.io.*;

public class A_client{
    public static void main(String args[]){
        int serverport = 8080;
        String serveraddress="localhost";
        try{ //socket - portnumber and ip address
            Socket socket = new Socket(serveraddress, serverport);
            System.out.println("Connected to Server");

            BufferedReader in = new BufferedReader(new InputStreamReader(socket.getInputStream()));
            PrintWriter out = new PrintWriter(socket.getOutputStream(),true);

            BufferedReader  console = new BufferedReader(new InputStreamReader(System.in));
            String msg;
    
                System.out.print("Enter message");
                msg = console.readLine(); // rererer 
                out.println(msg);  //--> sends to server
                String zxc = in.readLine(); //reads from server
                System.out.println(zxc); 
 
            in.close(); 
            out.close();
            socket.close();
        }
        catch(IOException e){
            e.printStackTrace();
        }
        finally{
            // Reshma 
        }
    }
}