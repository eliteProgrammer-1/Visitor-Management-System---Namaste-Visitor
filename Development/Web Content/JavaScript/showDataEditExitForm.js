console.log("included");

const formBox = document.getElementById("formBox");
const editForm = document.getElementById("editForm");
const exitForm = document.getElementById("exitTimeForm");

const container = document.getElementById("container");
console.log(container);

// container.style.display = "none";
formBox.style.display = "none";
editForm.style.display = "none";

function editBtnEventCSS() 
{
    container.style.display = "none";
    formBox.style.display = "flex";
    editForm.style.display = "flex";
    
    const firstName = document.getElementById("firstName");
    const lastName = document.getElementById("lastName");
    const mobNum = document.getElementById("mobNum");
    const aadharNum = document.getElementById("aadharNum");
}

function editBtnEvent() 
{
    const editBtns = document.getElementsByClassName("editBtn");
    for(let i = 0; i < editBtns.length; i++)
    {
        editBtns[i].addEventListener("click", ()=>
        {   
            console.log("editBtn Clicked");
            editBtnEventCSS();
        });
    }    
}

editBtnEvent();
// exitBtnEvent();