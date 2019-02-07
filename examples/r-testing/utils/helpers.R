unnest_datasets <- function(nested_df, var=derived) {
    var <- rlang::enquo(var)
    
    return(
        nested_df %>% select(!!var) %>% unnest()
    )
}

expect_unique_rows <- function(.data, id="ID") {
    testthat::expect_equal(nrow(.data), length(unique(.data[[id]])))
}

## to preview all your variables: data %>% char_to_factor() %>% summary()
char_to_factor <- function(.data) {
    .data %>% mutate_if(is.character, as.factor)
}

names_to_lower <- function(.data) {
    .data %>% set_names(., tolower(names(.)))
}

names_to_upper <- function(.data) {
    .data %>% set_names(., toupper(names(.)))
}

all_char_are_numeric <- function(var) {
    suppressWarnings(
        all(
            !is.na(var %>% unique() %>% as.numeric())
        )
    )
}
