<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Change Pin</title>
<%@ include file="./components/common_cs_js.jsp"%>

<script type="text/javascript">

function validate()
{
	var currentpin=document.getElementById("currentpin").value;
	var newpin=document.getElementById("newpin").value;
	var rnewpin=document.getElementById("rnewpin").value;
	
	if(currentpin.length != 5)
		{
		 alert("Pin length should be 5");
		  return false;
		}
	
	if(newpin != 5)
	{
		alert("Pin length should be 5");
		  return false;
	}

	if(rnewpin != 5)
	{
		alert("Pin length should be 5");
		  return false;
	}
	
    if(newpin != rnewpin) {
    	alert("Pin not matching!");
		  return false;
    }
	
	return true;
}

</script>

</head>
<body>
<%@ include file="./components/navbar.jsp"%>

<div class="container-fluid">
  <div class="row mt-2">
       <div class="col-md-4 offset-md-4 admin" >
            <div class="card">
                <%@ include file="components/message.jsp"%>
                <div class="card-body px-5">
             
                    <h3 class="text-center my-3">Change Pin..!!</h3>
            <form onsubmit="return validate()" action="changepin" method="post" >
            
                 <div class="form-group">
                     <label for="email">Current Pin</label>
                     <input type="text" class="form-control" id="username" aria-describedby="emailHelp" name="currentpin" placeholder="Enter current pin.." required>
                 </div>
                 
                  <div class="form-group">
                     <label for="email">New Pin</label>
                     <input type="text" class="form-control" id="username" aria-describedby="emailHelp" name="newpin" placeholder="Enter new pin.." required>
                 </div>
        
                 <div class="form-group">
                     <label for="email">Repeat New Pin</label>
                     <input type="text" class="form-control" id="username" aria-describedby="emailHelp" name="rnewpin" placeholder="re-enter new pin.." required>
                 </div>
                <div class="container text-center">
                      <button class="btn custom-bg text-color"><b>Change Pin</b></button>
                </div>
                 
            </form>
                </div>
            </div>
           
            
       </div>
  </div>
</div>
</body>
</html>