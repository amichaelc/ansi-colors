import sphinx_rtd_theme

project = "ansi-colors"

copyright = "2020 (C) Michael Christensen"

source_encoding = "utf-8-sig"

html_theme = "sphinx_rtd_theme"

html_theme_path = [sphinx_rtd_theme.get_html_theme_path()]

man_pages = [("index", "ansi-colors", "print numbers formatted using ANSI escape sequences", "Michael Christensen", 1)]

man_show_urls = False

man_make_section_directory = True
