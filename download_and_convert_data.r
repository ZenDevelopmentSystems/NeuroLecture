library(h2o)
library('stringr')

workdir='./'

h2oServer <- h2o.init(ip="localhost", port=54321, max_mem_size="1g", nthreads=-1)

download.file("https://s3.amazonaws.com/h2o-training/mnist/train.csv.gz",file.path(workdir,"train.csv.gz"), "wget", quiet = T)
download.file("https://s3.amazonaws.com/h2o-training/mnist/test.csv.gz",file.path(workdir,"test.csv.gz"), "wget", quiet = T)
train_hex <- h2o.importFile(h2oServer, path = file.path(workdir,"train.csv.gz"),header = F, sep = ',', key = 'train.hex')
test_hex <- h2o.importFile(h2oServer, path = file.path(workdir,"test.csv.gz"),header = F, sep = ',', key = 'test.hex')