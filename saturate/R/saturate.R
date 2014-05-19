#' @title Adjust the saturation of a colour
#' @param col character matrix with colour names or hexadecimal values
#' @param sat numeric adjustment for saturation
#' @param fixed single numeric fraction to which to set saturation for all col
#' @return numeric matrix with three rows (red, green and blue)
#' @examples 
#'     eg <- c("hotpink", "cornflowerblue", "#1100EE")
#'     saturate(col = eg, sat = 2)
#'     saturate(col = eg, sat = 0.2)
#'     hist(rnorm(100), col = saturate(col = "red", sat = 4^(-10:1)))
#' @export

saturate <-
function(col, sat = 1, fixed = NULL) {
    
    if (!is.null(fixed) && length(fixed) > 1) { stop("fixed should be NULL or single numeric") }
    
    msg <- ""
    
    rgbOut <- character(max(length(col), length(sat)))
    
    if (length(col) == 0) { msg <- "col is" }
    
    if (length(sat) == 0) { 
        if (msg == "") {
            msg <- "sat is" 
        } else { 
            msg <- paste(msg, "and sat are") 
        }
    }
    
    if (length(col) > 0 && length(sat) > 0) {
        
        rgbNums <- col2rgb(col)
        
        hsvNums <- rgb2hsv(rgbNums) * 255
        
        if (all(sat <= 0)) { fixed <- 0 }
        
        hsvNums <- saturateHSV(mat = hsvNums, sat = sat, fixed = fixed) / 255
        
        hsvDF <- as.data.frame(t(hsvNums))
        
        names(hsvDF) <- c("h", "s", "v")
        
        rgbOut <- do.call("hsv", hsvDF)
        
    } else { warning(paste(msg, "length zero")) }
    
    return(rgbOut)
}
