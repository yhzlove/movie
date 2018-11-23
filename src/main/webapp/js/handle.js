var xmlHttpRequest = null;
function create() {
	if ((typeof XMLHttpRequest) != 'undefined') {
		// FF
		xmlHttpRequest = new XMLHttpRequest();
	} else {
		// IE
		xmlHttpRequest = new ActiveXObject('Microsoft.XMLHttp');
	}
}
/*
 * ajax发送请求
 * author 孟宪成
 * @param {Object} buttonId
 * @param {Object} url访问地址
 * @param {Object} param参数
 */
function sendRequestPost(buttonId, url, param) {
	create();
	xmlHttpRequest.open("GET", url + "?" + param, true);
	xmlHttpRequest.send();
	if (buttonId == 0) {
		// alert("id=0")
		// xmlHttpRequest.onreadystatechange = processResponse(buttonId);   
	}
}
//处理返回信息函数   
function find() {
	document.getElementById('form1').submit();
}
/*author 孟宪成
 * 回调函数，暂时没用到
 * @param {Object} buttonId
 */
function processResponse(buttonId) {
	//  alert(xmlHttpRequest.readyState)
	if (xmlHttpRequest.readyState == 4) {
		//	  alert(xmlHttpRequest.status );
		if (xmlHttpRequest.status == 200) {
			var res = xmlHttpRequest.responseText;
			alert(res);
			var currentURL = window.location;
			if (buttonId == 0) {
				window.alert("删除成功");
				//   window.location.replace ( currentURL.href );
			}
		}
	}
}

/*
 * author 孟宪成
 * 删除操作
 * @param {Object} url访问地址如// var url='delete!deleteByqtz.action';
 */
function deleteWorker(url) {

	objName = document.getElementById("form");
	var check = 0;
	var str = "";
	for (i = 0; i < objName.length; i++) {
		if (objName[i].type == "checkbox" && objName[i].checked) {
			check = check + 1;
			str = str + ',' + objName[i].value;
		}
	}
	var param = "ids=" + str;
	var returnV = false;
	var buttonId = 0;
		if (check == 0) {
			alert('  请选择至少一条信息');
		} else if(window.confirm('确定要删除吗？')){
			sendRequestPost(buttonId, url, param);
			alert('成功删除' + check + '条记录');
			returnV = true;
		}
	var url0 = window.location.href.toString();
	var url1 = url0.substring(0, url0.indexOf('?', 0));
	if (returnV) {
		window.location.reload(url1 + '?param=noContant');
	}
}
//'addhtm.action'
/*
 * 添加操作
 * author孟宪成
 * @param {Object} url
 * @memberOf {TypeName} 
 */
function addWorker(url, style) {
	if (style != null) {
		var w = window.showModalDialog(url, this, style);
	} else {
		var w = window.showModalDialog(url, this,
				'dialogWidth:700px;dialogHeight:500px;status:no;');
	}
	var url0 = window.location.href.toString();
	var url1 = url0.substring(0, url0.indexOf('?', 0));
	if (w) {
		window.location.reload(url1 + '?param=noContant');
	}

}
//  var url='update!findOne.action';
/*
 * 修改操作
 * author孟宪成
 * @param {Object} url
 * @memberOf {TypeName} 
 */
function updateWorker(url, style) {
	objName = document.getElementById("form");
	var checkCount = 0;
	var id;
	for (i = 0; i < objName.length; i++) {
		if (objName[i].type == "checkbox" && objName[i].checked) {
			id = objName[i].value
			checkCount = checkCount + 1;
		}
	}
	if (checkCount > 1) {
		alert("请选择一条记录");
	} else if (checkCount == 0) {
		alert("未选择记录");
	} else {
		var buttonId = 1;
		var param = "id=" + id;
		//window.open(url+"?"+param)
		if (style != null) {
			var w = window.showModalDialog(url + "?" + param, this, style);
		} else {
			var w = window.showModalDialog(url + "?" + param, this,
					'dialogWidth:700px;dialogHeight:500px;status:no;');
		}
		var url0 = window.location.href.toString();
		var url1 = url0.substring(0, url0.indexOf('?', 0));
		if (w) {
			window.location.reload(url1 + '?param=noContant');
		}

	}
}
/*
 * checkbow全选
 * author孟宪成
 */
