$(document).ready(function() {
  $(".button").click(function(){
    var taskTitle = $(".taskTitle").val();
    $.post("/add", {title: taskTitle}, function() {
      $.get("/tasks", function(data) {
        $("#tasks").html(data);
      });
    });
    return false;
  });
  
  
});