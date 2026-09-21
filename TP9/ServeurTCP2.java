// ServeurTCP1.java
import java.io.*;
import java.net.*;

public class ServeurTCP1
	{
	public static void main ( String [ ] args )
	{
		try 
		{

			ServerSocket socketserver = new ServerSocket (2016);
			while (true)
			{
				System.out.println ("serveur en attente");
				Socket socket = socketserver.accept ();
				System.out.println ("Connection d'un client");
				DataInputStream dln = new DataInputStream (socket.getInputStream());
				System.out.println ("Message: "+ dln.readUTF());
			}

			socket.close();
			socketserver.close ();
		}
		catch (Exception e){
			System.out.println ("Errezur");
			e.printStackTrace ();
		}
	}
}
