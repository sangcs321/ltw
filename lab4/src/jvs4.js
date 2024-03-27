
var btnCheck = document.getElementById("btn");
btnCheck.addEventListener("click", check);

function check() {
    var A = document.getElementById("A").value;
    var B = document.getElementById("B").value;
    var count =  countAInB(B, A);
    document.getElementById("ketQua").innerHTML = "Số lần B xuất hiện trong A là: " + count;
}

function countAInB(A, B) {
    var count = 0;
    var index = B.indexOf(A);
    while(index !== -1) {
        count++;
        index = B.indexOf(A, index+1);
    }
    return count;
}