window.onload = function() 
{   
    if((tableBody.children).length == 0)
    {
        document.getElementById("tableBoxOfShowEntries").innerHTML = `<div class="alert alert-warning" role="alert" style="width: 100%; display: flex; justify-content: center; align-items: center; flex-direction: column;">
        <h2 class="alert-heading">Oops!</h2>
        <hr>
        <p class="mb-0">No Data Found.</p>
    </div>`;  // bootstrap alert
    
    document.getElementById("sortData").style.display = "none"; // sorting functionality is not needed
    }
}
