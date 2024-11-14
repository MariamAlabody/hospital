function showTaskForm() {
    document.getElementById("task-form").style.display = "flex";
}

function hideTaskForm() {
    document.getElementById("task-form").style.display = "none";
}

function addTask() {
    var taskTitle = document.getElementById("task-title").value;
    if (taskTitle) {
        var li = document.createElement("li");
        li.textContent = taskTitle;
        document.getElementById("task-list").appendChild(li);
        document.getElementById("task-title").value = "";
        hideTaskForm();
    } else {
        alert("يرجى إدخال عنوان المهمة.");
    }
}
document.querySelector("form").addEventListener("submit", function(e) {
e.preventDefault();
// يتم إرسال البيانات هنا

// إظهار إشعار النجاح
alert("تم رفع التقرير بنجاح!");

// إعادة تحميل الصفحة الحالية
location.reload();
});