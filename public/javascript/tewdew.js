$(document).ready(function() {
  $(".addTask").live("click", function(){
    var taskTitle = $(".taskTitle").val();
    $.post("/add", {title: taskTitle}, function() {
      $.get("/tasks", function(data) {
        $("#tasks").html(data);
      });
    });
    return false;
  });
  
  $("#newtask").hide();
  $("#shownewtask").click(function() {
    $("#newtask").slideToggle();
  });
});
