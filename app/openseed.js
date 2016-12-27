function get_recipes() {

    var http = new XMLHttpRequest();
    //var url = "http://openseed.vagueentertainment.com/corescripts/auth.php?devid=" + devId + "&appid=" + appId + "&username="+ name + "&email=" + email ;
    var url = "http://openseed.vagueentertainment.com/devs/Vag-01001011/vagTend-1109/scripts/sync.php";
   // console.log(url)
    http.onreadystatechange = function() {
        if (http.readyState == 4) {
            //console.log(http.responseText);
            //userid = http.responseText;
            if(http.responseText == 100) {
                console.log("Incorrect DevID");
            } else if(http.responseText == 101) {
                console.log("Incorrect AppID");
            } else {
               // console.log(http.responseText);
                //id = http.responseText;
                //uniquename = http.responseText;
                var rec = http.responseText.split(">!<");
                var num = 1;
                while(rec.length > num) {
                    add_recipe(rec[num].split("><")[0],rec[num].split("><")[1],rec[num].split("><")[2],rec[num].split("><")[3],rec[num].split("><")[4],rec[num].split("><")[5],rec[num].split("><")[6]);
                num = num + 1;
                }

            }

        }
    }
    http.open('POST', url.trim(), true);
    //http.send(null);
    http.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    http.send("devid=" + devId + "&appid=" + appId +"&task=Drinks");

}

function send_recipe(dname,step1,step2,step3,step4,step5,author) {

    var http = new XMLHttpRequest();
    //var url = "http://openseed.vagueentertainment.com/corescripts/auth.php?devid=" + devId + "&appid=" + appId + "&username="+ name + "&email=" + email ;
    var url = "http://openseed.vagueentertainment.com/devs/Vag-01001011/vagTend-1109/scripts/sync.php";
   // console.log(url)
    http.onreadystatechange = function() {
        if (http.readyState == 4) {
            //console.log(http.responseText);
            //userid = http.responseText;
            if(http.responseText == 100) {
                console.log("Incorrect DevID");
            } else if(http.responseText == 101) {
                console.log("Incorrect AppID");
            } else {
                console.log(http.responseText);
                //id = http.responseText;
                //uniquename = http.responseText;

            }

        }
    }
    http.open('POST', url.trim(), true);
    //http.send(null);
    http.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    http.send("devid=" + devId + "&appid=" + appId +"&task=Send"+"&dname="+dname+"&step1="+step1+"&step2="+step2+"&step3="+step3+"&step4="+step4+"&step5="+step5+"&author="+author);



}


function add_recipe(name,step1,step2,step3,step4,step5,author) {


    var testStr = "SELECT  *  FROM RECIPE WHERE name ='"+name+"'";

    var data = [name,step1,step2,step3,step4,step5,author];
    var insert = "INSERT INTO RECIPE VALUES(?,?,?,?,?,?,?)";

    db.transaction(function(tx) {


         var test = tx.executeSql(testStr);

        if(test.rows.length == 0) {

            tx.executeSql(insert,data);
        }


    });


}
