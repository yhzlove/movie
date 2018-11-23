// JScript File

//去左空格; 
function Ltrim(s)
{ 
    return s.replace( /^\s*/, ""); 
} 

//去右空格; 
function Rtrim(s)
{ 
    return s.replace( /\s*$/, ""); 
} 

//去左右空格; 
function Trim(s)
{ 
    return Rtrim(Ltrim(s)); 
}



var bCheck ;
var blCheck;
var strMessage = "";        // 用于储存Alert讯息
var strFields  = "";        // 用于获得焦点字段的字段名称

var strCount   = "0";       // 用语控制三字段日期不Alert重复信息

/// <summery> 提交字段检查数据 _u47 ?summery>
/// function checkdata(Fields,FieldsName,CheckType,Length,IsEmpty)的参数说明

/// Fields:     需验证字段的name属性值

/// FieldsName: 需字段的中文名称

/// CheckType:  验证类型:
///             "integer":整型   "dropdownlist":下拉选单   "radio":单选框   "listbox":下拉列表   
///             "date":日期"   numericletter":英数字型   "letter":英文字型   "decimal:十进制型"
///             "float"　浮点数   "rate":百分比
///              "phonenumber"电话号码　email-> Email qq ->QQ号码 id->身份证
///              "netaddress" -->网址　post-->中国邮编

///             "text":文字+符号(varchar)   "ntext":文字+符号(nvarchar) 
///             "notchinese":验证不能是中文类型

/// Length:     字段长度(MaxLength)
/// IsEmpty:    是否允许为空(true 表示允许为空;false 表示不允许为空)
function checkdata(Fields,FieldsName,CheckType,Length,IsEmpty)
{  //debugger;  
    bCheck = true;
	blCheck = true;
	strMessage = "";

	var fields      = Fields.split(";");        // 字段的name属性值

	var fieldsname  = FieldsName.split(";");    // 字段的中文名称

	var checktype   = CheckType.split(";");     // 字段的验证类型

	var length      = Length.split(";");        // 字段的验证长度

	var isempty     = IsEmpty.split(";");       // 字段是否允许为空
	
	for(var j=1;j<6;j++)
	{
//	    if(!blCheck)
//	    {
//	        break;
//	    }
	    
	    switch(j)
		{
		    // 是否为空检查

		    case 1:                     
		        for(var i=0;i<fields.length;i++)
				{
//				    if(!blCheck)
//				    {
//				        break;
//				    }
				    
                    var name = document.getElementsByName(fields[i]);
					if(isempty[i] == 'false')
					{
					    switch(checktype[i])
					    {
					        case "radio":
					            // 验证单选框不可为空

					            CheckEmptyRadio(fields[i],fieldsname[i]);
					            break;
					        case "dropdownlist":
					            // 验证下拉选单不可为空
					            CheckEmptyDropdownList(fields[i],fieldsname[i]);   
					            break;
					        case "listbox":
					            // 验证下拉列表不可为空
					            CheckEmptyListBox(fields[i],fieldsname[i]);   
					            break;
					        default:
					            // 验证输入内容不可为空
					        	//alert(fieldsname[i]+fields[i])
					            CheckEmpty(fields[i],fieldsname[i]);                
					            break;
					    } 
						
					}
					
				}   // end for i
				
				break;
				
			// 数据类型检查

		    case 2: 
		        for(var i=0;i<fields.length;i++)
				{
//				    if(!blCheck)
//				    {
//				        break;
//				    }
				    
                    var name = document.getElementsByName(fields[i]);
					if(name[0].value != "")
					{
					    switch(checktype[i])
					    {
					        case "letter":
					            // 验证英文字型 
					            CheckLetter(fields[i],fieldsname[i]);
					            break;
					        case "numericletter":
					            // 验证英数字型
					            CheckLetterNumeric(fields[i],fieldsname[i]);
					            break;
				            case "phonenumber":
				                //验证电话号码
					            CheckPhoneNumber(fields[i],fieldsname[i]);
					            break;
					        case "date":
					            // 验证日期"YYYY/MM/DD"
					            CheckDate(fields[i],fieldsname[i]);
					            break;
					        case "integer":
					            // 验证整型
					            CheckInteger(fields[i],fieldsname[i]);
					            break;
					        case "float":
					            // 验证浮点数
					            CheckFloatNumber(fields[i],fieldsname[i]);
					            break;					     
					        case "rate":
					            // 验证百分比

					            CheckRate(fields[i],fieldsname[i]);
					            break;
					        case "notchinese":
					            // 验证不能是中文类型
					            CheckNotChinese(fields[i],fieldsname[i]);
					            break;    
					        case "email":
					             CheckEmail(fields[i],fieldsname[i]);
					            break;    
				            case "qq":
					             CheckQQ(fields[i],fieldsname[i]);
					            break;    
				            case "id":
					             CheckID(fields[i],fieldsname[i]);
					            break;    
					        case "netaddress":
					             CheckNetAddress(fields[i],fieldsname[i]);
					            break;    
					        case "post":
					             CheckPost(fields[i],fieldsname[i]);
					            break;   
					        case "decimal":
					               CheckDecimalNumber(fields[i],fieldsname[i]);  
					            break; 
					        case "logname":
					            CheckRightName(fields[i],fieldsname[i]);
					            break;
					        default:
					    } 
						
					}
					
				}   // end for i                    
		    
		        break;
		        
		    // 长度检查    
		    case 3: 
		        for(var i=0;i<fields.length;i++)
				{
//				    if(!blCheck) 
//				    {
//				        break;
//				    }
				    
                    var name = document.getElementsByName(fields[i]);
					if(name[0].value != "")
					{
					    switch(checktype[i])
					    {
					        case "text":
					        case "letter":
					        case "numericletter":
					        case "notchinese":
                                CheckLength(length[i],fields[i],fieldsname[i])
                                break;
                            case "ntext":
                                CheckLength1(length[i],fields[i],fieldsname[i])
                                break;
					        default:
					        	  CheckLength(length[i],fields[i],fieldsname[i])
					            break;
					    } 
					}
					
				}   // end for i                     
		    
		        break;
		    
		}   // end switch j
		
	}   // end for j
	
	if(!blCheck && strMessage != "")
	{
	    strMessage = strMessage.replace(/\!!/g, "!\n");
	    
	    alert(strMessage);
	    strMessage="";
	    
	   
	    
	}
	
	return blCheck;
}


