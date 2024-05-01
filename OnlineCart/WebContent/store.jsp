<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="style.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>
	<div class="container-fluid bg-info p-2">
		<div class="row">
			<div class="col-md-2"></div>
			<div class="col-md-8 text-center"><h2>Online Store</h2></div>
			<div class="col-md-2 text-center"><h2 id="cart" style="cursor:pointer">Cart<i class="fa fa-shopping-cart" aria-hidden="true"></i></h2></div>
		</div>
	</div>
	<div class="container-fluid p-5">
		<div class="container p-5">
			<div class="row">
				<div class="col-md-3">
					<select id="cate" class="form-control">
						<option>Select Category</option>
					</select>
				</div>
			</div>	
			<br/><br/>	
			<center><div id="items" style="display:flex;flex-wrap:wrap">
				
			</div></center>
		</div>
		<div class="modal fade" id="addcart">
			<div class="modal-dialog">
			    <div class="modal-content">
			      <div class="modal-body">
			        <h3>Added to cart&nbsp;&nbsp;<i class="fa fa-check-square-o" aria-hidden="true"></i></h3>
			      </div>
			      <div class="modal-footer">
			        <button type="button" class="btn btn-info" data-bs-dismiss="modal">Close</button>
			      </div>
			    </div>
			  </div>
			</div>
	</div>
	<script>		
		$("#cart").click(function(){
			window.location.href="cart.jsp"
		})
		jQuery(document).ready(function($){
			$.ajax({
	      		url:'Products',
	      		method:'post',
	      		success:function(res){
		      		 res.map((ele)=>{
		      			 var item = '<div class="text-center m-4"><img class="img rounded" height="200px" src="'+ele.image+'" /><h4>'
					     	+ele.price+'/-</h4><input type="number" id="cnt'
					     	+ele.pid+'" value=1 min=1 max=10 class= "m-2 input form-control" /><button data-bs-toggle="modal" data-bs-target="#addcart" onclick="adc('
					     	+ele.pid+')" class="m-2 form-control bg-info">Add to Cart</button></div>';
		      			$("#items").append(item);
		      		 })
	      		}
	      	})
	  	});
		var c=0;
		$("#cate").click(function(){
			$.ajax({
	      		url:'Category',
	      		method:'post',
	      		success:function(res){
	      			if(c===0){
	      				var opt = $("<option></option>").attr("value", "All").text("All");
	      			    $("#cate").append(opt);
		      			res.map((ele)=>{     				
		      				var newOption = $("<option></option>").attr("value", ele.pcatname).text(ele.pcatname);
		      			    $("#cate").append(newOption);
			      		 })
			      		 c++;
	      			}
	      		}
	      	})
	      	$.ajax({
		      	url:'CategoryList',
		      	method:'post',
		     	data:{
		      		cat:$("#cate").val()
		      	},
		      	success:function(res){
		      		$("#items").empty();
		      		res.map((ele)=>{
		      			 var item = '<div class="text-center m-4"><img class="img rounded" height="200px" src="'+ele.image+'" /><h4>'
					     	+ele.price+'/-</h4><input type="number" id="cnt'
					     	+ele.pid+'" value=1 min=1 max=10 class= "m-2 input form-control" /><button data-bs-toggle="modal" data-bs-target="#addcart" onclick="adc('
					     	+ele.pid+')" class="m-2 form-control bg-info">Add to Cart</button></div>';
		      			$("#items").append(item);
		      		 })
		      	}
		    })
		})
		function adc(i){
			$.ajax({
	      		url:'ToCart',
	      		method:'post',
	      		data:{ 
	      			pid:""+i+"",
	      			qt:$("#cnt"+i+"").val()
	      		},
	      		success:function(res){
		      		 console.log(res);
	      		}
	      	})
		}
	</script>
</body>
</html>