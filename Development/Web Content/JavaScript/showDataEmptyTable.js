window.onload = function() 
{   
    if((tableBody.children).length == 0)
    {
        document.getElementById("tableBoxOfShowEntries").innerHTML = `<div class="alert alert-warning" role="alert" style="width: 100%; display: flex; justify-content: center; align-items: center; flex-direction: column;">
        <h4 class="alert-heading">Oops!</h4>
        <hr>
        <p class="mb-0">No Data Found.</p>
    </div>`;    
    }
}