// 检查是否为空

function CheckEmpty(Fields,FieldsName)
{

	var name = document.getElementsByName(Fields);

	var nameLength = Trim(name[0].value).length;        // 去掉字符串首未的空格
	var reg1=/\s+/;
 	var reg2=/[\u3000]/;
 	var value;
 	if(reg1.test(name[0].value)){
 	 //alert('有半角空格');
 	}
 	if(reg2.test(name[0].value)){
 	// alert('有全角空格');
	value=name[0].value
	nameLength = Trim(value.replace(/[\u3000]/g,'')).length;
 	}
	if (nameLength <= 0)
	{
		blCheck = false;
		if (strMessage == "")
		{
			strFields = Fields;
		}
		
		strMessage += FieldsName + "不可为空!!";
		
	}
}


// 验证ListBox是否没有选择
function CheckEmptyListBox(Fields,FieldsName)
{
    var name = document.getElementsByName(Fields);

    var nameLength = name[0].options.length;
	    alert(nameLength+"namlength")
    if (nameLength <= 0)
	{	
		blCheck = false;
		if (strMessage == "")
		{
			strFields = Fields;
		}
		
		strMessage += "请选择" + FieldsName + "!!";
	}
}


// 检查DropdownList是否没有选择 
function CheckEmptyDropdownList(Fields,FieldsName)
{
	if (document.getElementsByName(Fields)[0].value == "")
	{	
		blCheck = false;
		if (strMessage == "")
		{
			strFields = Fields;
		}
		
		strMessage += "请选择" + FieldsName + "!!";
	}
}


// 检查RadioButtonList是否没有选择
function CheckEmptyRadio(Fields,FieldsName)
{
    bCheck = false;
    var fieldRadio = document.getElementsByName(Fields);
    
    for(var i=1;i<fieldRadio.length;i++)
	{ 
	    if(fieldRadio[i].checked)
	    {
	        bCheck = true;
	    }
	}
	
	if (bCheck == false)
	{
	    blCheck = false;
	    if (strMessage == "")
		{
			strFields = Fields;
		}
		
	    strMessage += "请选择" + FieldsName + "!!";
	}
}


// 验证英文字格式

function CheckLetter(Fields,FieldsName)
{
    var bCheck = true;
	var sRegularExp = /^[a-z]+$/i;
	bCheck = sRegularExp.test(Trim(document.getElementsByName(Fields)[0].value));
	
	if (bCheck == false)
	{
		blCheck = false;
		if (strMessage == "")
		{
			strFields = Fields;
		}
		
		strMessage += FieldsName + "只能输入英文!!";
	}
}


// 验证英数字格式

function CheckLetterNumeric(Fields,FieldsName)
{
    var bCheck = true;
	var sRegularExp = /^[A-Z0-9]+$/i;
	bCheck = sRegularExp.test(Trim(document.getElementsByName(Fields)[0].value));
	
	if (bCheck == false)
	{
		blCheck = false;
		if (strMessage == "")
		{
			strFields = Fields;
		}
		
		strMessage += FieldsName + "只能输入英文及数字!!";
	}
}


