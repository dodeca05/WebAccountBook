package SQL;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Calendar;
import java.util.Scanner;

public class SQLBaseInference {
	private final String workspace="C:/WebWorkSpace";
	private final String AnacondaPath="C:/users/56589/.conda/envs/tfstudy2/python.exe";
	
	private String ID;
	private int row;
	private int col;
	private String[][]product;
	public SQLBaseInference(String ID)
	{
	
		int i=0;
		this.ID=ID;
		
		SQLConnect sc=new SQLConnect();
		ResultSet wheather;
		ResultSet rs=sc.ExecuteQuery("select Name from product where ID='"+ID+"';");
		try {
			rs.last();
			this.row=rs.getRow();
			rs.beforeFirst();
			product=new String[this.row][2];
			for(int x=0;x<this.row;x++)
			{
				product[x][1]="";
			}
			while(rs.next()) {
				product[i++][0]=rs.getString("Name");
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			row=-1;
		}
		sc.ConnectionClose();
		if(row==-1) {
			System.out.println("SQL Fail");
			return;	
		}
		
		sc=new SQLConnect();
		rs=sc.ExecuteQuery("select * from salesrecord where ID='"+ID+"'");
		try {
			while(rs.next()) {
				String date=rs.getString("Date");
				String product=rs.getString("Product");
				int num=rs.getInt("Num");
				int day=DayCvtInt(date);
				sc=new SQLConnect();
				wheather=sc.ExecuteQuery("select * from Weather where Date='"+date+"';");
				System.out.println("select * from Weather where Date='"+date+"';");
				
				try {
				wheather.next();
				float temp=wheather.getFloat("Temperature");
				int wType=wheather.getInt("WeatherType");
				wheather.close();
				int cur=FindCur(product);
				String csv=day+","+temp+","+wType+","+num+"\n";
				this.product[cur][1]+=csv;
				}catch(SQLException e){
					System.out.println(date+"에 대한 날씨 정보 없음");
					e.printStackTrace();
				}catch(Exception e) {}
				
				
				
			}
			
		}catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			
		}
		
		
		
	}
	
	private int DayCvtInt(String date)
	{
		
		String[]op=date.split("-");
		Calendar cal=Calendar.getInstance();
		
		cal.set(Calendar.YEAR, Integer.parseInt(op[0]));
		cal.set(Calendar.MONTH, Integer.parseInt(op[1])-1);
		cal.set(Calendar.DATE, Integer.parseInt(op[2]));
		
		return cal.get(Calendar.DAY_OF_WEEK)-1;
		
		
		
	}
	private int FindCur(String name)
	{
		for(int i=0;i<this.product.length;i++)
		{
			if(this.product[i][0].equals(name))
				return i;
		}
		return -1;
	}
	
	public String Inference(String today){
		int testnum=0;
		String hys="";
		String testdata="";
		SQLConnect sc=new SQLConnect();
		ResultSet rs=sc.ExecuteQuery("select * from weather where date>'"+today+"';");
		
		
		try {
			while(rs.next()) {
			float temp=rs.getFloat("Temperature");
			int wType=rs.getInt("WeatherType");
			int day= DayCvtInt(today);
			testdata+=day+" "+temp+" "+wType+" ";
			testnum++;
			}
			}catch(SQLException e){
				
				e.printStackTrace();
			}
		
		
		
		for(int i=0;i<product.length;i++)
		{
			if(this.product[i][1].equals(""))continue;
			try {
				File file=new File(workspace+"/"+this.ID+"_train.csv");
				FileWriter fw=new FileWriter(file); 
				fw.write(this.product[i][1].substring(0,this.product[i][1].length()-1));
				fw.close();
				
				
				
				
				 try {
			    	  System.out.println(AnacondaPath+" \""+this.workspace+"/Th.py\" "+this.workspace+"/"+this.ID+"_train.csv "+testnum+" "+testdata);
			         Process process=Runtime.getRuntime().exec(
			        		 AnacondaPath+" \""+this.workspace+"/Th.py\" "+this.workspace+"/"+this.ID+"_train.csv "+testnum+" "+testdata);
			         BufferedReader stdError=new BufferedReader(new InputStreamReader(process.getInputStream()));
			         BufferedReader stdInput=new BufferedReader(new InputStreamReader(process.getInputStream()));
			         Scanner scanner=new Scanner(stdInput);
			         String result="";
			         String s;

			         scanner.useDelimiter(System.getProperty("line.separator")); 
			         while(scanner.hasNext()) {
			        	 String temp=scanner.next();
			        	 
			        	 result+=temp;
			         }
			      
			         
			         while((s= stdError.readLine())!=null)
			         {
			            System.out.println(s);
			            
			            
			         }
			         scanner.close(); 
			         stdInput.close();			   
			         hys+=result+"/";
			         
			      }catch(Exception ex) {
			         ex.printStackTrace();
			         
			      }
			}catch(IOException e)
			{
				e.printStackTrace();
			}
		
		}
		this.col=testnum;
		if(hys.length()>0)
		hys=hys.substring(0,hys.length()-1);
		return hys;
	}
	public int getRow() {return this.row;}
	
	public int getCol() {return this.col;}
	
	public String getProductName(int rowNum) {return this.product[rowNum][0];}

}
