window.addEventListener ("scroll",function() {

	if (window.pageYOffset>100) {
		document.getElementById ("scrollToTop").style.display= "block";
	}
	
	else if (window.pageYOffset<100) {
		document.getElementById ("scrollToTop").style.display= "none";
	}
	
	val[0].innerHTML= "PageYOffset = "+window.pageYOffset
},!1);

function showFronte() {
	document.getElementById("i1").style.display = "block";
	document.getElementById("i2").style.display = "none";	
}

function showRetro() {
	document.getElementById("i2").style.display = "block";
	document.getElementById("i1").style.display = "none";
}


