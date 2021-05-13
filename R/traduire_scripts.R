make_translation_summary <- function(output_path, ...) {
  args <- list(...)
  translations <- lapply(args, summarise_dir)
  ## / is special character and cannot be used as name of a sheet in xl
  names(translations) <- gsub("/", "-", args)
  message(sprintf("Writing output to %s", output_path))
  writexl::write_xlsx(translations, output_path)
}

summarise_dir <- function(path) {
  json <- list.files(path, pattern = "*.json", full.names = TRUE)
  translations <- lapply(json, function(file) {
    lang <- strsplit(basename(file), "-")[[1]][1]
    content <- jsonlite::read_json(file)
    content <- data.frame(key = names(content),
                          value = unname(unlist(content)))
    names(content) <- c("key", lang)
    content
  })
  merge.all <- function(x, y) {
    merge(x, y, all = TRUE, by = "key")
  }

  Reduce(merge.all, translations)
}
