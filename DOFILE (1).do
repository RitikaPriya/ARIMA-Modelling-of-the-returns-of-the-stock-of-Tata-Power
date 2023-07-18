import excel "C:\Users\Nandita\Downloads\DATA FE.xlsx", sheet("Sheet1") firstrow
gen time=_n
tsset time
rename CLOSE close
label variable close "close"
gen returns=D.close/L.close
runtest returns
tsline returns
dfuller returns
ac returns
pac returns
arima returns,arima(5,0,5)
estat ic
arima returns,arima(6,0,5)
estat ic
arima returns,arima(6,0,6)
estat ic
arima returns,arima(5,0,6)
estat ic
predict error, resid
summarize error
mean error
tsline error, yline(-2.41e-06)
wntestq error
arima returns,arima(5,0,6)
estat aroots
tsappend,add(10)
bro
predict freturns, y dynamic(1235)
label variable freturns "Forecasted Returns"
tsline returns freturns
gen fe = returns - freturns
gen sfe = fe^2
sum sfe if time>1229
gen ct = (returns>0 & freturns>0)
tsline returns freturns
arima returns if t<=1230,arima(5,0,6)
sum sfe if t>1229
gen cp=(returns>0 & freturns >0)
gen cn=(returns<=0 & freturns<=0)
gen correct=cp+cn
sum correct if t>1229
sum correct if t>1234
sum correct
