function firstload() {

    var testStr = "SELECT  *  FROM USER WHERE 1";
    var eulaStr = "SELECT * FROM announcements WHERE type = 0"

        db.transaction(function(tx) {

            tx.executeSql('CREATE TABLE IF NOT EXISTS USER (id TEXT, name TEXT)');
            tx.executeSql('CREATE TABLE IF NOT EXISTS SETTINGS (share INT)');
            tx.executeSql('CREATE TABLE IF NOT EXISTS GEAR (name TEXT,ounces DOUBLE,opened INT,type TEXT)');
            tx.executeSql('CREATE TABLE IF NOT EXISTS RECIPE (name TEXT,step1 TEXT,step2 TEXT,step3 TEXT,step4 TEXT,step5 TEXT, author TEXT)');
            tx.executeSql('CREATE TABLE IF NOT EXISTS STUFF (name TEXT,type INT)');


             var pull =  tx.executeSql(testStr);

             var drinks = "Amaretto,Absinthe,Beer,Benedictine,Bourbon,Brandy,Brandy(Apricot),Brandy(BlackBerry),Brandy(Cherry),\
Champagne,Chartreuse,Cognac,Curacao,Curacao(Blue),Curacao(Triple Sec),Drambuie,Dubonnet,Galliano,Gin,Gin(Citrus),Gin(lime),Gin(Orange),Gin(Sloe),Grain Alcohol,\
Liqueur,Liqueur(Banana),Liqueur(Black Raspberry),Liqueur(Coffee),Liqueur(HazelNut),Liqueur(Melon),Liqueur(Orange),Liqueur(Strawberry),Irish Cream,Irish Mist,\
Jagermeister,Moonshine,Rum,Rum(Amber),Rum(Banana),Rum(Cherry),Rum(Citrus),Rum(Coconut),Rum(Dark),Rum(Light),Rum(Mango),Rum(1st-Proof),Rum(Orange),\
Rum(Pineapple),Rum(Raspberry),Rum(Spiced),Rum(Vanilla),Sambuca,Sambuca(Black),\
Scotch,Schnapps,Schnapps(Butterscotch),Schnapps(Cinnamon),Schnapps(Mentholated),Schnapps(Peach),Schnapps(Peppermint),Schnapps(Mentholated),\
Schnapps(Root Beer),Tuaca,Tequila,Vandermint,Vodka,Vodka(Apple),Vodka(Chocolate),Vodka(Cinnamon),Vodka(Citrus),Vodka(Coconut),Vodka(Coffee),Vodka(Cranberry),Vodka(Currant),\
Vodka(Grapefruit),Vodka(Lemon),Vodka(Lime),Vodka(Mint),Vodka(Orange),Vodka(Peach),Vodka(Peppermint),Vodka(Peppered),Vodka(Pineapple),Vodka(Raspberry),Vodka(Strawberry),Vodka(Vanilla),\
Wine,Wine(Red),Wine(White),Yukon Jack,Wiskey,Wiskey(Irish),Wiskey(Southern Comfort)";
             var equipments = "Bronze Mug,Coffee Mug,Mixing Glass,Shot Glass,Short Glass,Short Glass(Frosted),Serving Glass,Short Glass(Chilled),Stir Rod,Strainer,Tall Glass,Tall Glass(Frosted),Tall Glass(Chilled),\
Parfait Glass(Short),Parfait Glass(Tall),Tumbler";
             var addins = "Bitters,Bitters(Orange),Coca-Cola,Coffee,Cream,Cream of Coconut,Creme de Cassis,Creme de Cacao, Creme de Menthe,Energy Drink,\
Ginger Ale,Ginger Beer,Grenadine,Hot Chocolate,Ice,Ice Cream,Milk,Juice,Juice(Apple),Juice(Cranberry),Juice(Orange),Juice(Raspberry),Juice(Grape),Juice(Grapefruit),Juice(Lemon),Juice(Lime),Juice(Pineapple),\
Sour Mix,Sprite,Syrup (Sugar),Syrup(Almond),Syrup(Coffee),Syrup(Mint),Sparkling Water,Water,Blood of my Enemies";
            var garnish = "Asparagus(pickled),Bananas,Basil,Candy,Celery,Cherries,Chocolate Syrup,Cilantro,Cinnamon,Cocktail shrimp,Coffee Beans,Cucumber,Flowers,Green Beans(pickled),Lemons,Limes,Mint,Olives,Onions,Oranges,\
Pepperoncini,Pickles,Pinapple,Pumpkin Spice,Rosemary,Thyme,Salt(kosher),Shaved Almonds,Shaved Chocolate,Sprinkles,Strawberries,Tomolives,Twist,Whipped cream";
            var actions = "Garnish,Pour,Serve with,Shake,Squeeze,Fill,Stir,Strain in to,Equal parts,Top with";

            var dnum = 0;
            var eqnum = 0;
            var adnum = 0;
            var garnum = 0;
            var actnum = 0;




            while(drinks.split(",").length > dnum) {

                var drinkexists = "SELECT name FROM STUFF WHERE name ='"+drinks.split(",")[dnum]+"'";

                var data = [drinks.split(",")[dnum],0];
                var insert = "INSERT INTO STUFF VALUES(?,?)";

                var test = tx.executeSql(drinkexists);

               if(test.rows.length == 0) {

                 tx.executeSql(insert,data);

               }



                dnum = dnum + 1;

            }


            while(equipments.split(",").length > eqnum) {

                var drinkexists = "SELECT name FROM STUFF WHERE name ='"+equipments.split(",")[eqnum]+"'";

                var data = [equipments.split(",")[eqnum],1];
                var insert = "INSERT INTO STUFF VALUES(?,?)";

                var test = tx.executeSql(drinkexists);

               if(test.rows.length == 0) {

                 tx.executeSql(insert,data);

               }



                eqnum = eqnum + 1;

            }

            while(addins.split(",").length > adnum) {

                var drinkexists = "SELECT name FROM STUFF WHERE name ='"+addins.split(",")[adnum]+"'";

                var data = [addins.split(",")[adnum],2];
                var insert = "INSERT INTO STUFF VALUES(?,?)";

                var test = tx.executeSql(drinkexists);

               if(test.rows.length == 0) {

                 tx.executeSql(insert,data);

               }



                adnum = adnum + 1;

            }

            while(garnish.split(",").length > garnum) {

                var drinkexists = "SELECT name FROM STUFF WHERE name ='"+garnish.split(",")[garnum]+"'";

                var data = [garnish.split(",")[garnum],3];
                var insert = "INSERT INTO STUFF VALUES(?,?)";

                var test = tx.executeSql(drinkexists);

               if(test.rows.length == 0) {

                 tx.executeSql(insert,data);

               }



                garnum = garnum + 1;

            }

            while(actions.split(",").length > actnum) {

                var drinkexists = "SELECT name FROM STUFF WHERE name ='"+actions.split(",")[actnum]+"'";

                var data = [actions.split(",")[actnum],4];
                var insert = "INSERT INTO STUFF VALUES(?,?)";

                var test = tx.executeSql(drinkexists);

               if(test.rows.length == 0) {

                 tx.executeSql(insert,data);

               }



                actnum = actnum + 1;

            }



            var drinkpull = tx.executeSql("SELECT * FROM STUFF WHERE type = 0 ORDER BY name");

            for(var num = 0;num<drinkpull.rows.length;num++) {

                if(bases != "") {
                bases = bases+",d^"+drinkpull.rows.item(num).name;
                } else {
                  bases ="d^"+drinkpull.rows.item(num).name;

                }
            }

            var garnishpull = tx.executeSql("SELECT * FROM STUFF WHERE type = 3 ORDER BY name");

            for(var num = 0;num<garnishpull.rows.length;num++) {

                if(gar != "") {
                gar= gar+",g^"+garnishpull.rows.item(num).name;
                } else {
                  gar ="g^"+garnishpull.rows.item(num).name;

                }
            }

            var equippull = tx.executeSql("SELECT * FROM STUFF WHERE type = 1 ORDER BY name");

            for(var num = 0;num<equippull.rows.length;num++) {

                if(equipment != "") {
                equipment= equipment+",e^"+equippull.rows.item(num).name;
                } else {
                  equipment ="e^"+equippull.rows.item(num).name;

                }
            }

            var addpull = tx.executeSql("SELECT * FROM STUFF WHERE type = 2 ORDER BY name");

            for(var num = 0;num<addpull.rows.length;num++) {

                if(addtoos != "") {
                addtoos= addtoos+",a^"+addpull.rows.item(num).name;
                } else {
                  addtoos ="a^"+addpull.rows.item(num).name;

                }
            }

            var actpull = tx.executeSql("SELECT * FROM STUFF WHERE type = 4 ORDER BY name");

            for(var num = 0;num<actpull.rows.length;num++) {

                if(actons != "") {
                actons= actons+",act^"+actpull.rows.item(num).name;
                } else {
                  actons ="act^"+actpull.rows.item(num).name;

                }
            }



           /* if(pull.rows.length == 0) {
                os_connect.state = "Show";
            } else {
                id = pull.rows.item(0).id;
                username = pull.rows.item(0).name;
                pin = pull.rows.item(0).pin;
               /* if(pull.rows.item(0).pin != null) {
                        pin = pull.rows.item(0).pin;
                        userpin = pull.rows.item(0).pin;
                } else {
                    pin_entry.state = "Show";
                }

                //console.log(id,username);

                load_settings();
                heartbeats.running = true;
               // load_library(2,"");

                var checked = tx.executeSql(eulaStr);

                if(checked.rows.length != 0) {

                load_stream(" ",rate,searchstring);
                   // get_stream.running = true;
                    progress.visible = true;
                    progress.state = "midscreen";
                    info = "Please Wait";

                } else {
                    agreement.state = "Show";

                }
            } */

        });

}