// 验证电话号码
function CheckPhoneNumber(Fields,FieldsName)
{
    var bCheck = true;
    var phoneNumberWithoutSpace = Trim(document.getElementsByName(Fields)[0].value);
    if( phoneNumberWithoutSpace.length < 1) 
    {
        return ;
    } 
    
	var sRegular= /^[0-9-]{0,12}$/i;
	
	bCheck = sRegular.test(phoneNumberWithoutSpace)  ;
		
	if (bCheck == false)
	{
		blCheck = false;
		if (strMessage == "")
		{
			strFields = Fields;
		}
		
		
		strMessage += FieldsName + "只能输入数字和-\n ";
	}
}

// 验证Email
function CheckEmail(Fields,FieldsName)
{
    var bCheck = true;
     var valueWithoutSpace = Trim(document.getElementsByName(Fields)[0].value);
      if( valueWithoutSpace.length < 1) 
    {
        return ;
    }
	var sRegularExp = /\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*/i;
	bCheck = sRegularExp.test(valueWithoutSpace);
	
	if (bCheck == false)
	{
		blCheck = false;
		if (strMessage == "")
		{
			strFields = Fields;
		}
		
		strMessage += FieldsName + "输入格式不正确！\n正确输入，如：test@163.com\n";
	}
}



//验证QQ  http(s)?://([\w-]+\.)+[\w-]+(/[\w- ./?%&=]*)?
function CheckQQ(Fields,FieldsName)
{
   

    var bCheck = true;
     var valueWithoutSpace = Trim(document.getElementsByName(Fields)[0].value);
      if( valueWithoutSpace.length < 1) 
    {
        return ;
    }
	var sRegularExp = /[1-9][0-9]{4,}/i;
	bCheck = sRegularExp.test(valueWithoutSpace);
	
	if (bCheck == false)
	{
		blCheck = false;
		if (strMessage == "")
		{
			strFields = Fields;
		}
		
		strMessage += FieldsName + "输入格式不正确！\n正确输入，如：123456789\n";
	}
}


//验证网址
function CheckNetAddress(Fields,FieldsName)
{
    var bCheck = true;
      var valueWithoutSpace = Trim(document.getElementsByName(Fields)[0].value);
       if( valueWithoutSpace.length < 1) 
    {
        return ;
    }
	var sRegularExp = new RegExp('[a-zA-z]+://[^"s]*');
	bCheck = sRegularExp.test(valueWithoutSpace);
	
	if (bCheck == false)
	{
		blCheck = false;
		if (strMessage == "")
		{
			strFields = Fields;
		}
		
		strMessage += FieldsName + "输入格式不正确！\n正确输入，如：http://www.wat.cn\n";
	}
}

//验证邮编
function CheckPost(Fields,FieldsName)
{
    var bCheck = true;
	var sRegularExp = /\d{6}/i;
	  var valueWithoutSpace = Trim(document.getElementsByName(Fields)[0].value);
	   if( valueWithoutSpace.length < 1) 
    {
        return ;
    }
	bCheck = sRegularExp.test(valueWithoutSpace);
	
	if (bCheck == false)
	{
		blCheck = false;
		if (strMessage == "")
		{
			strFields = Fields;
		}
		
		strMessage += FieldsName + "输入格式不正确！\n正确输入，如：256200";
	}
}



// 验证身份证
function CheckID(Fields,FieldsName)
{
    var bCheck = true;
	var sRegularExp = /  (^\d{15}$)|(\d{17}(?:\d|x|X)$)/i;
	  var valueWithoutSpace = Trim(document.getElementsByName(Fields)[0].value);
	   if( valueWithoutSpace.length < 1) 
    {
        return ;
    }
	bCheck = sRegularExp.test(valueWithoutSpace);
	
	if (bCheck == false)
	{
		blCheck = false;
		if (strMessage == "")
		{
			strFields = Fields;
		}
		
		strMessage += FieldsName + "输入格式不正确！\n正确输入为15或18位数字 ，\n输入18位时末位可为X。";
	}
}





// 验证日期"YYYY/MM/DD"
function CheckDate(Fields,FieldsName)
{
    var bCheck = true;
    var sValue = document.getElementsByName(Fields)[0].value;
    var sRegularExp = /^(\d+)-(\d{1,2})-(\d{1,2})$/;     
    var regDate = sValue.match(sRegularExp);   
      
    if(regDate == null)
	    bCheck = false; 
	else
	{
        regDate[2] = regDate[2]-1;     
        var date= new Date(regDate[1],regDate[2],regDate[3]); 
            
        if(date.getFullYear()!=regDate[1])
	        bCheck = false; 	   
        else if(date.getMonth()!=regDate[2])
	        bCheck = false;      
        else if(date.getDate()!=regDate[3])
	        bCheck = false;  	
	}

    if (bCheck == false)
	{
		blCheck = false; 
		if (strMessage == "")
		{
			strFields = Fields;
		}
		
		strMessage += FieldsName + "日期格式不正确,请按【YYYY-MM-DD】格式重新输入!!";
	}
}

