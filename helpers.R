names_to_lower <- function(.data) {
    .data %>% set_names(., tolower(names(.)))
}

names_to_upper <- function(.data) {
    .data %>% set_names(., toupper(names(.)))
}

expect_unique_rows <- function(.data, id="id_column") {
    ## when passes, testthat does not return TRUE, in contrast to assertthat::assert_that()
    testthat::expect_equal(nrow(.data), length(unique(.data[[id]])))
}

expect_same_names <- function(df1, df2) {
    testthat::expect_true(all_equal(names(df1), names(df2)))
}

get_file_from_path  <- function(path, file, suppress_coltype_msg=TRUE) {
    if (suppress_coltype_msg) {
        paste0(path, file) %>% read_csv(col_types=cols())
    } else {
        paste0(path, file) %>% read_csv()
    }
}


## to get a dataframe, just use count(df, id)
## TODO how to speed up select() for dfs with many columns?
## TODO tried magrittr::extract() but how does it work with NSE?
get_duplicate_ids <- function(df, id) {
    ## if id not provided, take first column
    if (missing(id))    id_var <- rlang::sym(names(df)[1])
    else                id_var <- rlang::enquo(id)
    counts <- df %>%
        # magrittr::extract(!!id_var) %>%
        dplyr::count(!!id_var)
    duplicated_ids <- counts %>%
        dplyr::filter(n>1) %>%
        dplyr::pull(!!id_var) %>%
        sort()
    return(duplicated_ids)
}


## to preview all your variables: data %>% char_to_factor() %>% summary()
char_to_factor <- function(.data) {
    .data %>% mutate_if(is.character, as.factor)
}

## I take pieces of this as needed
make_valid_colnames <- function(colnames) {
    colnames %>%
        make.names(unique=TRUE) %>%
        gsub("\\.", "_", .) %>%
        gsub("__", "_", .)  %>%   # sometimes get duplicate separators
        gsub("X_", "", .)         # some get X_ prefix
}
