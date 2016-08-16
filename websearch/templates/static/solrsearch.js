var server_url = "./search"

function build_toc() {
    var ToC = "<nav role='navigation' class='table-of-contents'><ul>";

    $("article h3").each(function() {
        var newLine, el, title, link;
        el = $(this);
        title = el.text();
        link = "#" + el.attr("id");

        newLine = "<li><a href='" + link + "'>" + title + "</a></li>";
        ToC += newLine;

    });

    ToC += "</ul></nav><hr>";

    $("article").prepend(ToC);
}

function attachListener() {

    var search = function(e, page) {
        e.preventDefault();
        $("tbody[id=results]").empty();
        if (page == null) {
            page = 1;
        }

        var query = $("input[name=query]")[0].value;
        $(".query").text(query);
        console.log(query);
        var url = server_url + "/" + page + "?q=" + query;
        $.ajax({
          type: 'GET',
          url: url,
          async: true,
          contentType: "application/json",
          dataType: 'json',
          success: function(json) {
                console.log(json);
                $(".time").text("needed time: " + json["responseHeader"]["QTime"]);
                $(".query").text(query + " found " + json["response"]["numFound"] + " results");
                json["response"]["docs"].forEach(function(r) {
                    console.log(r);
                    var title = r["title"];
                    var id = r["id"];
                    var new_row = "<tr> <td>" + title +  " </td>  <td> <a href=\"" + id + "\" target=\"_blank\">pdf</a> </td> </tr>";
                    $("tbody[id=results]").append(new_row);
                });

              $(".results").css('visibility','visible');
              $("ul[id=pages]").empty();
              var first = Math.max(Number(page) - 5, 1);
              var end = Math.min(json["response"]["numFound"] / 30, first + 9);

              for(var i = first; i <= end; i++) {
                  if (i == page) {
                      p = "<li class=\"page-pattern active\"><a href=\"#\" class=\"change-page\">" + i + "</a></li>"
                  } else {
                      p = "<li class=\"page-pattern\"><a href=\"#\" class=\"change-page\">" + i + "</a></li>"
                  }

                  $("ul[id=pages]").append(p);
              }
              $(".change-page").click(function(e) {
                  var page = event.target.text;
                  search(e, page);
              });

          }
        });
    };

    $(".go").click(search);
    $(".change-page").click(function(e) {
          var page = event.target.text;
          search(e, page);
      });
}


$().ready(function() {
    attachListener();

});
