var delayTimer;
$(window).ready(function () {
    $("#peoms_search").keyup(function (e) {
        clearTimeout(delayTimer);
        delayTimer = setTimeout(function () {
            $.ajax({
                method: 'get',
                data: {q: e.target.value},
                url: "/poems/search"
            })
        }, 500);

    });
    $(".line-container").click(function(){
        $(this).parent().find("#sharing_list").toggleClass("d-block").toggleClass("d-none");
    })
});


