# soal 1 a

responden = c(seq(1:9))
X = c(78, 75, 67, 77, 70, 72, 78, 74, 77)
Y = c(100, 95, 70, 90, 90, 90, 89, 90, 100)
table = data.frame(responden, X, Y)
n = 9

dif = table$Y - table$X
cat("Standart Deviasi dari selisih pengamatan adalah = ")
SD = sd(dif)
SD

cat("nilai p value dapat dicari menggunakan t.test : ")
t.test(Y, X, paired = TRUE)


