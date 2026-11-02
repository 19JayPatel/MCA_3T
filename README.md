
# Employee Management System

A simple Employee Management System developed using ASP.NET Web Forms, C#, and Microsoft SQL Server. This project demonstrates basic CRUD operations (Create, Read, Update, and Delete) along with employee image uploads.

## Features

- **Add Employee:** Register an employee with their name, email, gender, city, mobile number, and image.
- **View Employees:** Display employee records in an ASP.NET GridView.
- **Edit Employee:** Load existing employee details into the form.
- **Update Employee:** Modify an employee's saved information.
- **Delete Employee:** Remove an employee record from the database.
- **Image Upload:** Upload employee images in PNG or JPG format.
- **Gender Selection:** Select Male or Female using radio buttons.

## Technologies Used

- C#
- ASP.NET Web Forms
- .NET Framework
- Microsoft SQL Server
- ADO.NET
- HTML and CSS
- Visual Studio

## Project Structure

```text
MCA_3T/
├── WebForm1.aspx          # Employee registration form and GridView
├── WebForm1.aspx.cs       # Page events and application logic
├── emp_BL.cs              # Database operations
├── Web.config             # Application configuration
├── image_upload/          # Uploaded employee images
└── README.md              # Project documentation
```

> Note: The file and folder names above are based on the code shown. Your actual repository may contain additional files or different names.

## Requirements

Install the following software before running the project:

1. Visual Studio with ASP.NET and web development support.
2. Microsoft SQL Server.
3. SQL Server Management Studio (SSMS), recommended for database management.
4. .NET Framework version compatible with your Visual Studio project.

## Database Setup

### 1. Create the database

Open SQL Server Management Studio and execute:

```sql
CREATE DATABASE MCA3_T_Employee;
GO

USE MCA3_T_Employee;
GO
```

### 2. Create the employee table

```sql
CREATE TABLE [dbo].[Emp_tbl]
(
    [Id] INT NOT NULL PRIMARY KEY IDENTITY, 
    [Name] NVARCHAR(MAX) NOT NULL, 
    [Email] NVARCHAR(MAX) NOT NULL, 
    [Gender] NVARCHAR(MAX) NOT NULL, 
    [City] NVARCHAR(MAX) NOT NULL, 
    [Mobile] NVARCHAR(MAX) NOT NULL, 
    [Image] NVARCHAR(MAX) NOT NULL
)
GO
```

This schema is a suggested setup based on the fields used by the application. If your existing database has different column types, sizes, or constraints, use your actual schema instead.

## Configure the Database Connection

Open `Web.config` and add a connection string inside the `<configuration>` element:

```xml
<connectionStrings>
    <add name="db"
         connectionString="Data Source=YOUR_SERVER_NAME;Initial Catalog=MCA3_T_Employee;Integrated Security=True"
         providerName="System.Data.SqlClient" />
</connectionStrings>
```

Replace `YOUR_SERVER_NAME` with your SQL Server instance name.

For example, a local SQL Server Express installation might use `.\SQLEXPRESS`. Use the server name that matches your installation.

The connection string name must be `db` because the database class reads:

```csharp
ConfigurationManager.ConnectionStrings["db"].ConnectionString;
```

## Image Upload Setup

1. Create an `image_upload` folder in the project directory.
2. Ensure the application can write files to this folder.
3. Upload employee images through the registration form.

The current code accepts `.png` and `.jpg` extensions. Make sure the image path saved in the database matches the path used by the GridView.

## Run the Project

1. Clone or download this repository.
2. Open the project or solution in Visual Studio.
3. Configure the SQL Server connection string in `Web.config`.
4. Create the database and employee table, or connect to your existing database.
5. Ensure the image upload folder exists.
6. Set `WebForm1.aspx` as the start page if required.
7. Run the project using IIS Express.
8. Add an employee and verify that the record appears in the GridView.
9. Test the Edit, Update, and Delete operations.

## CRUD Operations

| Operation | Description |
|---|---|
| Create | Inserts new employee information into `emp_tbl`. |
| Read | Retrieves employee records and displays them in GridView. |
| Update | Modifies the selected employee's details. |
| Delete | Deletes the selected employee record. |

## Learning Objectives

This project helps students understand:

- ASP.NET Web Forms page events.
- C# classes and methods.
- ADO.NET database connectivity.
- SQL Server CRUD operations.
- Data binding with GridView.
- File uploads in ASP.NET.
- Passing values between form controls and database methods.
- Using `ViewState` to store the selected employee ID.