function checkAll() {

	var checkAll = document.getElementById("checkbox")
	objName = document.getElementById("form");
	if (checkAll.checked) {
		for (i = 0; i < objName.length; i++) {

			if (objName[i].type == "checkbox") {
				objName[i].checked = true
			}
		}

	} else {
		for (i = 0; i < objName.length; i++) {
			if (objName[i].type == "checkbox") {
				objName[i].checked = false
			}
		}
	}
}

/*
 * 表单提交
 * param {Object} param:'upd'修改表单提交
 * param:'add'添加表单提交
 */
function goform(param) {
	
//	var a = document.getElementById("bz");
//	
//	if (a.value.length > 100) {
//		alert("输入的备注框长度不能超过100个字符！");
//		return false;
//	}
	subform(Fields, FieldsName, CheckType, Length, IsEmpty, param)

}
/*
 * 校验
 * Fields,控件名数组
 * FieldsName,中文标签数组
 * CheckType,数据类型text,date,integer
 * Length,长度int
 * IsEmpty是否为空boolue
 * @param {Object} param:'upd'修改表单提交
 * param:'add'添加表单提交
 * var strMessage = "";  校验错误信息
 */
function subform(Fields, FieldsName, CheckType, Length, IsEmpty, param) {
	var ok = checkdata(Fields, FieldsName, CheckType, Length, IsEmpty);
	if (ok) {
		document.forms[0].submit();
		window.returnValue = true;
		if (param == 'upd') {
			alert('修改成功')
		} else if (param == 'add') {
			alert('添加成功')
		}
		window.close()
	}
}
/**
 * 表单提交测试
 */

function testSubform() {
	document.forms[0].submit();
	window.close()
}
/*
 * 点击取消关闭窗口
 */
function closeThis() {
	window.returnValue = false;
	window.close();
}

function subForm() {
	if (Validator.Validate(document.getElementById('form1')) == true) {
		document.getElementById('form1').submit();
		window.returnValue = true;
		window.close();
	}
}
//导出excel
function outExcelss(url){
	alert('d')
	var formx=document.getElementById('form1');
	formx.action=url;
	formx.submit();
}
function findById(url) {
	var str = null;
	var tb = document.getElementById("table1");
	var rows = tb.rows;
	var checkCount = 0;
	for (i = 1; i < rows.length; i++) {
		var cells = rows[i].cells
		var radio = cells[0].childNodes[0]
		if (radio.name == 'checkbox2' && radio.checked) {
			str = radio.value + '&nbsp;'
			for (j = 1; j < cells.length; j++) {
				str += cells[j].innerHTML
			}
		}
	}
	window.returnValue = str
	window.close();
}
//报修计划增加车辆查询
function findById2(url) {
	alert('s')
	var str = null;
	var tb = document.getElementById("table1");
	var rows = tb.rows;
	var checkCount = 0;
	for (i = 1; i < rows.length; i++) {
		var cells = rows[i].cells
		var radio = cells[0].childNodes[0]
		if (radio.name == 'checkbox2' && radio.checked) {
			str = radio.value + '&nbsp;'
			for (j = 1; j < cells.length; j++) {
				str += cells[j].innerHTML
			}
		}
	}
	alert('a')
		var param = "param=" +radio.value;
	 sendRequestPost(null, url,param);
	window.returnValue = str
	window.close();
}

function setAuthority(url) {
	objName = document.getElementById("form");
	var checkCount = 0;
	var uid;
	for (i = 0; i < objName.length; i++) {
		if (objName[i].type == "checkbox" && objName[i].checked) {
			uid = objName[i].value
			checkCount = checkCount + 1;
		}
	}
	if (checkCount > 1) {
		alert("只能对一条信息操作");
	} else if (checkCount == 0) {
		alert("未选择记录");
	} else {
		var buttonId = 1;
		var param = "uid=" + uid;
		var w = window.showModalDialog(url + "?" + param, this,
				'dialogWidth:700px;dialogHeight:500px;status:no;');
		var url0 = window.location.href.toString();
		var url1 = url0.substring(0, url0.indexOf('?', 0));
		if (w) {
			window.location.reload(url1 + '?param=noContant');
		}
	}
}
//下拉框条件查询当前值
	function fn(deptId){
					var d='${selId}';
					alert(d)
			var deptSelect = document.getElementById(deptId);
			var deptLength = deptSelect.options.length;
			for(var i=0;i<deptLength;i++){
				if(d==deptSelect.options[i].value){
					deptSelect.options[i].selected=true;
				}
			}
		}
