$(function(){
  let search_list = $("#item-search-list");

  function appendItem(item) {
    let html = `<div class = "list">
                  <ul class = "list__ul">
                    <li>
                      <a href = "/titles/${item.title_id}/items/${item.item_id}/content" data-method = "get" class = "list__ul--item">${item.item}</a>
                    </li>
                  </ul>
                </div>`
    search_list.append(html);
   }
   function appendErrMsgToHTML(msg) {
       let html = `<div class = "list">
                    <div class = "list__ull">
                      <p>${ msg }</p>
                    </div>
                  </div>`
       search_list.append(html);
   }
   function appendbox() {
     let html = `<div class = "list__end"></div>`
     search_list.append(html);
   }

  $('.header__search__form--text').on("keyup", function(){
    let input = $(".header__search__form--text").val();
    $.ajax({
      url:  '/items/search',              //同期通信でいう『パス』
      type: 'GET',                        //同期通信でいう『HTTPメソッド』
      data: { keyup: input },  
      dataType: 'json'
    })
    .done(function(search){
      console.log(search)
      $("#item-search-list").empty();
      if (search.item == "not-search");   // ""の処理

      else if (search.length !== 0) {     // 検索した内容があれば
        search.forEach(function(item){
          appendItem(item);
        });
        appendbox();
      }
      else {
        appendErrMsgToHTML("一致する項目がありません");
        appendbox();
      }
    })
  });
});
