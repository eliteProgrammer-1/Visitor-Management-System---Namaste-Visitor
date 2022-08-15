const searchViaOtherAttributesForm = document.getElementById("searchViaOtherAttributes");
const searchViaDateForm = document.getElementById("searchViaDate");

const searchOptionRadioBtn = document.getElementsByName("searchOption"); // search via other attribute or date

const searchOption = document.getElementsByName("searchBy"); // via name, mobNum, visiting ID, etc
const searchInp = document.getElementById("inpWord");
console.log(searchInp);

searchViaDateForm.style.display = "none"; // intially date form is not shown

function showSearchForm() 
{ 
    for(let i = 0; i < searchOptionRadioBtn.length; i++)
    {
        searchOptionRadioBtn[i].addEventListener("click", () =>
        {
            if(searchOptionRadioBtn[i].checked == true)
            {
                if(searchOptionRadioBtn[i].value == "other-options")
                {
                    searchViaOtherAttributesForm.style.display = "flex";
                    searchViaDateForm.style.display = "none";
                }
                else
                {
                    searchViaOtherAttributesForm.style.display = "none";
                    searchViaDateForm.style.display = "flex";
                }
            }
        });
    }
}

function setPlaceHolder() 
{   
    searchInp.placeholder = "Enter Visiting ID";
    
    for(let i = 0; i < searchOption.length; i++)
    {   
        searchOption[i].addEventListener("change", ()=>
        {   
            if(searchOption[i].value == "visitingID")
            {
                searchInp.placeholder = "Enter Visiting ID";
            }
            else if(searchOption[i].value == "name")
            {
                searchInp.placeholder = "Enter Name";
            }
            else if(searchOption[i].value == "mobNum")
            {
                searchInp.placeholder = "Enter Mobile Number";
            }
            else if(searchOption[i].value == "aadharNum")
            {
                searchInp.placeholder = "Enter Aadhar Card Number";
            }
        });
    }
}

setPlaceHolder();
showSearchForm();