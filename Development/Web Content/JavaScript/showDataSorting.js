const sortOption = document.getElementById("sortData");

const tableBody = document.getElementById("tableBody");


// console.log(tableBody);
// console.log(((tableBody.children)[0].children)[2]);

// console.log((((tableBody.children)[0].children)[7]).innerText); 

function getTableContent() 
{
    const tableContent = [];
    const tableBodyChildren = tableBody.children;
    for(let i = 0; i < tableBodyChildren.length; i++)
    {
        const tableRow = tableBodyChildren[i];
    
        const visitingID = (tableRow.children)[1].innerText;
        const fName = (tableRow.children)[2].innerText;
        const lName = (tableRow.children)[3].innerText;
        const mobNum = (tableRow.children)[4].innerText;
        const aadharNum = (tableRow.children)[5].innerText;
        const purpose = (tableRow.children)[6].innerText;
        const entryDate = (tableRow.children)[7].innerText;
        const exitDate = (tableRow.children)[8].innerText;

        const rowObj = {
            visitingID: visitingID,
            fName: fName, 
            lName: lName, 
            mobNum: mobNum, 
            aadharNum: aadharNum, 
            purpose: purpose,
            entryDate: entryDate, 
            exitDate: exitDate       
        };

        tableContent.push(rowObj);
    }
    return tableContent;
}

function sortData(sortingType) 
{   
    const tableContent = getTableContent();
    if(sortingType == "newest")
    {   
        tableContent.sort((obj1, obj2)=>
        {
            return new Date(obj2.entryDate) - new Date(obj1.entryDate);
        });
    }
    else
    {   
        tableContent.sort((obj1, obj2)=>
        {
            return new Date(obj1.entryDate) - new Date(obj2.entryDate)
        });
    }
    return tableContent;
}

function setTableHTML(tableContent) 
{   
    let tableBodyHTML = "";
    for(let i = 0; i < tableContent.length; i++)
    {
        tableBodyHTML += `<tr>
        <th scope='row'>${i + 1}</th>
        <td>${tableContent[i].visitingID}</td>
        <td>${tableContent[i].fName}</td>
        <td>${tableContent[i].lName}</td>
        <td>${tableContent[i].mobNum}</td>
        <td>${tableContent[i].aadharNum}</td>
        <td>${tableContent[i].purpose}</td>
        <td>${tableContent[i].entryDate}</td>
        <td>${tableContent[i].exitDate}</td>
        <td><button type='button' class='btn-small editBtn'>Edit</button></td>
        <td><button type='button' class='btn-small'>Exit</button></td>`
    }
    
    tableBody.innerHTML = tableBodyHTML;
}

sortOption.addEventListener("change", ()=>
{
    const sortOptionVal = sortOption.options[sortOption.selectedIndex].value;

    const tableContent = sortData(sortOptionVal);
    setTableHTML(tableContent);
});