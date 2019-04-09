$(window).ready(function(){
    $("#peoms_search").keyup(function(e){
        console.log(e.target.value);
        $.ajax({
                method: 'get',
                data: {q: e.target.value},
                url: "/poems/search"
            })
    })
})