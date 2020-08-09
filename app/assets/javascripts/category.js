$(document).on('turbolinks:load', function(){
  $(function(){
    // カテゴリーセレクトボックスのオプションを作成
    function appendOption(category){
      var html = `<option value="${category.id}" data-category="${category.id}">${category.name}</option>`;
      return html;
    }
    // 子カテゴリーの表示作成
    function appendChidrenBox(insertHTML){
      var childSelectHtml = '';
      childSelectHtml = `<div class='exhibitionPage__main__contents__detail__category__choose__added' id= 'children_wrapper'>
                          <div class='exhibitionPage__main__contents__detail__category__choose1'>
                            <i class='fas fa-chevron-down exhibitionPage__main__contents__detail__category__choose--arrow-down'></i>
                            <select class="exhibitionPage__main__contents__detail__category__choose--select" id="child_category" name="product[category_id]">
                              <option value="---" data-category="---">---</option>
                              ${insertHTML}
                            <select>
                          </div>
                        </div>`;
      $('.exhibitionPage__main__contents__detail__category__choose').append(childSelectHtml);
    }

     //孫カテゴリーの表示作成
    function appendGrandchidrenBox(insertHTML){
      var grandchildSelectHtml = '';
      grandchildSelectHtml = `<div class='exhibitionPage__main__contents__detail__category__choose__added' id= 'grandchildren_wrapper'>
                                <div class='exhibitionPage__main__contents__detail__category__choose2'>
                                  <i class='fas fa-chevron-down exhibitionPage__main__contents__detail__category__choose--arrow-down'></i>
                                  <select class="exhibitionPage__main__contents__detail__category__choose__box--select" id="grandchild_category" name="product[category_id]">
                                    <option value="---" data-category="---">---</option>
                                    ${insertHTML}
                                  </select>
                                </div>
                              </div>`;
      $('.exhibitionPage__main__contents__detail__category__choose').append(grandchildSelectHtml);
    }
    

     //親カテゴリー選択後のイベント
    $('#parent_category').on('change', function(){
      var parent_category_id = document.getElementById('parent_category').value; //選択された親カテゴリーの名前を取得
      if (parent_category_id != "---"){ //親カテゴリーが初期値でないことを確認
        $.ajax({
          url: 'category/get_category_children',
          type: 'GET',
          data: { parent_id: parent_category_id },
          dataType: 'json'
        })
        .done(function(children){
          $('#children_wrapper').remove(); //親が変更された時、子以下を削除する
          $('#grandchildren_wrapper').remove();
          
          var insertHTML = '';
          children.forEach(function(child){
            insertHTML += appendOption(child);
          });
          appendChidrenBox(insertHTML);
        })
        .fail(function(){
          alert('カテゴリー取得に失敗しました');
        })
        }else{
          $('#children_wrapper').remove(); //親カテゴリーが初期値になった時、子以下を削除する
          $('#grandchildren_wrapper').remove();
        }
    });

  clothesArray       = ["3","160","161","162","163","164","165","166","167","168","169","170","171","172","173","174","175","176","177","178","179","180",
                        "181","182","183","184","185","186","187","188","189","190","191","192","193","194","195","196","197","198","199","200","201",
                        "202","203","204","205","206","207","208","209","210","211","212","213","214","215","216","217","218","219","230","231","232",
                        "317","318","319","340","341","342","343","344","345","346","347","348","349","350","351","352","353","354","355","356","357",
                        "358","359","360","361","362","363","364","365","366","367","368","369","370","371","372","373","374","375","376","377","378",
                        "379","380","381","382","383","404","405","406","407","408","459","460","467","468","469","1087","1088","1098","1099"]

  ladiesShoesArray   = ["220","221","222","223","224","225","226","227","228","229","1085","1095"]

  mensShoesArray     = ["384","385","386","387","388","389","390","391","1084","1094"]

  babiesClothesArray = ["471","472","473","474","475","476","477","478","479","480","481","482","483","484",
                        "485","486","487","488","489","490","491","492","493","494","495","496","497"]

  kidsClothesArray   = ["498","499","500","501","502","503","504","505","506","507","508","509","510","511","512","513","514","515","516","517",
                        "518","519","520","521","522","523","524","525","526","527","528","529","530","531","532","533","534","1089","1100"]

  kidsShoesArray     = ["535","536","537","538","539","1086","1096"]

   // 子カテゴリー選択後のイベント
   $('.exhibitionPage__main__contents__detail__category').on('change', '#child_category', function(){
     var child_category_id = $('#child_category option:selected').data('category'); //選択された子カテゴリーのidを取得
     if (child_category_id != "---"){ //子カテゴリーが初期値でないことを確認
       $.ajax({
         url: '/products/category/get_category_grandchildren',
         type: 'GET',
         data: { child_id: child_category_id },
         dataType: 'json'
       })
       .done(function(grandchildren){
         if (grandchildren.length != 0) {
           $('#grandchildren_wrapper').remove(); //子が変更された時、孫以下を削除する
           var insertHTML = '';
           grandchildren.forEach(function(grandchild){
             insertHTML += appendOption(grandchild);
           });
           appendGrandchidrenBox(insertHTML);
         }
       })
       .fail(function(){
         alert('カテゴリー取得に失敗しました');
       })
     }else{
       $('#grandchildren_wrapper').remove(); //子カテゴリーが初期値になった時、孫以下を削除する
       $(".size-sellect_form").hide();
     }
   });
  
   $(".size-sellect_form").hide()
   
   $('.exhibitionPage__main__contents__detail__category').on('change','#grandchild_category',function AddSizeform() {
     var grandchild_category_id= $('#grandchild_category option:selected').val();
     console.log(grandchild_category_id)
     
     var clothes = clothesArray
     
     var result = clothes.some(function(needSize){
       return needSize === grandchild_category_id 
       
     });
     console.log(result)
      if (result == true){ 
        showSellectForm(function(){$(".size-sellect_form").show()}
        
        )}
    });
  });
});