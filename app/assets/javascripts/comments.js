$("div[data-load]").filter(":visible").each(function(){

  var path = $(this).attr('data-load');
  $(this).load(path);

});
