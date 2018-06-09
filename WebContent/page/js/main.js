/*
 * 注册页面
 *register.jsp 
 */

//检查用户名输入
    function W_userName()
  {
    var score_userName = document.getElementById('userName').value;
    var ch1 = /[\u4e00-\u9fa5_a-zA-Z0-9_]{6,15}/
    if(score_userName == 0) 
    {
      document.getElementById('no1').style.visibility="visible";
    }else{
      document.getElementById('no1').style.visibility="hidden";
    }
    if(ch1.test(score_userName)==true){
      document.getElementById('N1').style.visibility="hidden";  
      hadoop();
    }else{
      document.getElementById('N1').style.visibility="visible"; 
      document.getElementById('message').style.visibility="hidden"; 
    }
  } 
  //用户名重复验证
    function hadoop(){
    	var userName = $("#userName").val();
        // 异步验证用户是否重复
            $.ajax({
                 type: "get",
                 url: "/DBC/user/findUserByUserName?userName="+userName,
           	    contentType:"application/json;charset=utf-8",
 				data:null,
 	   			dataType:"json",
                 success: function(data){
                     $("#message").html(data);
                     $("#message").css("visibility","visible");
                }
            });
        };
  //检查密码输入
  function W_userPwd()
  { 
    var score_userPwd = document.getElementById('userPwd').value;
    var ch2 = /\w{8,20}/; 
    if(score_userPwd == 0)
    {
      document.getElementById('no2').style.visibility="visible";
    }else{
      document.getElementById('no2').style.visibility="hidden";
    }
    if(ch2.test(score_userPwd)==true){
      document.getElementById('N2').style.visibility="hidden";      
    }else{
      document.getElementById('N2').style.visibility="visible";   
    }
  }
  //真实姓名验证
  function W_userRealName(){
    var score_userRealName = document.getElementById('userRealName').value;
    var ch3 = /[\u4e00-\u9fa5a-zA-Z]{1,20}/;
    if(score_userRealName == 0){
      document.getElementById('no3').style.visibility="visible";
    }else{
      document.getElementById('no3').style.visibility="hidden";
    }
    if(ch3.test(score_userRealName)==true){
      document.getElementById('N3').style.visibility="hidden";      
    }else{
      document.getElementById('N3').style.visibility="visible";   
    }
  }
  //手机验证
  function W_userMobile(){
    var score_userMobile = document.getElementById('userMobile').value;
    var ch6 = /[0-9]{11}/;
    if(score_userMobile == 0)
    {
      document.getElementById('no6').style.visibility="visible";
    }else{
      document.getElementById('no6').style.visibility="hidden";
    }
    if(ch6.test(score_userMobile)==true){
      document.getElementById('N6').style.visibility="hidden";      
    }else{
      document.getElementById('N6').style.visibility="visible";   
    }
  }
  //邮箱验证
  function W_userEmail(){
    var score_userEmail = document.getElementById('userEmail').value;
    var ch7 = /[a-zA-Z0-9_-]+@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)+/;
    if(score_userEmail == 0){
      document.getElementById('no7').style.visibility="visible";
    }else{
      document.getElementById('no7').style.visibility="hidden";
    }
    if(ch7.test(score_userEmail)==true){
      document.getElementById('N7').style.visibility="hidden";      
    }else{
      document.getElementById('N7').style.visibility="visible";   
    }
  }
   //年月日三级联动
   window.onload = function()
  {  
    strYYYY = document.form1.YYYY.outerHTML;  
    //* outerHTML包括整个标签
    strMM = document.form1.MM.outerHTML;  
    strDD = document.form1.DD.outerHTML;  
    MonHead = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];  
  //先给年下拉框赋内容  
    var y = new Date().getFullYear();  
    var str = strYYYY.substring(0, strYYYY.length-9); 
    //* 提取指定位置的字符串
    for (var i = (y-30); i < (y+30); i++) //以今年为准，前30年，后30年  
    {  
      str += "<option value='" + i + "'> " + i + "</option>\r\n";  
    }  
    document.form1.YYYY.outerHTML = str +"</select>";  
  //赋月份的下拉框  
    var str = strMM.substring(0, strMM.length - 9);  
    for (var i = 1; i < 13; i++)  
    {  
      str += "<option value='" + i + "'> " + i + "</option>\r\n";  
    }  
    document.form1.MM.outerHTML = str +"</select>";  
    document.form1.YYYY.value = y;  
    document.form1.MM.value = new Date().getMonth() + 1;  
    var n = MonHead[new Date().getMonth()];  
    if (new Date().getMonth() ==1 && IsPinYear(YYYYvalue)) n++;  
    writeDay(n); //赋日期下拉框  
    document.form1.DD.value = new Date().getDate();  
  } 
  //年发生变化时日期发生变化(主要是判断闰平年) 
  function YYYYMM(str)  
  {   
    var MMvalue = document.form1.MM.options[document.form1.MM.selectedIndex].value;  
    if (MMvalue == ""){DD.outerHTML = strDD; return;}  
    var n = MonHead[MMvalue - 1];  
    if (MMvalue ==2 && IsPinYear(str)) n++;  
    writeDay(n)  
  }
  //月发生变化时日期联动   
  function MMDD(str)  
  {  
    var YYYYvalue = document.form1.YYYY.options[document.form1.YYYY.selectedIndex].value;  
    if (str == ""){DD.outerHTML = strDD; return;}  
    var n = MonHead[str - 1];  
    if (str ==2 && IsPinYear(YYYYvalue)) n++;  
    writeDay(n)  
  }  
  //据条件写日期的下拉框
  function writeDay(n)   
  {  
    var s = strDD.substring(0, strDD.length - 9);  
    for (var i=1; i<(n+1); i++)  
    s += "<option value='" + i + "'> " + i + "</option>\r\n";  
    document.form1.DD.outerHTML = s +"</select>";  
  } 
  //判断是否闰平年 
  function IsPinYear(year) 
  { 
    return(0 == year%4 && (year%100 !=0 || year%400 == 0))
  }  
  //返回YYYY-MM-DD
  function YMD(){
    var indexY = document.form1.YYYY.selectedIndex;
    var indexM = document.form1.MM.selectedIndex;
    var indexD = document.form1.DD.selectedIndex;
    var Y = document.form1.YYYY.options[indexY].text;
    var M = document.form1.MM.options[indexM].text;
    var D = document.form1.DD.options[indexD].text;
    var YMD = Y+"-"+M+"-"+D;
    document.getElementById("userBirthday").value = YMD;
    //获取当前日期
    var date = new Date();
    var seperator1 = "-";
    //var seperator2 = ":";
    var month = date.getMonth() + 1;
    var strDate = date.getDate();
    if (month >= 1 && month <= 9) {
        month = "0" + month;
    }
    if (strDate >= 0 && strDate <= 9) {
        strDate = "0" + strDate;
    }
    var currentdate = date.getFullYear() + seperator1 + month + seperator1 + strDate;
    document.getElementById("userCreatTime").value = currentdate;
  }
  

  //提交前验证
  function check(){
	 YMD();
	//性别验证
    var userSelected = 0;
	var userSex = document.getElementsByName("userSex");
    for(var i=0;i<userSex.length;i++){
    	if(userSex[i].checked==true){
    		var userSelected = userSelected +1;
    	}    
    }
    if(userSelected == 0){
    	document.getElementById('no4').style.visibility="visible";
    }else{
     	document.getElementById('no4').style.visibility="hidden";
	}
	//错误验证   
	var tsNum = document.getElementsByName("tishi");
	var  errorSum = 0;
	for(var i=0;i<tsNum.length;i++){
		var tsID = tsNum[i].id; 
		if(document.getElementById(tsID).style.visibility =="visible"
			  &&document.getElementById(tsID).style.visibility =="visible"){
		  var  errorSum = errorSum + 1;
		}	  
	}
	if(errorSum == 0){
		document.getElementById('form').action = "save-user";
	}else{
		document.getElementById('form').action = "input-user";
	}
  }
