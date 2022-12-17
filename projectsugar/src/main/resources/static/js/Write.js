let oEditors = []

smartEditor = function() {
    nhn.husky.EZCreator.createInIFrame({
        oAppRef: oEditors,
        elPlaceHolder: "editorTxt",
        sSkinURI: "/smarteditor/SmartEditor2Skin.html",
        fCreator: "createSEditor2"
    })
}

$(document).ready(function() {
    smartEditor()
})

const submitPost = () => {
    oEditors.getById["editorTxt"].exec("UPDATE_CONTENTS_FIELD", []);
    let content = document.getElementById("editorTxt").value;

    if(content === '<p>&nbsp;</p>') {
        alert("내용을 입력해주세요.");
        oEditors.getById["editorTxt"].exec("FOCUS");
        return false;
    }

    return true;
}