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
        page = parseInt(page);
        console.log("page: " + page);

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
              $(".time").text("needed time: " + json["responseHeader"]["QTime"]);
              $(".query").text(query);
              $(".result-count").text("found " + json["response"]["numFound"] + " documents.");

              json["response"]["docs"].forEach(function(r) {
                  var title = r["title"];
                  var id = r["id"];
                  var filename = id.replace("./pdf/", "");

                  var result = "<tr class=\"result-row\"> <td> " + title +
                               "<br/> <small class=\"abstract\">" + r["abstract"] +
                               "</small> </td>  <td> <a href=\"" + id + "\" target=\"_blank\">[pdf]</a> " +
                               "<a id=\"bibtex\" href=\"./bib/" + filename + "\" target=\"_blank\">[bib]</a>" +
                               "</td> <td><a href=\"#\" class=\"show-abstract\"><span class=\"caret\"></span></a></td> </tr>";

                  $("tbody[id=results]").append(result);
              });

              $(".show-abstract").click(function(e) {
                  e.preventDefault();
                  var x = $(this).parent().parent().children().children(".abstract");
                  x.toggle(200);
              });

              $(".results").css('visibility', 'visible');
              $("ul[id=pages]").empty();
              var first = Math.max(Number(page) - 5, 1);
              var end = Math.min(json["response"]["numFound"] / 30, first + 9);
              if (page > 1) {
                  p = "<li> <a href=\"#\" aria-label=\"Previous\" class=\"page-prev\"> <span aria-hidden=\"true\">&laquo;</span> </a> </li>"
                  $("ul[id=pages]").append(p);
                  $("a[class=page-prev]").click(function(e){
                      search(e, page - 1);
                  });
              }

              for(var i = first; i <= end; i++) {
                  if (i == page) {
                      p = "<li class=\"page-pattern active\"><a href=\"#\" class=\"change-page\">" + i + "</a></li>"
                  } else {
                      p = "<li class=\"page-pattern\"><a href=\"#\" class=\"change-page\">" + i + "</a></li>"
                  }
                  $("ul[id=pages]").append(p);
              }
              $(".change-page").click(function(e) {
                  e.preventDefault();
                  var page = event.target.text;
                  search(e, page);
              });

              if (page <= json["response"]["numFound"] / 30) {
                  p = "<li> <a href=\"#\" aria-label=\"Next\" class=\"page-next\"> <span aria-hidden=\"true\">&raquo;</span> </a> </li>"
                  $("ul[id=pages]").append(p);
                  $("a[class=page-next]").click(function(e){
                      search(e, page + 1);
                  });
              }
          }
        });
    };

    $(".go").click(search);
    $(".change-page").click(function(e) {
        e.preventDefault();
        var page = parseInt(event.target.text);
        search(e, page);
    });
}


$().ready(function() {
    attachListener();

});
