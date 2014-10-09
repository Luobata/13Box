$(document).ready(function(){
  $("#trause").click(function(){
    $("#panel1").slideToggle();
  });
});
$(document).ready(function(){
  $("#conuse").click(function(){
    $("#panel2").slideToggle();
  });
});
function zoom(obj,rate){
obj.width=obj.width*rate;
obj.heigth=obj.heigth*rate;
}