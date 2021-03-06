% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/column_spec.R
\name{column_spec}
\alias{column_spec}
\title{Specify the look of the selected column}
\usage{
column_spec(
  kable_input,
  column,
  width = NULL,
  bold = FALSE,
  italic = FALSE,
  monospace = FALSE,
  underline = FALSE,
  strikeout = FALSE,
  color = NULL,
  background = NULL,
  border_left = FALSE,
  border_right = FALSE,
  width_min = NULL,
  width_max = NULL,
  extra_css = NULL,
  include_thead = FALSE,
  latex_column_spec = NULL
)
}
\arguments{
\item{kable_input}{Output of \code{knitr::kable()} with \code{format} specified}

\item{column}{A numeric value or vector indicating which column(s) to be selected.}

\item{width}{A character string telling HTML & LaTeX how wide the column
needs to be, e.g. "10cm", "3in" or "30em".}

\item{bold}{A T/F value to control whether the text of the selected column
need to be bolded.}

\item{italic}{A T/F value to control whether the text of the selected column
need to be emphasized.}

\item{monospace}{A T/F value to control whether the text of the selected column
need to be monospaced (verbatim)}

\item{underline}{A T/F value to control whether the text of the selected row
need to be underlined}

\item{strikeout}{A T/F value to control whether the text of the selected row
need to be stricked out.}

\item{color}{A character string for column text color. Here please pay
attention to the differences in color codes between HTML and LaTeX.}

\item{background}{A character string for column background color. Here please
pay attention to the differences in color codes between HTML and LaTeX.}

\item{border_left}{A logical variable indicating whether there should be a
border line on the left of the selected column. In HTML, you can also pass
in a character string for the CSS of the border line}

\item{border_right}{A logical variable indicating whether there should be a
border line on the right of the selected column. In HTML, you can also pass
in a character string for the CSS of the border line}

\item{width_min}{Only for HTML table. Normal column width will automatically
collapse when the window cannot hold enough contents. With this \code{width_min},
you can set up a column with a width that won't collapse even when the
window is not wide enough.}

\item{width_max}{Only for HTML table. \code{width_max} defines the maximum width
of table columns.}

\item{extra_css}{Extra css text to be passed into the cells of the row. Note
that it's not for the whole column but to each individual cells}

\item{include_thead}{T/F. A HTML only feature to contoll whether the
header row will be manipulated. Default is \code{FALSE}.}

\item{latex_column_spec}{Only for LaTeX tables.  Code to replace the column
specification.  If not \code{NULL}, will override all other arguments.}
}
\description{
This function allows users to select a column and then specify
its look.
}
\details{
Use \code{latex_column_spec} in a LaTeX table to change or
customize the column specification.  Because of the way it is handled
internally, any backslashes must be escaped.
}
\examples{
x <- knitr::kable(head(mtcars), "html")
column_spec(x, 1:2, width = "20em", bold = TRUE, italic = TRUE)
x <- knitr::kable(head(mtcars), "latex", booktabs = TRUE)
column_spec(x, 1, latex_column_spec = ">{\\\\\\\\color{red}}c")
}
