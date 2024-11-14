// دالة البحث في صندوق الوارد
function searchEmails() {
    let searchQuery = document.getElementById('search-input').value.toLowerCase();
    let table = document.getElementById('inbox-table');
    let rows = table.getElementsByTagName('tr');
    
    for (let i = 1; i < rows.length; i++) {  // بدءًا من 1 لتخطي رأس الجدول
        let cells = rows[i].getElementsByTagName('td');
        let subject = cells[0].textContent.toLowerCase();
        let sender = cells[1].textContent.toLowerCase();
        
        if (subject.includes(searchQuery) || sender.includes(searchQuery)) {
            rows[i].style.display = '';  // إظهار الصف
        } else {
            rows[i].style.display = 'none';  // إخفاء الصف
        }
    }
}

// دالة لعرض رسائل البريد في صندوق الوارد (يتم استدعاؤها عند تحميل الصفحة)
function loadInboxMessages() {
    let inboxTable = document.getElementById('inbox-table').getElementsByTagName('tbody')[0];
    let messages = [
        { subject: "طلب إجازة", sender: "أحمد العلي", date: "2024-11-01" },
        { subject: "تقارير شهريه", sender: "سارة حسين", date: "2024-11-02" }
    ];

    messages.forEach((message, index) => {
        let row = inboxTable.insertRow();
        row.innerHTML = `<td>${message.subject}</td><td>${message.sender}</td><td>${message.date}</td><td><button>فتح</button></td>`;
    });
}

window.onload = loadInboxMessages;
