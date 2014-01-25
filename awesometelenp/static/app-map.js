// app-map.js
function opChooseOp() {
    document.getElementById("wizOpLoad").style.display = "none";
    document.getElementById("wizOpNew").style.display = "none";
    document.getElementById("wizOpDel").style.display = "none";
    document.getElementById("wizOpRename").style.display = "none";
    document.getElementById("wizOpSave").style.display = "none";
    document.getElementById("wizOpDone").style.display = "none";
    document.getElementById("wizOpStart").style.display = "none";
    document.getElementById("wizChooseOp").style.display = "block";
}

function opLoad() {
    document.getElementById("wizOpLoad").style.display = "block";
    document.getElementById("wizOpNew").style.display = "none";
    document.getElementById("wizOpDel").style.display = "none";
    document.getElementById("wizOpRename").style.display = "none";
    document.getElementById("wizOpSave").style.display = "none";
    document.getElementById("wizOpDone").style.display = "none";
    document.getElementById("wizOpStart").style.display = "none";
    document.getElementById("wizChooseOp").style.display = "none";
}

function opMake() {
    document.getElementById("wizOpLoad").style.display = "none";
    document.getElementById("wizOpNew").style.display = "block";
    document.getElementById("wizOpDel").style.display = "none";
    document.getElementById("wizOpRename").style.display = "none";
    document.getElementById("wizOpSave").style.display = "none";
    document.getElementById("wizOpDone").style.display = "none";
    document.getElementById("wizOpStart").style.display = "none";
    document.getElementById("wizChooseOp").style.display = "none";
}

function opDelete() {
    document.getElementById("wizOpLoad").style.display = "none";
    document.getElementById("wizOpNew").style.display = "none";
    document.getElementById("wizOpDel").style.display = "block";
    document.getElementById("wizOpRename").style.display = "none";
    document.getElementById("wizOpSave").style.display = "none";
    document.getElementById("wizOpDone").style.display = "none";
    document.getElementById("wizOpStart").style.display = "none";
    document.getElementById("wizChooseOp").style.display = "none";
}

function opRename() {
    document.getElementById("wizOpLoad").style.display = "none";
    document.getElementById("wizOpNew").style.display = "none";
    document.getElementById("wizOpDel").style.display = "none";
    document.getElementById("wizOpRename").style.display = "block";
    document.getElementById("wizOpSave").style.display = "none";
    document.getElementById("wizOpDone").style.display = "none";
    document.getElementById("wizOpStart").style.display = "none";
    document.getElementById("wizChooseOp").style.display = "none";
}

function opSave() {
    document.getElementById("wizOpLoad").style.display = "none";
    document.getElementById("wizOpNew").style.display = "none";
    document.getElementById("wizOpDel").style.display = "none";
    document.getElementById("wizOpRename").style.display = "none";
    document.getElementById("wizOpSave").style.display = "block";
    document.getElementById("wizOpDone").style.display = "none";
    document.getElementById("wizOpStart").style.display = "none";
    document.getElementById("wizChooseOp").style.display = "none";
}

function opCancel() {
    opChooseOp();
}