function add_gear(name,ounces,opened,type) {


    var testStr = "SELECT  *  FROM GEAR WHERE name ='"+name+"'";

    var data = [name,ounces,opened,type];
    var insert = "INSERT INTO GEAR VALUES(?,?,?,?)";

    db.transaction(function(tx) {


         var test = tx.executeSql(testStr);

        if(test.rows.length == 0) {

            tx.executeSql(insert,data);
        }


    });


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

function load_gear(type) {

    var testStr = "SELECT  *  FROM GEAR WHERE type ='"+type+"'";

    var num = 0;

    switch(type) {
    case 30:equipmentlist.clear();break;
    case 40:extraslist.clear();break;
    //case 1:castslist.clear();break;
  //  case 2:castslist.clear();break;

    default:break;
    }
    console.log(type);

    db.transaction(function(tx) {


         var pull = tx.executeSql(testStr);

         while(pull.rows.length > num) {


             switch(type) {

             case 30:equipmentlist.append({
                                          name:pull.rows.item(num).name
                                       });break;


             case 40:extraslist.append({
                                          name:pull.rows.item(num).name
                                       });break;

             default:castslist.append({
                                          name:pull.rows.item(num).name
                                       }); break;
             }

            num = num + 1;
        }

    });

}

function load_base() {

    var testStr = "SELECT  *  FROM GEAR WHERE type NOT IN ('30','40','50')";

    var num = 0;


 castslist.clear();

   var castlist ="Absinthe,Beer,Burbon,Brandy,Champagne,Gin,Liqueur,Moonshine,Rum,Scotch,Tequila,Vodka,Wine,Wiskey"




    console.log(type);

    db.transaction(function(tx) {


         var pull = tx.executeSql(testStr);

         while(pull.rows.length > num) {


                if(num == 0 || pull.rows.item(num).type != pull.rows.item(num-1).type) {
                     castslist.append({
                                        name:castlist.split(",")[pull.rows.item(num).type -1],
                                        itemtype:"cast"

                                    });
                }

             castslist.append({
                               name:pull.rows.item(num).name,
                                  itemtype:"drink"
                                       });

            num = num + 1;
        }

    });

}

function load_recipes(search) {

var testStr = "SELECT  *  FROM RECIPE WHERE 1 ORDER BY name";

var num = 0;

    recipelist.clear();

db.transaction(function(tx) {


     var pull = tx.executeSql(testStr);

     while(pull.rows.length > num) {

         var pretty_step1 = pull.rows.item(num).step1.split(";").join("\n");
             pretty_step1 = pretty_step1.replace(/::1/g," 1 oz").replace(/::0.5/g," 0.5 oz").replace(/::1.5/g," 1.5 oz").replace(/::2/g," 2 oz").replace(/::2.5/g," 2.5 oz").replace(/::3/g," 3 oz").replace(/::3.5/g," 3.5 oz").replace(/::4/g," 4 oz")
             pretty_step1 = pretty_step1.replace(/::1.75/g," 1.75 oz").replace(/::0.75/g," 0.75 oz").replace(/::2.75/g," 2.75 oz").replace(/::3.75/g," 3.75 oz");
             pretty_step1 = pretty_step1.replace(/::Fill/g," [Fill]").replace(/::Dash/g," [Dash]").replace(/::Pinch/g," [Pinch]");

         var pretty_step2 = pull.rows.item(num).step2.split(";").join("\n");
             pretty_step2 = pretty_step2.replace(/::1/g," 1 oz").replace(/::0.5/g," 0.5 oz").replace(/::1.5/g," 1.5 oz").replace(/::2/g," 2 oz").replace(/::2.5/g," 2.5 oz").replace(/::3/g," 3 oz").replace(/::3.5/g," 3.5 oz").replace(/::4/g," 4 oz")
             pretty_step2 = pretty_step2.replace(/::1.75/g," 1.75 oz").replace(/::0.75/g," 0.75 oz").replace(/::2.75/g," 2.75 oz").replace(/::3.75/g," 3.75 oz");
             pretty_step2 = pretty_step2.replace(/::Fill/g," [Fill]").replace(/::Dash/g," [Dash]").replace(/::Pinch/g," [Pinch]");

         var pretty_step3 = pull.rows.item(num).step3.split(";").join("\n");
             pretty_step3 = pretty_step3.replace(/::1/g," 1 oz").replace(/::0.5/g," 0.5 oz").replace(/::1.5/g," 1.5 oz").replace(/::2/g," 2 oz").replace(/::2.5/g," 2.5 oz").replace(/::3/g," 3 oz").replace(/::3.5/g," 3.5 oz").replace(/::4/g," 4 oz")
             pretty_step3 = pretty_step3.replace(/::1.75/g," 1.75 oz").replace(/::0.75/g," 0.75 oz").replace(/::2.75/g," 2.75 oz").replace(/::3.75/g," 3.75 oz");
             pretty_step3 = pretty_step3.replace(/::Fill/g," [Fill]").replace(/::Dash/g," [Dash]").replace(/::Pinch/g," [Pinch]");

         var pretty_step4 = pull.rows.item(num).step4.split(";").join("\n");
             pretty_step4 = pretty_step4.replace(/::1/g," 1 oz").replace(/::0.5/g," 0.5 oz").replace(/::1.5/g," 1.5 oz").replace(/::2/g," 2 oz").replace(/::2.5/g," 2.5 oz").replace(/::3/g," 3 oz").replace(/::3.5/g," 3.5 oz").replace(/::4/g," 4 oz")
             pretty_step4 = pretty_step4.replace(/::1.75/g," 1.75 oz").replace(/::0.75/g," 0.75 oz").replace(/::2.75/g," 2.75 oz").replace(/::3.75/g," 3.75 oz");
             pretty_step4 = pretty_step4.replace(/::Fill/g," [Fill]").replace(/::Dash/g," [Dash]").replace(/::Pinch/g," [Pinch]");

         var pretty_step5 = pull.rows.item(num).step5.split(";").join("\n");
             pretty_step5 = pretty_step5.replace(/::1/g," 1 oz").replace(/::0.5/g," 0.5 oz").replace(/::1.5/g," 1.5 oz").replace(/::2/g," 2 oz").replace(/::2.5/g," 2.5 oz").replace(/::3/g," 3 oz").replace(/::3.5/g," 3.5 oz").replace(/::4/g," 4 oz")
             pretty_step5 = pretty_step5.replace(/::1.75/g," 1.75 oz").replace(/::0.75/g," 0.75 oz").replace(/::2.75/g," 2.75 oz").replace(/::3.75/g," 3.75 oz");
             pretty_step5 = pretty_step5.replace(/::Fill/g," [Fill]").replace(/::Dash/g," [Dash]").replace(/::Pinch/g," [Pinch]");

        var calced_precent = 0;

         var step1_search = pull.rows.item(num).step1;
         var step2_search = pull.rows.item(num).step2;
         var step3_search = pull.rows.item(num).step3;
         var step4_search = pull.rows.item(num).step4;
         var step5_search = pull.rows.item(num).step5;



         var s1_alc = step1_search.match(/;d/g);
         var s1_noalc = step1_search.match(/;a/g);
         var ins1 = 0;
         var s2_alc = step2_search.match(/;d/g);
         var s2_noalc = step2_search.match(/;a/g);
         var ins2 = 0;
         var s3_alc = step3_search.match(/;d/g);
         var s3_noalc = step3_search.match(/;a/g);
         var ins3 = 0;
         var s4_alc = step4_search.match(/;d/g);
         var s4_noalc = step4_search.match(/;a/g);
         var ins4 = 0;
         var s5_alc = step5_search.match(/;d/g);
         var s5_noalc = step5_search.match(/;a/g);
         var ins5 = 0;

         if(s1_alc != null) {
             s1_alc = s1_alc.length;
         }

         if(s1_noalc != null) {
            s1_noalc =s1_noalc.length;
         }

         if(s2_alc != null) {
             s2_alc = s2_alc.length;
         }

         if(s2_noalc != null) {
            s2_noalc =s2_noalc.length;
         }

         if(s3_alc != null) {
             s3_alc = s3_alc.length;
         }

         if(s3_noalc != null) {
            s3_noalc =s3_noalc.length;
         }

         if(s4_alc != null) {
             s4_alc = s4_alc.length;
         }

         if(s4_noalc != null) {
            s4_noalc =s4_noalc.length;
         }

         if(s5_alc != null) {
             s5_alc = s5_alc.length;
         }

         if(s5_noalc != null) {
            s5_noalc =s5_noalc.length;
         }

         // console.log(step1_search);





         for(var thenum =0;search.split(",").length > thenum;thenum = thenum + 1) {

             if(step1_search[step1_search.search(search.split(",")[thenum]) -2] == "d" || step1_search[step1_search.search(search.split(",")[thenum]) -2] == "a") {
             //console.log(step1_search.search(search.split(",")[thenum]));
                 ins1 = ins1 + 1;
             }
             if(step2_search[step2_search.search(search.split(",")[thenum]) -2] == "d" || step2_search[step2_search.search(search.split(",")[thenum]) -2] == "a") {
             //console.log(step1_search.search(search.split(",")[thenum]));
                 ins2 = ins2 + 1;
             }
             if(step3_search[step3_search.search(search.split(",")[thenum]) -2] == "d" || step3_search[step3_search.search(search.split(",")[thenum]) -2] == "a") {
             //console.log(step1_search.search(search.split(",")[thenum]));
                 ins3 = ins3 + 1;
             }
             if(step4_search[step4_search.search(search.split(",")[thenum]) -2] == "d" || step4_search[step4_search.search(search.split(",")[thenum]) -2] == "a") {
             //console.log(step1_search.search(search.split(",")[thenum]));
                 ins4 = ins4 + 1;
             }
             if(step5_search[step5_search.search(search.split(",")[thenum]) -2] == "d" || step5_search[step5_search.search(search.split(",")[thenum]) -2] == "a") {
             //console.log(step1_search.search(search.split(",")[thenum]));
                 ins5 = ins5 + 1;
             }

         }

         calced_precent = ((ins1 + ins2 + ins3 + ins4 + ins5) / (s1_alc + s1_noalc + s2_alc + s2_noalc+ s3_alc + s3_noalc+s4_alc + s4_noalc+ s5_alc + s5_noalc)) * 100;

        // var step2_search ="";
        // var step3_search ="";
        // var step4_search ="";

         if(calced_precent > 10 && search != "") {

         recipelist.append({
                           name:pull.rows.item(num).name,
                              step1:pretty_step1,
                               step2:pretty_step2,
                               step3:pretty_step3,
                               step4:pretty_step4,
                               step5:pretty_step5,
                               author:pull.rows.item(num).author,
                               percentavailable:Math.round(calced_precent)
                                   });

         } else { if(search == "") {
             recipelist.append({
                               name:pull.rows.item(num).name,
                                  step1:pretty_step1,
                                   step2:pretty_step2,
                                   step3:pretty_step3,
                                   step4:pretty_step4,
                                   step5:pretty_step5,
                                   author:pull.rows.item(num).author,
                                   percentavailable:Math.round(calced_precent)
                                       });

         }}

        num = num + 1;
    }


});
    if(search != "") {


    for(var itemnum = recipelist.count-1;itemnum >= 0;itemnum = itemnum - 1) {

        for(var testnum = 0;testnum <= recipelist.count-1;testnum = testnum+1) {

                if(recipelist.get(itemnum).percentavailable > recipelist.get(testnum).percentavailable ) {

                   // console.log(recipelist.get(itemnum).name);
                    recipelist.move(itemnum,testnum,1);

                }
         }

        }
    for(var fixfirst = recipelist.count-1;fixfirst >= 0;fixfirst = fixfirst -1 ) {

        if(recipelist.get(0).precentavailable >= recipelist.get(fixfirst)) {
                recipelist.move(0,fixfirst,1);
        }
    }


    }

}

function add_ingredient(listindex,additive) {

    var list;

    switch(listindex) {
    case 1:list =  step1;break;
    case 2:list =  step2;break;
    case 3:list =  step3;break;
    case 4:list =  step4;break;
    case 5:list =  step5;break;
    }

    if(list == " ") {
        list = equipselected+";"+additive;
    } else {
        list = list+";"+additive;
    }

    switch(listindex) {
    case 1:step1 = list;break;
    case 2:step2 = list;break;
    case 3:step3 = list;break;
    case 4:step4 = list;break;
    case 5:step5 = list;break;
    }

    //console.log(list);
    switch(listindex) {
    case 1:listingredients(step1,listindex - 1);break;
    case 2:listingredients(step2,listindex - 1);break;
    case 3:listingredients(step3,listindex - 1);break;
    case 4:listingredients(step4,listindex - 1);break;
    case 5:listingredients(step5,listindex - 1);break;

    }
}

function sub_ingredient(list,subtractive,index) {

    var temp_list;


}

function create_list(search,type) {
        var baselist = bases.split(",");
        var equlist = equipment.split(",");
        var addylist = addtoos.split(",");
        var garlist = gar.split(",");
        var actlist = actons.split(",");
        var bnum = 0;
        var eqnum = 0;
        var adnum = 0;
        var garnum =0;
        var actnum =0;

            fullist.clear();

    if(type == "all") {

            fullist.append({ingredient:"Alcohols",
                            type:0});

           // console.log(search);
        while(baselist.length > bnum) {

            if(search == "" || baselist[bnum].split("^")[1].search(search) != -1) {

            fullist.append({ingredient:baselist[bnum],
                            type:1});

            }

            bnum = bnum + 1;

        }


        fullist.append({ingredient:"Not Alcohols",
                        type:0});

    while(addylist.length > adnum) {

        if(search == "" || addylist[adnum].split("^")[1].search(search) != -1) {

        fullist.append({ingredient:addylist[adnum],
                        type:1});


        }

        adnum = adnum + 1;

    }

    fullist.append({ingredient:"Garnishes",
                    type:0});

    while(garlist.length > garnum) {

    if(search == "" || garlist[garnum].split("^")[1].search(search) != -1) {

    fullist.append({ingredient:garlist[garnum],
                    type:1});


    }

    garnum = garnum + 1;

    }

    }



       fullist.append({ingredient:"Equipment",
                        type:0});

    while(equlist.length > eqnum) {

        if(search == "" || equlist[eqnum].split("^")[1].search(search) != -1) {

        fullist.append({ingredient:equlist[eqnum],
                        type:1});


        }

        eqnum = eqnum + 1;

    }


    fullist.append({ingredient:"Actions",
                     type:0});

 while(actlist.length > actnum) {

     if(search == "" || actlist[actnum].split("^")[1].search(search) != -1) {

     fullist.append({ingredient:actlist[actnum],
                     type:1});


     }

     actnum = actnum + 1;

 }

}


function add_currentlist(addition) {

    if(currentlist == "") {
        currentlist = "Water,Ice,"+addition;
    } else {
        currentlist = currentlist+","+addition;
    }

    console.log(currentlist);

}