//验证是否是整数值,可以是正数或负数,可以是0开头的数字
function CheckInteger(Fields,FieldsName)
{
    var bCheck = true;
	var sRegularExp = /^[+_\-]?[1-9][0-9]+$|^[+_\-]?[0-9]$/;
	
	bCheck = sRegularExp.test(Trim(document.getElementsByName(Fields)[0].value));
	
	if (bCheck == false)
	{
		blCheck = false;
		if (strMessage == "")
		{
			strFields = Fields;
		}
		
		strMessage += FieldsName + "只能输入整数!!";
	}	
}


//验证是否是浮点数,可以是正数或负数
function CheckFloatNumber(Fields,FieldsName)
{
    var bCheck = true;
	var sRegularExp = /^(-?\d+)(\.\d+)?$/;
	
	bCheck = sRegularExp.test(Trim(document.getElementsByName(Fields)[0].value));
	
	if (bCheck == false)
	{
		blCheck = false;
		if (strMessage == "")
		{
			strFields = Fields;
		}
		
		strMessage += FieldsName + "只能输入浮点数!!";
	}	
}

//验证是否是Decimal类型
function CheckDecimalNumber(Fields,FieldsName)
{
    var bCheck = true;
    var sRegularExp = /^(\d|,)*\.?\d*$/;
    bCheck = sRegularExp.test(Trim(document.getElementsByName(Fields)[0].value));
	
	if (bCheck == false)
	{
		blCheck = false;
		if (strMessage == "")
		{
			strFields = Fields;
		}
		
		strMessage += FieldsName + "只能输入十进制数!!";
	}	
}

//验证为字母数字下滑线
function CheckRightName(Fields,FieldsName)
{
    var bCheck = true;
    var sRegularExp = /^\w+$/;
    bCheck = sRegularExp.test(Trim(document.getElementsByName(Fields)[0].value));
	
	if (bCheck == false)
	{
		blCheck = false;
		if (strMessage == "")
		{
			strFields = Fields;
		}
		
		strMessage += FieldsName + "只能是字母数字下划线组成!";
	}	
}

// 验证百分比,不可超过100
function CheckRate(Fields,FieldsName)	
{
    var strValue = document.getElementsByName(Fields)[0].value;
    
    if (!(/^\d+$/.test(strValue)))	    // 需为数字


    {
        blCheck = false;
        if (strMessage == "")
		{
			strFields = Fields;
		}
		
	    strMessage += FieldsName + "请输入数字!!";
    }
    else if (strValue > 100)
    {
        blCheck = false;
        if (strMessage == "")
		{
			strFields = Fields;
		}
		
        strMessage += FieldsName + "不可超过100!!";
    }
}	

// 检查长度---DB字段类型 char,varchar
function CheckLength(Length,Fields,FieldsName)
{
	var name = document.getElementsByName(Fields);
	var psValue = name[0].value;
	Length = parseInt(Length,10);

	var sCheckString = new String(psValue);
	var iCharCounter = 0;
	
	for (var i=0; i<sCheckString.length; i++)
	{
	    // 如果为中文的话一个中文按两位计算
		if (sCheckString.charCodeAt(i) > 255)
		{
			iCharCounter += 2;
		}
		else
		{
			iCharCounter++;
		}
	}	

	if (iCharCounter > Length)
	{
		blCheck = false;
		if (strMessage == "")
		{
			strFields = Fields;
		}
			
		strMessage += FieldsName + "最多只能输入"+Length+"个字符,请确认后重新输入!!";
	}
}	 

// 检查长度---DB字段类型 nchar, nvarchar
function CheckLength1(Length,Fields,FieldsName)
{
	var name = document.getElementsByName(Fields);
	var psValue = name[0].value;
	Length = parseInt(Length,10);
	
	var sCheckString = new String(psValue);
	var iCharCounter = sCheckString.length;
				
	if (iCharCounter > Length)
	{
		blCheck = false;
		if (strMessage == "")
		{
			strFields = Fields;
		}
		
		strMessage += FieldsName + "最多只能输入"+Length+"个字符,请确认后重新输入!!";
	}
}      

//验证不能是中文类型

function CheckNotChinese(Fields,FieldsName)
{
	var strValue;
	strValue = Trim(document.getElementsByName(Fields)[0].value);
	
	if((strValue.replace(/[\u4e00-\u9fa5]/g,"")).length != strValue.length)
	{
	    blCheck = false;
		if (strMessage == "")
		{
			strFields = Fields;
		}
		
		strMessage += FieldsName + "只能输入英文、数字及'_' 等符号!!";		
	}
}  

