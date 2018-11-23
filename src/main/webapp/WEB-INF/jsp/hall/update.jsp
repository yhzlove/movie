<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/demo.css" />
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/css.css" />
<script type="text/javascript" src="<%=request.getContextPath()%>/js/check.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/handle.js"></script>

<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-1.8.3.min.js"></script>
<!-- seat -->
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/js/SeatCharts/jquery.seat-charts.css" />
<script type="text/javascript" src="<%=request.getContextPath()%>/js/SeatCharts/jquery.seat-charts.js"></script>
<!-- seat -->
<title></title>
<style type="text/css">
.demo{ margin:40px auto 0 auto; min-height:450px;}/*width:700px;*/
@media screen and (max-width: 360px) {.demo {width:340px}}

.front{width: 300px;margin: 5px 32px 45px 32px;background-color: #f0f0f0;	color: #666;text-align: center;padding: 3px;border-radius: 5px;}
.booking-details {float: left;position: relative; }/*width:200px;height: 450px;*/
.booking-details h3 {margin: 5px 5px 0 0;font-size: 16px;}
.booking-details p{line-height:26px; font-size:16px; color:#999}
.booking-details p span{color:#666}
div.seatCharts-cell {color: #182C4E;height: 25px;width: 25px;line-height: 25px;margin: 3px;float: left;text-align: center;outline: none;font-size: 13px;}
div.seatCharts-seat {color: #fff;cursor: pointer;-webkit-border-radius: 5px;-moz-border-radius: 5px;border-radius: 5px;}
div.seatCharts-row {height: 35px;}
div.seatCharts-seat.available {background-color: #B9DEA0;}
div.seatCharts-seat.focused {background-color: #76B474;border: none;}
div.seatCharts-seat.selected {background-color: #E6CAC4;}
div.seatCharts-seat.unavailable {background-color: #472B34;cursor: not-allowed;}
div.seatCharts-container {border-right: 1px dotted #adadad;padding: 20px;float: left;}/*width: 400px;*/
/* div.seatCharts-legend {padding-left: 0px;position: absolute;bottom: 16px;} */
ul.seatCharts-legendList {padding-left: 0px;}
.seatCharts-legendItem{float:left; width:90px;margin-top: 10px;line-height: 2;}
span.seatCharts-legendDescription {margin-left: 5px;line-height: 30px;}
.checkout-button {display: block;width:80px; height:24px; line-height:20px;margin: 10px auto;border:1px solid #999;font-size: 14px; cursor:pointer}
#selected-seats {max-height: 150px;overflow-y: auto;overflow-x: none;width: 400px;}
#selected-seats li{float:left; width:72px; height:26px; line-height:26px; border:1px solid #d3d3d3; background:#f7f7f7; margin:6px; font-size:14px; font-weight:bold; text-align:center}
</style>
<!-- <script type="text/javascript"> -->
<!-- 	var Fields = "userName;name;password_M;role.id"; -->
<!-- 	var FieldsName = "用户名;姓名;密码;角色"; -->
<!-- 	var CheckType = "text;text;text;dropdownlist"; -->
<!-- 	var Length = "50;50;50,50"; -->
<!-- 	var IsEmpty = "false;false;false;false"; -->
<!-- </script> -->
</head>

<body>


	<!---------------右侧------------------>
	<div class="right">

		<!--right start-->
		<div class="top">
			<!--top start-->
			<div class="position pullleft ">
				<p>
					<span class="STYLE1">影厅管理--修改</span>
				</p>
			</div>
			<div class="pullright overflowhidden">
				<input type="button" class="btn btn-default" value="返回"
					onclick="javascript:history.go(-1);" />
			</div>
			<div class="height10">
				<br>
			</div>
		</div><!--top end-->
		<div class="right-ctn">
			<div class="bordernormal plr20">
				<form action="<%=request.getContextPath()%>/hall/back/update/${hall.id}" method="post"
					　enctype="multipart/form-data">
					<label class="labelnormal">基本信息</label>
					<div class="height20"></div>
					
					<input type="hidden" name="id" value="${hall.id}">
					<div class=" overflowhidden">
						<div class="pullleft" style="width:48%; padding-right:2%;">
							<!---两列 start-->
							<div class="formgroup">
								<label class="font14 widthtextalignr ">
									<span class="required">*</span>影厅名称：</label> 
								<input class="form-control widthlonger validator" placeholder="请在此处输入..." id="name"
									name="name" style=" padding:0 12px;" value="${hall.name}">
							</div>
						</div>
						<!---两列 end-->
						<div class="pullleft" style="width:48%; padding-right:2%;">
							<!---两列 start-->
							<div class="formgroup">
								<label class="font14 widthtextalignr">
									<span class="required">*</span>座位数：</label> 
								<input class="form-control widthlonger" placeholder="自动生成" id="seatCount"
									name="seatCount" style=" padding:0 12px;" value="${hall.seatCount}" readonly="readonly">
							</div>
						</div>

					</div>
					<div class=" overflowhidden">
						<div class="pullleft" style="width:48%; padding-right:2%;">
							<div class="formgroup">
								<label class="font14 widthtextalignr ">
									<span class="required">*</span>影厅类型：</label> 
								<select class="form-control widthlonger " name="classify" id="classify"
										style=" padding:0 12px;width: 196px;">
										<option value="2D" <c:if test="${hall.classify=='2D'}">selected</c:if>>2D</option>
										<option value="3D" <c:if test="${hall.classify=='3D'}">selected</c:if>>3D</option>
										<option value="IMAX" <c:if test="${hall.classify=='IMAX'}">selected</c:if>>IMAX</option>
								</select>
							</div>
						</div>
						<div class="pullleft" style="width:48%; padding-right:2%;">
							<div class="formgroup">
								<label class="font14 widthtextalignr ">
									<span class="required">*</span>状态：</label> 
									<select class="form-control widthlonger " name="flag" id="flag"
										style=" padding:0 12px;width: 196px;">
										<option value="1" <c:if test="${hall.flag=='1'}">selected</c:if>>启用</option>
										<option value="2" <c:if test="${hall.flag=='2'}">selected</c:if>>暂停使用</option>
									</select>
							</div>
						</div>

					</div>
					
					<div class="formgroup">
						<label class="font14 widthtextalignr">影厅位置：</label>
						<input class="form-control widthlonger" style="width:40%; padding-right:2%;" placeholder="请在此处输入..." id="addr"
									name="addr" style=" padding:0 12px;" value="${hall.addr}">
					</div>
					
					<div class="formgroup">
						<label class="font14 widthtextalignr">备注：</label>
						<textarea rows="3" name="remark" id="remark"
							class="form-control textareawidthlong bglightgrey">${hall.remark}</textarea>
					</div>

					<!----formgroup end--------->
					<div class="height10"></div>
					<div style="border:1px dashed #e5e5e5;"></div>
					<div class="height10"></div>
					<label class="labelnormal">座位安排</label>
					<div class="height10"></div>
					
					<div class=" overflowhidden">
						<div class="pullleft" style="width:48%; padding-right:2%;">
							<!---两列 start-->
							<div class="formgroup">
								<label class="font14 widthtextalignr ">
									<span class="required">*</span>排：</label> 
								<input class="form-control widthlonger validator" placeholder="请在此处输入..." id="seatRows"
									name="seatRows" style=" padding:0 12px;" value="${hall.seatRows}">
							</div>
						</div>
						<!---两列 end-->
						<div class="pullleft" style="width:48%; padding-right:2%;">
							<!---两列 start-->
							<div class="formgroup">
								<label class="font14 widthtextalignr">
									<span class="required">*</span>座：</label> 
								<input class="form-control widthlonger" placeholder="请在此处输入..." id="seatCols"
									name="seatCols" style=" padding:0 12px;" value="${hall.seatCols}">
									
								<input type="button" class="btn btn-success" value="座位安排"  id="qwe" onclick="refresh();"/>
							</div>
						</div>

					</div>
					
					<div class=" overflowhidden" id="seatDiv" style="">
						<input type="hidden" name="seats" id="seats" value="${hall.seats}"  class="form-control widthlonger">
						
						<!-- 座位 -->
						<div class="demo">
					   		<div id="seat-map">
								<div class="front">屏幕</div>					
							</div>
							<div class="booking-details">
								<p>排：<span id="rows">${hall.seatRows}</span></p>
								<p>位：<span id="cols">${hall.seatCols}</span></p>
								<p>座位数：<span id="counts">${hall.seatCount}</span></p>
								<p>删除座位：</p>
								<ul id="selected-seats"></ul>
								
								<input type="button" class="btn btn-success" value="保存"  onclick="saveSeats();"/>
								<input type="button" class="btn btn-success" value="预览"   onclick="lookSeats();"/>	
										
								<div id="legend"></div>
							</div>
							<div style="clear:both"></div>
					   </div>	
					   <!-- 座位 END-->

					</div>
					<div style="margin-left:20px;">
						<input type="submit" class="btn btn-primary" value="提交"/> 
						<input type="button" class="btn btn-default" value="返回"
							onclick="javascript:history.go(-1);" />
					</div>
					<div class="height20"></div>
					<div class="height10"></div>
				</form>

			</div>
			<!----bordermal end--->
		</div>
		<!--right-ctn end-->
		
		
	</div>
</body>
<script type="text/javascript">
var price = 80; //票价
var sc;
var date,row,col,seatCount;
var $cart,$counter,total;
$(document).ready(function() {
	$cart = $('#selected-seats'), //座位区
	$counter = $('#counts'); //票数
// 	$total = $('#total'); //总计金额

	seatCount = $("#seatCount").val();
	seats = "${hall.seats}";
	date = new Array();
	date = seats.split(",");// 在每个逗号(,)处进行分解。
	initchart(date)
});
function initchart(date){
	var sc = $('#seat-map').seatCharts({
		map:date,
		naming : {//设置行列等信息  
			top : true,//显示头部
			getLabel : function (character, row, column) {//返回
				return column;
			},
		},
		legend : { //定义图例
			node : $('#legend'),
			items : [
				[ 'a', 'available',   '可选座' ],
				[ 'a', 'unavailable', '不显示']
			]					
		},
		click: function () { //点击事件
			if (this.status() == 'available') { //可选座
				$('<li>'+(this.settings.row+1)+'排'+this.settings.label+'座</li>')
					.attr('id', 'cart-item-'+this.settings.id)
					.data('seatId', this.settings.id)
					.appendTo($cart);
				seatCount--;
				$counter.text(seatCount);
				$("#seatCount").val(seatCount);
				//$total.text(recalculateTotal(sc)+price);
				
				updateDate(this.settings.row,this.settings.label,"_");
				
				return 'selected';
			} else if (this.status() == 'selected') { //已选中
					//更新数量
					seatCount++;
					$counter.text(seatCount);
					$("#seatCount").val(seatCount);
// 					$counter.text(sc.find('selected').length-1);
					//更新总计
// 					$total.text(recalculateTotal(sc)-price);
				
					//删除已预订座位
					$('#cart-item-'+this.settings.id).remove();
					
					updateDate(this.settings.row,this.settings.label,"a");
					//可选座
					return 'available';
			} else if (this.status() == 'unavailable') { //已售出
				return 'unavailable';
			} else {
				return this.style();
			}
		}
	});
	
}


function refresh(){
	
	//生成date
	date =  new Array();
	row = $("#seatRows").val();
	col = $("#seatCols").val();
	var cols = "";
	for(var i=0;i<col;i++){
		cols+="a";
	}
	for(var i=0;i<row;i++){
		date[i]=cols;
	}
	console.log(date);
	seatCount = row*col;
	$("#rows").html(row);
	$("#cols").html(col);
	$("#seatCount").val(seatCount);
	$("#counts").html(seatCount);
	$cart.html("");
	initchart(date);
	
	$("#seatDiv").show();
}
//计算总金额
function recalculateTotal(sc) {
	var total = 0;
	sc.find('selected').each(function () {
		total += price;
	});
			
	return total;
}

function updateDate(uRow,uCol,str){
	var cols = date[uRow];
	cols = cols.split('');  //将a字符串转换成数组
	cols.splice(uCol-1,1,str); //将uCol这个位置的字符，替换成'_'. 用的是原生js的splice方法。
	date[uRow] = cols.join('');
	
	console.log(cols.join(''));
}

function saveSeats(){
	$("#seats").val(date.join(","));
}
function lookSeats(){
	saveSeats();
	var seats = $("#seats").val();
	date = new Array();
	date = seats.split(",");// 在每个逗号(,)处进行分解。
	initchart(date);
}

</script>
</html>
