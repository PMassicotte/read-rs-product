linters <- all_linters(
  packages = "lintr",
  line_length_linter(80L),
  object_length_linter = NULL,
  object_name_linter = NULL,
  object_usage_linter = NULL,
  unused_import_linter = NULL,
  undesirable_function_linter = undesirable_function_linter(
    fun = modify_defaults(
      defaults = default_undesirable_functions,
      library = NULL,
      message = "use cli::cli_inform()",
      warning = "use cli::cli_warn()",
      stop = "use cli::cli_abort()",
      inform = "use cli::cli_inform()",
      warn = "use cli::cli_warn()",
      abort = "use cli::cli_abort()",
      cli_alert_danger = "use cli::cli_inform()",
      cli_alert_info = "use cli::cli_inform()",
      cli_alert_success = "use cli::cli_inform()",
      cli_alert_warning = "use cli::cli_inform()",
      file.path = "use path()",
      dir = "use dir_ls()",
      dir.create = "use dir_create()",
      file.copy = "use file_copy()",
      file.create = "use file_create()",
      file.exists = "use file_exists()",
      file.info = "use file_info()",
      normalizePath = "use path_real()",
      unlink = "use file_delete()",
      basename = "use path_file()",
      dirname = "use path_dir()",
      readLines = "use read_lines()",
      writeLines = "use write_lines()"
    ),
    symbol_is_undesirable = FALSE
  ),
  undesirable_operator_linter(
    op = all_undesirable_operators
  )
)
