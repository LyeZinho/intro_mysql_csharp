using System;
using System.Data;
using System.Collections;
using MySql.Data.MySqlClient;

public class Tutorial1
{
    static void Main(string[] args)
    {
        ArrayList data = Get_users();
        int count = data.Count;
        for (int i = 0; i <= count-1; i++)
        {
            Console.WriteLine(data[i]);
        }
    }
    public static ArrayList Get_users()
    {
        ArrayList data_arrayl = new ArrayList();
        string connStr = "server=localhost;user=root;database=dbbiblioteca;port=3306;password=123456789";
        MySqlConnection conn = new MySqlConnection(connStr);
        try
        {
            Console.WriteLine("Connecting to MySQL...");
            conn.Open();
            string sql = "select * from user;";
            MySqlCommand cmd = new MySqlCommand(sql, conn);
            MySqlDataReader rdr = cmd.ExecuteReader();
            while (rdr.Read())
            {
                data_arrayl.Add("-- n_leitor: [" + rdr[0] + "] nome: [" + rdr[1] + "] cpostal: [" + rdr[2] + "] cidade: [" + rdr[3] + "]");
            }
            rdr.Close();
        }
        catch (Exception ex)
        {
            Console.WriteLine(ex.ToString());
        }
        conn.Close();
        Console.WriteLine("Done.");
        return data_arrayl;
    }



}