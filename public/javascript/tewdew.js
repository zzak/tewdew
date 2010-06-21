$(document).ready(function() {
  $(".addTask").click(function(){
    var taskTitle = $(".taskTitle").val();
    $.post("/add", {title: taskTitle}, function() {
      $.get("/tasks", function(data) {
        $("#tasks").html(data);
      });
    });
    return false;
  });
  
  $(".deleteTask").live(function(){
    var method = "delete";
    var task_id = $(".task_id").val();
    var taskelem = ".task-" + task_id;
    $.post("/delete/" + task_id, function(data) {
      $(taskelem).fadeOut('slow', function(){});
    });
    return false;
  });
  
  
});