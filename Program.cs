using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Configuration;
using System.Threading.Tasks;


namespace Database_Programming
{

    
    class Employee
    {
  
        public int EmpId { get; set; }
        public string EmpName { get; set; }
        public string EmpAddress { get; set; }
        public double EmpSalary { get; set; }
        public int DeptId { get; set; }
        public DateTime EmpBirthDate { get; set; }
       
        public override string ToString()
        {
            return $"{EmpName}  from {EmpAddress} born on {EmpBirthDate.ToLongDateString()} earns a Salary of {EmpSalary}";
        }
    }

    interface IDataComponent
    {
        Employee[] GetAllEmployees();
    }


    class DataComponent : IDataComponent
    {

        private Employee createEmployee(SqlDataReader reader)
        {
            var emp = new Employee();
            emp.EmpId = Convert.ToInt32(reader[0]);
            emp.EmpName = reader["EmpName"].ToString();
            emp.EmpAddress = reader[2].ToString();
            emp.EmpSalary = Convert.ToDouble(reader[3]);
            emp.DeptId = Convert.ToInt32(reader[4]);
            emp.EmpBirthDate = Convert.ToDateTime(reader[5]);
           
            return emp;
        }
        const string strConnection = @"Data Source=W-H44PY03-0;Initial Catalog=Manojkumar D R;Persist Security Info=True;User ID=sa;Password=admin";
        public Employee[] GetAllEmployees()
        {
            var list = new List<Employee>();
            using (var connection = new SqlConnection(strConnection))
            {
                using (var cmd = new SqlCommand("SELECT * FROM EMPTABLE", connection))
                {

                    try
                    {
                        connection.Open();
                        SqlDataReader reader = cmd.ExecuteReader();
                        while (reader.Read())
                        {
                            //Add to the collection.
                            list.Add(createEmployee(reader));
                        }
                    }
                    catch (Exception ex)
                    {
                        Console.WriteLine(ex.Message);
                    }
                }
                return list.ToArray();
            }

        }
    }
    class Program
    {
        // public static object R { get; private set; }
        const string query = "SELECT * FROM EMPTABLE";
        static string strConnection = ConfigurationManager.ConnectionStrings["myconnection"].ConnectionString;

        // static object Util { get; private set; }
        class Util
        {
            public static string GetString(string question)
            {
                Console.WriteLine(question);
                return Console.ReadLine();
            }
            public static Double GetNumber(string question)
            {
                string result = GetString(question);
                return Double.Parse(result);
            }
        }

        static void Main(string[] args)
        {
            //displayRecords();
            //displayRecordsAsEmployees();
            insertRecord();
        }

        private static void insertRecord()
        {
            var name = Util.GetString("Enter the Name");
            var address = Util.GetString("Enter the Address");
            var salary = Util.GetNumber("Enter the Salary");
            Console.WriteLine("Enetre the date as dd/MM/yyyy");
            var dt = DateTime.Parse(Console.ReadLine());
            var depId = Util.GetNumber("Enter the Dept ID");

            string insertStatement = $"Insert into EmpTable values('{name}','{address}','{salary}','{depId}','{dt.ToString("MM/dd/yyyy")}'";
            using (SqlConnection con = new SqlConnection(strConnection))
            {
                using (SqlCommand cmd = new SqlCommand(insertStatement, con))
                {
                    try
                    {
                        con.Open();
                        cmd.ExecuteNonQuery();// For insert,delete and update
                    }
                    catch (Exception ex)
                    {
                        Console.WriteLine(ex.Message);
                    }
                }
            }
        }

        private static void displayRecordsAsEmployees()
        {
            var records = new DataComponent().GetAllEmployees();
            if (records != null)
            {
                foreach (var rec in records)
                    Console.WriteLine(rec);
            }
        }

        private static void displayRecords()
        {
            var connectionString = @"Data Source=W-H44PY03-0;Initial Catalog=Manojkumar D R;Persist Security Info=True;User ID=sa;Password=admin";
            string query = "SELECT * FROM EMPTABLE";
            using (var connection = new SqlConnection(connectionString))
            {
                var command = new SqlCommand(query, connection);
                try
                {
                    connection.Open();
                    var reader = command.ExecuteReader();
                    while (reader.Read())
                        Console.WriteLine($"Name: {reader[1]}\tAddress: {reader[2]}");
                }
                catch (SqlException ex)
                { 
                Console.WriteLine(ex.Message);
                }

            }
        }
    }
}

