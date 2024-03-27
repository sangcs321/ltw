

var btnketQua = document.getElementById("btnKetqua");
btnketQua.addEventListener("click",ketQuaPT)

var ketQua = document.getElementById("ketqua");
function delta() {
    var a = parseFloat(document.getElementById("a").value);
    var b = parseFloat(document.getElementById("b").value);
    var c = parseFloat(document.getElementById("c").value);
    return Math.pow(b,2) - 4*(a*c);

}
function deltaNhoHon0() {
    return "Phương trình vô nghiệm";
}
function deltaBang0() {
    var a = parseFloat(document.getElementById("a").value);
    var b = parseFloat(document.getElementById("b").value);
    var c = parseFloat(document.getElementById("c").value);
    return -b/2*a;
}
function deltaLonHon0X1() {
    var a = parseFloat(document.getElementById("a").value);
    var b = parseFloat(document.getElementById("b").value);
    var c = parseFloat(document.getElementById("c").value);
    return (-b+ Math.sqrt(delta()))/(2*a)

}
function deltaLonHon0X2() {
    var a = parseFloat(document.getElementById("a").value);
    var b = parseFloat(document.getElementById("b").value);
    var c = parseFloat(document.getElementById("c").value);
    return (-b- Math.sqrt(delta()))/(2*a)
}
function ketQuaPT() {
    if (delta() < 0) {
        ketQua.textContent = deltaNhoHon0();
    } else if (delta() == 0) {
        ketQua.textContent = "Phương trình có nghiệm kép: x1 = x2 =" + deltaBang0();
    } else {
        ketQua.textContent = "Phương trình có 2 nghiệm phân biệt: "+ "x1 = " + deltaLonHon0X1() + "; x2 = " + deltaLonHon0X2();
    }
}