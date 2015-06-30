library(h2o)
h2oServer <- h2o.init(ip="localhost", port=54321, max_mem_size="1g", nthreads=-1)
homedir <- "./"
TRAIN = "train.csv.gz"
TEST = "test.csv.gz"
train_hex <- h2o.importFile(h2oServer, path = paste0(homedir,TRAIN), header = F, sep = ',', key = 'train.hex')
test_hex <- h2o.importFile(h2oServer, path = paste0(homedir,TEST), header = F, sep = ',', key = 'test.hex')
dlmodel <- h2o.deeplearning(x=1:784, y=785, data=train_hex, validation=test_hex,hidden=c(50,50), epochs=1)