#' Scrape player info
#' @param handle A player's LearnedLeague handle
#' @param ... currently ignored
#' @export
#' @importFrom xml2 read_html
#' @importFrom rvest html_nodes html_table
#' @importFrom magrittr extract2 %>%
#' @importFrom tibble set_tidy_names
#' @importFrom dplyr rename_ mutate_
#' @examples
#'
#' \dontrun{
#' x <- scrape_player_data()
#' }

scrape_player_data <- function(handle = "BaumerB", ...) {
  # need authentication
  url <- paste0("https://learnedleague.com/profiles.php?",
                tolower(handle))

  # from previous Save As...
  url <- paste0("~/dumps/learnedleague/LL Profile: ", handle, ".html")

  data <- xml2::read_html(url) %>%
    rvest::html_nodes("table") %>%
    magrittr::extract2(7) %>%
    rvest::html_table()

  names(data) <- tolower(data[1,])

  suppressMessages(
    out <- data[2:19, ] %>%
      tibble::set_tidy_names() %>%
      dplyr::rename_(pct = ~`%..3`, ll_pct = ~`lg %..4`) %>%
      dplyr::mutate_(pct = ~as.numeric(pct),
                     ll_pct = ~as.numeric(ll_pct))
  )

  return(out)
}

#' Compare two players
#' @export
#' @importFrom dplyr select_ bind_rows mutate_
#' @importFrom stringr str_extract
#' @importFrom stats reorder
#' @import ggplot2
#' @param handle1 Opponent's player handle
#' @param handle2 Your player handle
#' @param ... currently ignored


compare <- function(handle1, handle2 = "BaumerB", ...) {
  x <- scrape_player_data(handle1) %>%
    dplyr::select_(~category, ~career, ~pct, ~ll_pct) %>%
    dplyr::mutate_(pct = ~-1 * pct,
                   ll_pct = ~-1 * ll_pct)
  y <- scrape_player_data(handle2) %>%
    dplyr::select_(~category, ~career, ~pct, ~ll_pct)

  df <- x %>%
    dplyr::bind_rows(y) %>%
    dplyr::mutate_(player = ~rep(c(handle1, handle2), each = nrow(x)),
                   n = ~as.numeric(gsub("-", "", stringr::str_extract(career, "-[0-9]+$"))),
                   se = ~sqrt(abs(pct) * (1 - abs(pct)) / n),
                   moe = ~1.96 * se)

  ggplot2::ggplot(df, aes(x = stats::reorder(category, pct), y = pct, fill = player)) +
    geom_col() +
    geom_errorbar(aes(ymax = pct + moe, ymin = pct - moe), width = 0.25) +
    geom_point(aes(y = ll_pct), color = "darkgray") +
    coord_flip() +
    scale_x_discrete(NULL) +
    scale_y_continuous("Question Percentage", limits = c(-1, 1))
}
