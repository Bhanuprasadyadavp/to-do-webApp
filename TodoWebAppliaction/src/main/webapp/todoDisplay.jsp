 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.sql.*"%>
	<%@page import="com.todo.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 	<title>TodoApp</title>
    <link rel="stylesheet" href="./style.css">
   <link rel="icon" href="./checklist2.png">
     <link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous">
<link href="CSS/Style.css" rel="stylesheet">

 <style>
       
        footer {
            background-color: #0339; /* Dark Gray */
            color: #fff; /* White */
           
        
            position:relative;
            bottom:0%;
            left:0%;
            width: 100%;
           display: flex;
          align-items:center;
          align-content:center;
          
           justify-content: center;     
        }
        footer p{
        padding-top:10px;
       align-self: center;
        }
         
         
         .social{
    background-color: #000000;
    display: flex;
    align-items: center;
    align-content: flex-start;
    justify-content: center;
    
   
   padding-bottom: 25px;  
}
.social a{
    text-decoration: none;
    margin: 0px 20px;
}
.social a img{
    height: 40px;
    width: 40px;
    transition: all .5ms;
    
}
.social img:hover{
    transform: scale(1.2);

}
.hori{
    background-color: #000000;
    display: flex;
    align-items: center;
    justify-content: center;
    flex-direction: column;
  color: rgb(9, 179, 222);
     
    
}
.hori hr{
    width: 20vw;
     size: 10;
     height: 2px;
     margin-bottom: 20px; 
     color: #e10808;
     
      
 }
  .pic{
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    margin-top: 20px;
    background-color: black;
    align-content: center;
 }
 .pic h1{
    margin-top: 10px;
    margin-left: 10px;
    color: white;
 }
       .aa{
        width:400px ;
        height:500px;
          
        }
        .btn a{
        color: white;
        text-decoration: none;
        font-weight: bold; 
        }
         
        .table{
        position:static;
        }
    </style>
</head>
<body>

<nav class="navbar navbar-expand-lg bg-body-tertiary">
		<div class="container-fluid">
			<a class="navbar-brand" href="home.jsp">TODO</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>

			<div class="collapse navbar-collapse" id="navbarSupportedContent">

				<ul class="navbar-nav me-auto mb-2 mb-lg-0">
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="home.jsp">Home</a></li>
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="/TodoWebAppliaction/home.jsp#about">About</a></li>
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="/TodoWebAppliaction/home.jsp#service">Services</a></li>
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="#contact">Contact</a></li>
					  <li class="nav-item "><a class="nav-link active text-primary fw-bolder fs-6"
						aria-current="page" href="home.jsp">Hey &nbsp;<b><%= TodoLogin.name %></b></a></li>
				</ul>
			</div>

		</div>

	</nav>
 
 
 <div class="container-fluid pt-5">
  <div class="card mb-3" style="max-width: 2040px;">
  <div class="row g-0">
    <div class="col-md-4">
      <img src="./Images/todoimage.jpg"   class="img-fluid rounded-start" alt="todo image">
    </div>
    <div class="col-md-8">
            <h1 class="card-title fw-bold text-dark" style="text-align: center;">TODO Lists</h1>
   <div class="d-flex align-items-end justify-content-end align-content-end"> <a href="./logout.jsp"><button style="--bs-btn-padding-y: .25rem; --bs-btn-padding-x: .5rem; --bs-btn-font-size: 1rem;" class="btn btn-danger fw-bold mx-3">Log out</button></a></div>
      <div class="card-body container ">
        
        
         <table  class="table caption-top  table-sm table-responsive col-md-6">
         <caption><a href="./todo.jsp"><button style="--bs-btn-padding-y: .25rem; --bs-btn-padding-x: .5rem; --bs-btn-font-size: 1rem;" class="btn btn-primary fw-bold">Add Todo</button></a></caption>
         <thead class="table-dark">
        <tr class="text-center">
            <th scope="col">TITLE</th>
            <th scope="col">TARGET DATE</th>
            <th scope="col">STATUS</th>
            <th scope="col" class="pr-2">Action</th>
        </tr>
  


		   </thead>
   <tbody class="table-group-divider">
		
		<%
	Connection con=null;
	PreparedStatement ps=null;
	Statement st=null;
	ResultSet rs=null;
	String username=TodoLogin.username;
	
	

try{
	Class.forName("com.mysql.cj.jdbc.Driver");
	con=DriverManager.getConnection("jdbc:mysql://localhost:3306/todo", "root","root");
	ps=con.prepareStatement("select * from todolist where username =?");
	ps.setString(1, username);
	
	rs=ps.executeQuery();
	
	
	while(rs.next())
	{
		int id=rs.getInt(1);
		String title = rs.getString(2);
		String description=rs.getString(3);
		String status = rs.getString(4);
		String date = rs.getString(5);
		
		%>
		<tr class="text-center">
            <td><%=title %></td>
            <td><%=date %></td>
            <td><%=status %></td>
            <td>
            <div class="d-flex align-items-center justify-content-center flex-wrap ">
            <form action="edit.jsp" >
            	<input style="display:none" type="number" name="id" value=<%=id%> >
            	<input style="display:none" type="text" name="title" value=<%=title %> >
            	<input style="display:none" type="text" name="description" value=<%=description %> >
            	<input style="display:none" type="text" name="status" value=<%=status %>>
            	<input style="display:none" type="date" name="date" value=<%=date %> >
            	<!-- <input type="submit" value="update" class="f1"> -->
            	<button value="update" style="--bs-btn-padding-y: .25rem; --bs-btn-padding-x: .5rem; --bs-btn-font-size: 1rem;" class="btn btn-primary fw-bold">Update</button>
            </form> 
            	
            <form action="delete.jsp">
            	<input style="display:none" type="number" name="id" value=<%=id%> >
            	<button class="btn btn-primary fw-bold mx-2" style="--bs-btn-padding-y: .25rem; --bs-btn-padding-x: .5rem; --bs-btn-font-size: 1rem;" value="button">Delete</button>
            </form> 
            </div>
             </td>
            
        </tr>
</tbody>
	<%

	}
}
catch(Exception e)
{
	
}


%>
</table>
     </div>    
      </div>
    </div>
  </div>
</div>
  
	 
	<div class="pic"><img class="mt-2" width="150px" height="50px" src="./Images/aklogo.png" alt="logo">
    <h1>ARUN KUMAR</h1>
</div>
     <div id="contact" class="hori"><h2>Contact Us</h2> <br>
    <hr></div>
 <div class="social">
     
    <a href="https://github.com/arunsak04">
        <img src="./github2.png" alt="">
    </a>
    <a href="https://www.linkedin.com/in/arun-kumar-3b8353192/">
        <img src="./linked in.png" alt="">
    </a>
    <a href="https://twitter.com/ArunSAk90498332?t=JKbGXmeyQgnn6BngsI1I0A&s=09">
        <img src="./twitter2.png" alt="">
    </a>
    <a href="https://www.facebook.com/nagaraj.nagraj.3133">
        <img src="./fb.png" alt="">
    </a>
    <a href="arunsakka4@gmail.com">
        <img  src="./email2.png" alt="">
    </a>   
</div>	 
		
    <footer>
         <p>
    Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This TODO APP is made by Arun Kumar
    </p>
    </footer>     
	 
 

 
	
	

</body>
</html>




 
	 
			

 
		
	 