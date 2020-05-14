var pageN=1,pageTotal=100;

$(function(){
    $('#login_form').keydown(function (e){
        if(e.keyCode == 13)
        {
            checkUserName();
        }
    })
    $("#login_submit").click(checkUserName);
    $.ajax({
        url:"./news/getCount",
        type:"post",
        success:function(res){
           pageTotal=parseInt(res);
           listNews(1,10);
           loadPager();
        },
        error:function(res){
            $.messager.alert("系统提示","系统错误！","error");
            }
    });
    $("#llogin").hide();
    $("#a").click(function(){
        $("#llogin").show();
        $("#lnews").hide();
    });
    $("#b").click(function(){
        $("#llogin").hide();
        $("#lnews").show();
    });
});

function listNews(pageNumber,pageSize){
    $.ajax({
        url:"./news/listNews",
        data:{"page":pageNumber,"rows":pageSize},
        type:"POST",
        success:function(res){
            $(".inews").remove();//res=JSON.parse(res);
            if(res.total <= 0){
                var tr="<tr class = 'inews' height = \"25\"><td >";
                    tr+="<div class='t'>暂无相关新闻</div>";
                    tr+="</td><td width='1%' nowrap=''><span>&nbsp;</span></td></tr>";
                $("#trpp").before(tr);
            }
            else{
                pageN = pageNumber;
                pageTotal = res.total;
                var rows = res.rows;
                for (var i = 0; i < rows.length;) {
                    var row = rows[i];
                    var tr = "<tr class = 'inews' height =\"25\"><td >";
                    tr+="<div class='t'><a href='./news/getaNews?id="+row.id+"' target='_blank' title="+row.title+"'>"+row.title+"</a></div>";
                    tr+="</td><td width='1%'nowrap=''><span>"+row.tjdata+"&nbsp;</span></td></tr>";
                $("#trpp").before(tr);
                i++;
                if(i%5==0){
                    tr="<tr class='inews'height='1'><td colspan='2'align='center'>";
                    tr+="<hr style='border-style:dashed;border-color:#999999;width:99%;height:1px;border-width:1px 0px 0px 0px;visibility:inherit'></td></tr>";
                    $("#trpp").before(tr);
                }
                }
            }
        },
        error:function(res){
            $.messager.alert("系统提示","系统错误-listNews","error");
            }
    })
}

function loadPager(){
    $('#pp').pagination({
        total:pageTotal,
        pageSize:10,
        pageNumber:pageN,
        displayMsg:'{from}/{to}共{total}条',
        onSelectPage:function(pageNumber,pageSize){
            listNews(pageNumber,pageSize);
        }
    });
}

function checkUserName()
{
    var a = $('#uid').val();
    var b = $('#pwd').val();
    if(a == ""){
        $.messager.alert("提示","请输入用户名！","warning");
        return;
    }
    if(b == ""){
        $.messager.alert("提示","请输入登录密码！","warning");
        return;
    }
    $.ajax({
        url:base+"user/doLogin",//不确定base路径是不是声明了
        data:{"uid":a,"pwd":b},
        type:"post",
        success:function(res){
            if(res.ok){
                window.location.href=base+res.msg;
            }else{
            	$.messager.alert("提示",res.msg,"warning");
            	}
            return false;
        },
        error:function(res){
            $.messager.alert("测试","系统错误-res-error","error","warning");
            }
    });
}
/*
$(function(){
	airBalloon('div.air-balloon');
	alert("系统提示：air-balloon运行结束");

});

function airBalloon(balloon){
    var viewSize = [],viewWidth = 0, viewHeight = 0;
    resize();
    $(balloon).each(function(){
        $(this).css({top:rand(40,viewHeight*50),left:rand(10,viewWidth-$(this).width())});
        fly(this);
    });
    $(window).resize(function(){
        resize();
        $(balloon).each(function(){
            $(this).stop().animate({top:rand(40,viewHeight*50),left:rand(10,viewWidth-$(this).width())},1000,function(){
                fly(this);
            });
        });
    });
    function resize(){
        viewSize = getViewSize();
        viewWidth = $(document).width();
        viewHeight = viewSize[1];
    }
    function fly(obj){
        var $obj = $(obj);
        var currentTop = parseInt($obj.css('top'));
        var currentLeft = parseInt($obj.css('left'));
        var targetLeft = rand(10,viewWidth-$obj.width());
        var targetTop = rand(40, viewHeight/2);
        var removing = Math.sqrt(Math.pow(targetLeft - currentLeft,2)+Math.pow(targetTop - currentTop,2));
        var moveTime =　removing/24;
        $obj.animate({top : targetTop,left: targetLeft},moveTime*1000,function(){
            setTimeout(function(){
                fly(obj);
            },rand(1000,3000));
        });
    }
    function rand(mi,ma){
        var rang = ma - mi;
        var out = mi+Math.round(Math.random()*range);
        return parseInt(out);
    }
    function getViewSize(){
        var de = document.documentElement;
        var db = document.body;
        var viewW = de.clientWidth == 0?db.clientWidth : de.clientWidth;
        var viewH = de.clientHeight == 0?db.clientHeight : de.clientHeight;
        return Array(viewW,viewH);
    }
}
*/