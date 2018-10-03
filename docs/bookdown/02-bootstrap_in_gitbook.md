# Use Bootstrap Tables in gitbooks & epub

## Gitbook
Most of `kableExtra` tricks will work in `bookdown` except those requires [`bootstrap`](http://getbootstrap.com/). By default, `rmarkdown` won't load `bootstrap` for you on gitbook as it's not necesary. In `kableExtra`, I used the [bootstrap 3.3.7 customization tool](https://getbootstrap.com/docs/3.3/customize/) and made a customized css copy. You can load it by setting `options(kableExtra.html.bsTable = T)`. 


```r
library(kableExtra)
options(kableExtra.html.bsTable = T)

mtcars[1:5, 1:5] %>%
  kable(booktabs = T) %>% 
  kable_styling(
    bootstrap_options = c("striped","hover", "bordered"),
    latex_options = c("striped"),
    full_width = F
  ) %>%
  column_spec(1, color = "red") %>%
  add_header_above(c(" ", "Group A" = 2, "Group B" = 3))
```

<table class="table table-striped table-hover table-bordered" style="width: auto !important; margin-left: auto; margin-right: auto;">
 <thead>
<tr>
<th style="border-bottom:hidden" colspan="1"></th>
<th style="border-bottom:hidden; padding-bottom:0; padding-left:3px;padding-right:3px;text-align: center; " colspan="2"><div style="border-bottom: 1px solid #ddd; padding-bottom: 5px; ">Group A</div></th>
<th style="border-bottom:hidden; padding-bottom:0; padding-left:3px;padding-right:3px;text-align: center; " colspan="3"><div style="border-bottom: 1px solid #ddd; padding-bottom: 5px; ">Group B</div></th>
</tr>
  <tr>
   <th style="text-align:left;">   </th>
   <th style="text-align:right;"> mpg </th>
   <th style="text-align:right;"> cyl </th>
   <th style="text-align:right;"> disp </th>
   <th style="text-align:right;"> hp </th>
   <th style="text-align:right;"> drat </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;color: red;"> Mazda RX4 </td>
   <td style="text-align:right;"> 21.0 </td>
   <td style="text-align:right;"> 6 </td>
   <td style="text-align:right;"> 160 </td>
   <td style="text-align:right;"> 110 </td>
   <td style="text-align:right;"> 3.90 </td>
  </tr>
  <tr>
   <td style="text-align:left;color: red;"> Mazda RX4 Wag </td>
   <td style="text-align:right;"> 21.0 </td>
   <td style="text-align:right;"> 6 </td>
   <td style="text-align:right;"> 160 </td>
   <td style="text-align:right;"> 110 </td>
   <td style="text-align:right;"> 3.90 </td>
  </tr>
  <tr>
   <td style="text-align:left;color: red;"> Datsun 710 </td>
   <td style="text-align:right;"> 22.8 </td>
   <td style="text-align:right;"> 4 </td>
   <td style="text-align:right;"> 108 </td>
   <td style="text-align:right;"> 93 </td>
   <td style="text-align:right;"> 3.85 </td>
  </tr>
  <tr>
   <td style="text-align:left;color: red;"> Hornet 4 Drive </td>
   <td style="text-align:right;"> 21.4 </td>
   <td style="text-align:right;"> 6 </td>
   <td style="text-align:right;"> 258 </td>
   <td style="text-align:right;"> 110 </td>
   <td style="text-align:right;"> 3.08 </td>
  </tr>
  <tr>
   <td style="text-align:left;color: red;"> Hornet Sportabout </td>
   <td style="text-align:right;"> 18.7 </td>
   <td style="text-align:right;"> 8 </td>
   <td style="text-align:right;"> 360 </td>
   <td style="text-align:right;"> 175 </td>
   <td style="text-align:right;"> 3.15 </td>
  </tr>
</tbody>
</table>

However, very unfortunately, as we can see, the `hover` part is not working and the table still looks different from a regular bootstrap table. The reason is that gitbook defines its own way to style tables and some of its rules are conflicting with the one defined in bootstrap. For css, it's like once you load something, it's impossible to really unload it. As a result, unless there are some changes in `bookdown` (for example, we can replace the gitbook table part with bootstrap tables), there is nothing we can do here. 

## Epub
Right now, it's impossible to load addition CSS through HTML dependency (due to a setting in rmarkdown). I will file an issue in `rmarkdown` and see if this is something that can be changed. In the mean time, to use bootstrap tables in Epub, you will have to manually load [this stylesheet](https://github.com/haozhu233/kableExtra/blob/master/inst/bootstrapTable-3.3.7/bootstrapTable.min.css) by putting it to a CSS file (such as "style.css") and load it in `_output.yml`. For example,

```
bookdown::epub_book: 
  stylesheet: style.css
```