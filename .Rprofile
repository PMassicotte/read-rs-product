source("renv/activate.R")
options(
  device = "httpgd",
  repos = c(
    RSPM = "https://packagemanager.posit.co/cran/__linux__/noble/latest",
    CRAN = "https://cran.rstudio.com/"
  ),
  pillar.sigfig = 5L,
  pillar.bold = TRUE,
  pillar.max_footer_lines = Inf,
  HTTPUserAgent = sprintf(
    "R/%s R (%s)", # nolint
    getRversion(),
    paste(
      getRversion(),
      R.version[["platform"]],
      R.version[["arch"]],
      R.version[["os"]]
    )
  ),
  # Disable completion from the language server
  languageserver.server_capabilities =
    list(
      completionProvider = FALSE,
      completionItemResolve = FALSE
    ),
  languageserver.formatting_style = function(options) {
    styler::tidyverse_style(
      scope = "indention",
      indent_by = options[["tabSize"]]
    )
  },

  # Do not use rich documentation, as it causes strange formatting issues with
  # lspsaga
  languageserver.rich_documentation = FALSE,
  browser = "/usr/bin/firefox" # nolint
)

# Set default theme and color theme for ggplot2
setHook(packageEvent("ggplot2", "attach"), function(...) {
  ggplot2::theme_set(ggplot2::theme_minimal())
  options(ggplot2.continuous.colour = "viridis")
  options(ggplot2.continuous.fill = "viridis")
})

# Configure the behavior of httpgd. Basically, I want to keep the focus on the
# terminal with it opens the device in Firefox
if (interactive() && requireNamespace("httpgd", quietly = TRUE)) {
  options(device = function() {
    httpgd::hgd()
    url <- httpgd::hgd_url()
    system(
      sprintf(
        "zsh -c 'nohup firefox --new-tab \"%s\" >/dev/null 2>&1 & sleep 0.1 && i3-msg \"focus next\"'",
        url
      ),
      wait = FALSE,
      ignore.stdout = TRUE,
      ignore.stderr = TRUE
    )
  })
}

options(browser = function(url) {
  system(
    sprintf(
      "zsh -c 'nohup firefox --new-tab \"%s\" >/dev/null 2>&1 & sleep 0.1 && i3-msg \"focus next\"'",
      url
    ),
    wait = FALSE,
    ignore.stdout = TRUE,
    ignore.stderr = TRUE
  )
})
