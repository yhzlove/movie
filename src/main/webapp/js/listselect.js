
		

		function testDisplay(url) {
			if (document.getElementById("optionsRadios1").checked == true) {
				document.getElementById("fangyuan_status").disabled=false;
				document.getElementById("qiye_status").disabled=true;
				document.getElementById("fangyuan").style.display = "";
				document.getElementById("qiye").style.display = "none";
				document.getElementById("jiaofei").style.display = "none";
				
			}
			if (document.getElementById("optionsRadios2").checked == true) {
				document.getElementById("fangyuan").style.display = "none";
				document.getElementById("qiye").style.display = "";
				document.getElementById("jiaofei").style.display = "none";
			}
			if (document.getElementById("optionsRadios3").checked == true) {
				document.getElementById("qiye_status").disabled=false;
				document.getElementById("fangyuan_status").disabled=true;
				document.getElementById("fangyuan").style.display = "none";
				document.getElementById("qiye").style.display = "none";
				document.getElementById("jiaofei").style.display = "";
				
			}
			document.getElementById("form").action = url;
		}
