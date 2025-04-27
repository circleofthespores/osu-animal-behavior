library(bibliometrix)
library(knitr)


author_data <- convert2df(
    file = "data/author_records.bib",
    dbsource = "wos",
    format = "bibtex",
    remove.duplicates = T
)

collab_network <- biblioNetwork(
    author_data,
    analysis = "collaboration",
    network = "authors",
    sep = ";"
)

collab_network_plt <- networkPlot(
    collab_network,
    n = 30,
    Title = "Collaboration Network",
    type = "fruchterman",
    size = T,
    remove.multiple = FALSE,
    labelsize = 0.7,
    edgesize = 5
)
