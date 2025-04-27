library(bibliometrix)
library(knitr)

# Load the BibTex file into a dataframe
author_data <- convert2df(
    file = "data/author_records.bib",
    dbsource = "wos",
    format = "bibtex",
    remove.duplicates = T
)

# create the collaboration network
collab_network <- biblioNetwork(
    author_data,
    analysis = "collaboration",
    network = "authors",
    sep = ";"
)

# plot the collaboration network so we can visualize the clusters
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

# Create a table of the top 10 most cited authors
top_cited <- author_data[
    order(-author_data$TC), c("AU", "DT", "TC"),
][1:10, ]
# export it so we can grab the data
write.csv(top_cited, "data/top_cited.csv", row.names = FALSE)
