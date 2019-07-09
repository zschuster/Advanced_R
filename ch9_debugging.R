
# nested trycatch ----

function_1 = function(x, y) x + y
function_2 = function(x, y) x * y

tryCatch(function_1("a", 5),
         error = function(e) {
           tryCatch(
             function_2(17, "j"),
             error = function(e) cat("nothing seems to be working!\n", conditionMessage(e))
           )
         })
