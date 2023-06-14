## Defining age transformations
## Author: Joseph Zoller

#' Identity Function
#' @description Apply no transformation to age.
#'
#' @param x Numeric, the age in years
#' @param ... A catch-all for extra arguments (which will not be used) to allow
#'   pipeline functions to always pass 2 parameters into age transformation
#'   functions
#'
#' @return A numeric, the identical value as the input.
#' @examples
#' fun_identity(1)
#' fun_identity(c(1,2,1))
#' @export
fun_identity <- function(x, ...) x

#' Square-Root Transformation and Inverse
#' @description Apply the square root transformation to age, or undo the square
#'   root transformation to calculate DNAm age.
#'
#' @param x Numeric, the age in years
#' @param y Numeric, the transformed value of age (the un-transformed age is in
#'   years)
#' @param ... A catch-all for extra arguments (which will not be used) to allow
#'   pipeline functions to always pass 2 parameters into age transformation
#'   functions
#'
#' @details The square root transformation of age is defined as \deqn{SqrtAge =
#'   sqrt(Age+1)} The inverse of the square root transformation of age is
#'   defined as \deqn{Age = (SqrtAge)^2-1}
#'
#' @return A numeric, the transformed or inverse-transformed value of the input.
#' @examples
#' fun_sqrt.trans(1)
#' fun_sqrt.trans(c(1,2,1))
#' fun_sqrt.inv(1)
#' fun_sqrt.inv(c(1,2,1))
#' @export
fun_sqrt.trans <- function(x, ...) sqrt(x+1)
#' @export
#' @rdname fun_sqrt.trans
fun_sqrt.inv <- function(y, ...) y^2-1

#' Logarithmic Transformation and Inverse
#' @description Apply the logarithmic transformation to age, or undo the
#'   logarithmic transformation to calculate DNAm age.
#'
#' @param x Numeric, the age in years
#' @param y Numeric, the transformed value of age (the un-transformed age is in
#'   years)
#' @param ... A catch-all for extra arguments (which will not be used) to allow
#'   pipeline functions to always pass 2 parameters into age transformation
#'   functions
#'
#' @details The logarithmic transformation of age is defined as \deqn{LogAge =
#'   log(Age+1)} The inverse of the logarithmic transformation of age is defined
#'   as \deqn{Age = exp(LogAge)-1}
#'
#' @return A numeric, the transformed or inverse-transformed value of the input.
#' @examples
#' fun_log.trans(1)
#' fun_log.trans(c(1,2,1))
#' fun_log.inv(1)
#' fun_log.inv(c(1,2,1))
#' @export
fun_log.trans <- function(x, ...) log(x+1)
#' @export
#' @rdname fun_log.trans
fun_log.inv <- function(y, ...) exp(y)-1

#' Logarithmic v2 Transformation and Inverse
#' @description Apply the logarithmic transformation to age, or undo the
#'   logarithmic transformation to calculate DNAm age.
#'
#' @param x Numeric, the age in years
#' @param y Numeric, the transformed value of age (the un-transformed age is in
#'   years)
#' @param ... A catch-all for extra arguments (which will not be used) to allow
#'   pipeline functions to always pass 2 parameters into age transformation
#'   functions
#'
#' @details The logarithmic transformation of age is defined as \deqn{Log2Age =
#'   log(Age+0.5)} The inverse of the logarithmic transformation of age is defined
#'   as \deqn{Age = exp(Log2Age)-0.5}
#'
#' @return A numeric, the transformed or inverse-transformed value of the input.
#' @examples
#' fun_log.trans(1)
#' fun_log.trans(c(1,2,1))
#' fun_log.inv(1)
#' fun_log.inv(c(1,2,1))
#' @export
fun_log2.trans <- function(x, ...) log(x+0.5)
#' @export
#' @rdname fun_log2.trans
fun_log2.inv <- function(y, ...) exp(y)-0.5

#' Relative Age Transformation and Inverse
#' @description Convert age into relative age, or convert relative age into age.
#'
#' @param x Numeric, the age in years
#' @param y Numeric, the transformed value of age (the un-transformed age is in
#'   years)
#' @param max Numeric, the maximum lifespan in years
#'
#' @details Relative age is defined as \deqn{RelAge = \frac{Age}{max}} Relative
#'   age is converted back to Age via \deqn{Age = max*RelAge}
#'
#' @return A numeric, the transformed or inverse-transformed value of the input.
#' @examples
#' fun_relative.trans(1,10)
#' fun_relative.trans(c(1,2,1),10)
#' fun_relative.trans(c(1,2,1),c(10,50,100))
#' fun_relative.inv(0.1,10)
#' fun_relative.inv(c(0.1,0.2,0.1),10)
#' fun_relative.inv(c(0.1,0.2,0.1),c(10,50,100))
#' @export
fun_relative.trans <- Vectorize(function(x, max) {
  if (is.na(max)) {return(NA)}
  y <- x/max
  return(y)
})
#' @export
#' @rdname fun_relative.trans
fun_relative.inv <- Vectorize(function(y, max) {
  if (is.na(max)) {return(NA)}
  x <- max*y
  return(x)
})

#' Log-Linear v1 Transformation and Inverse
#' @description Apply the Log-Linear v1 transformation to age, or undo the
#'   Log-Linear v1 transformation to calculate DNAm age. Requires age of sexual
#'   maturity and maximum lifespan.
#'
#' @param x Numeric, the age in years
#' @param y Numeric, the transformed value of age (the un-transformed age is in
#'   years)
#' @param maturity Numeric, the age of sexual maturity in years
#' @param max Numeric, the maximum lifespan in years
#'
#' @details The Log-Linear v1 transformation of age is defined as \deqn{LLinAge
#'   = \left\{ \begin{array}{cl} \log\left(\frac{Age+k}{maturity+k}\right) & , \
#'   Age \leq maturity \\ \frac{Age-maturity}{maturity+k} & , \ Age \geq
#'   maturity \end{array} \right. ,} where \eqn{k} is the offset parameter.
#'
#'   The inverse of the Log-Linear v1 transformation of age is defined as
#'   \deqn{Age = \left\{ \begin{array}{cl} (maturity+k)*e^{LLinAge} - k & , \
#'   LLinAge \leq 0 \\ (maturity+k)*LLinAge + maturity & , \ LLinAge \geq 0
#'   \end{array} \right. ,} where \eqn{k} is the offset parameter.
#'
#'   This transformation is only defined under the condition \deqn{max >
#'   3*maturity + 2.}
#'
#'   \eqn{k} is a function of maturity and max, and is defined as the unique
#'   solution to \deqn{(k+maturity)*\log\left(\frac{k+maturity}{k-1}\right) =
#'   \frac{max-maturity}{2}.} Intuitively, \eqn{k} is defined this way so that
#'   the linear piece of the function is twice the size of the logarithmic piece
#'   in the co-domain.
#'
#' @return A numeric, the transformed or inverse-transformed value of the input.
#' @examples
#' fun_llin.trans(1,1,10)
#' fun_llin.trans(c(1,2,1),1,10)
#' fun_llin.trans(c(1,2,1),c(1,10,10),c(10,50,100))
#' fun_llin.inv(0,1,10)
#' fun_llin.inv(c(0,-1,1),1,10)
#' fun_llin.inv(c(0,-1,1),c(1,10,10),c(10,50,100))
#' @export
fun_llin.trans <- Vectorize(function(x, maturity, max) {
  if (is.na(x) | is.na(maturity) | is.na(max)) {return(NA)}
  k <- fun_llin.trans.param(maturity, max)
  if (is.na(k)) {return(NA)}
  y <- 0
  if (x < maturity) {y = log((x+k)/(maturity+k))}
  else {y = (x-maturity)/(maturity+k)}
  return(y)
})
#' @export
#' @rdname fun_llin.trans
fun_llin.inv <- Vectorize(function(y, maturity, max) {
  if (is.na(y) | is.na(maturity) | is.na(max)) {return(NA)}
  k <- fun_llin.trans.param(maturity, max)
  if (is.na(k)) {return(NA)}
  x <- 0
  if (y < 0) {x = (maturity+k)*exp(y)-k}
  else {x = (maturity+k)*y+maturity}
  return(x)
})
### Internal helper function to calculate k in LLin transform
fun_llin.trans.param <- Vectorize(function(maturity, max) {
  if (is.na(maturity) | is.na(max)) {
    print("WARNING: maturity or max is NA")
    return(NA)
  }
  N = max/(maturity)
  if (max <= 3*maturity+2) {
    print("WARNING: maturity-max inequality condition is not met.")
    return(NA)
  }
  k_lower = 1 + maturity/exp(N-1)
  k_upper = 1 + 2*(maturity+1)^2/(maturity*(N-3)-2)
  k_interval = c(k_lower, k_upper)
  k = uniroot(function(k) {(k+maturity)*log((k+maturity)/(k-1))-(max-maturity)/2},k_interval)$root
  return(k)
})

#' Log-Linear v2 Transformation and Inverse
#' @description Apply the Log-Linear v2 transformation to age, or undo the
#'   Log-Linear v2 transformation to calculate DNAm age. Requires age of sexual
#'   maturity and gestational period.
#'
#' @param x Numeric, the age in years
#' @param y Numeric, the transformed value of age (the un-transformed age is in
#'   years)
#' @param maturity Numeric, the age of sexual maturity in years
#' @param gestation Numeric, the gestational period in years
#'
#' @details The Log-Linear v2 transformation of age is defined as \deqn{LLin2Age
#'   = \left\{ \begin{array}{cl}
#'   \log\left(\frac{Age+gestation}{1.5*maturity+gestation}\right) & , \ Age
#'   \leq 1.5*maturity \\ \frac{Age-1.5*maturity}{1.5*maturity+gestation} & , \
#'   Age \geq 1.5*maturity \end{array} \right. .}
#'
#'   The inverse of the Log-Linear v2 transformation of age is defined as
#'   \deqn{Age = \left\{ \begin{array}{cl} (1.5*maturity+gestation)*e^{LLin2Age}
#'   - gestation & , \ LLin2Age \leq 0 \\ (1.5*maturity+gestation)*LLin2Age +
#'   1.5*maturity & , \ LLin2Age \geq 0 \end{array} \right. .}
#'
#' @return A numeric, the transformed or inverse-transformed value of the input.
#' @examples
#' fun_llin2.trans(1,1,0.05)
#' fun_llin2.trans(c(1,2,1),1,0.05)
#' fun_llin2.trans(c(1,2,1),c(1,10,10),c(0.05,0.25,0.5))
#' fun_llin2.inv(0,1,0.05)
#' fun_llin2.inv(c(0,-1,1),1,0.05)
#' fun_llin2.inv(c(0,-1,1),c(1,10,10),c(0.05,0.25,0.5))
#' @export
fun_llin2.trans <- Vectorize(function(x, maturity, gestation) {
  if (is.na(x) | is.na(maturity) | is.na(gestation)) {return(NA)}
  k <- gestation
  y <- 0
  if (x <= -k) {return(NA)}
  if (x < 1.5*maturity) {y = log((x+k)/(1.5*maturity+k))}
  else {y = (x-1.5*maturity)/(1.5*maturity+k)}
  return(y)
})
#' @export
#' @rdname fun_llin2.trans
fun_llin2.inv <- Vectorize(function(y, maturity, gestation) {
  if (is.na(y) | is.na(maturity) | is.na(gestation)) {return(NA)}
  k <- gestation
  x <- 0
  if (y < 0) {x = (1.5*maturity+k)*exp(y)-k}
  else {x = (1.5*maturity+k)*y+1.5*maturity}
  return(x)
})

#' Log-Linear v3 Transformation and Inverse
#' @description Apply the Log-Linear v3 transformation to age, or undo the
#'   Log-Linear v3 transformation to calculate DNAm age. Requires age of sexual
#'   maturity.
#'
#' @param x Numeric, the age in years
#' @param y Numeric, the transformed value of age (the un-transformed age is in
#'   years)
#' @param maturity Numeric, the age of sexual maturity in years
#' @param ... A catch-all for extra arguments (which will not be used) to allow
#'   pipeline functions to always pass 2 parameters into age transformation
#'   functions
#'
#' @details The Log-Linear v3 transformation of age is defined as \deqn{LLin3Age
#'   = \left\{ \begin{array}{cl} \log\left(\frac{Age+1.5}{maturity+1.5}\right) &
#'   , \ Age \leq maturity \\ \frac{Age-maturity}{maturity+1.5} & , \ Age \geq
#'   maturity \end{array} \right. .}
#'
#'   The inverse of the Log-Linear v3 transformation of age is defined as
#'   \deqn{Age = \left\{ \begin{array}{cl} (maturity+1.5)*e^{LLin3Age} - 1.5 & ,
#'   \ LLin3Age \leq 0 \\ (maturity+1.5)*LLin3Age + maturity & , \ LLin3Age \geq
#'   0 \end{array} \right. .}
#'
#' @return A numeric, the transformed or inverse-transformed value of the input.
#' @examples
#' fun_llin3.trans(1,1)
#' fun_llin3.trans(c(1,2,1),1)
#' fun_llin3.trans(c(1,2,1),c(1,10,10))
#' fun_llin3.inv(0,1)
#' fun_llin3.inv(c(0,-1,1),1)
#' fun_llin3.inv(c(0,-1,1),c(1,10,10))
#' @export
fun_llin3.trans <- Vectorize(function(x, maturity, ...) {
  if (is.na(x) | is.na(maturity)) {return(NA)}
  k <- 1.5
  y <- 0
  if (x < maturity) {y = log((x+k)/(maturity+k))}
  else {y = (x-maturity)/(maturity+k)}
  return(y)
})
#' @export
#' @rdname fun_llin3.trans
fun_llin3.inv <- Vectorize(function(y, maturity, ...) {
  if (is.na(y) | is.na(maturity)) {return(NA)}
  k <- 1.5
  x <- 0
  if (y < 0) {x = (maturity+k)*exp(y)-k}
  else {x = (maturity+k)*y+maturity}
  return(x)
})

#' Log-Linear Relative Adult Transformation and Inverse
#' @description Apply the Log-Linear Relative Adult transformation to age, or
#'   undo the Log-Linear Relative Adult transformation to calculate DNAm age.
#'   Requires age of sexual maturity and gestational period.
#'
#'   This is the transformation used to parameterize the Universal Mammalian
#'   "Clock 3" (Lu et. al., 2023).
#'
#' @param x Numeric, the age in years
#' @param y Numeric, the transformed value of age (the un-transformed age is in
#'   years)
#' @param maturity Numeric, the age of sexual maturity in years
#' @param gestation Numeric, the gestational period in years
#'
#' @details The Log-Linear Relative Adult transformation of age is defined, in
#'   two steps, as \deqn{LLinRelAdultAge = \left\{ \begin{array}{cl}
#'   \log\left(\frac{RelAdultAge}{\hat{m}}\right) & , \ RelAdultAge \leq
#'   \hat{m} \\ \frac{RelAdultAge-\hat{m}}{\hat{m}} & , \ RelAdultAge \geq
#'   \hat{m} \end{array} \right. ,} where \deqn{RelAdultAge =
#'   \frac{Age+gestation}{maturity+gestation},} \deqn{\hat{m} =
#'   5.0*\left(\frac{gestation}{maturity}\right)^{0.38}.}
#'
#'   The inverse of the Log-Linear Relative Adult transformation of age is
#'   defined, in two steps, as \deqn{Age = (maturity+gestation)*RelAdultAge -
#'   gestation,} where \deqn{RelAdultAge = \left\{ \begin{array}{cl}
#'   \hat{m}*e^{LLinRelAdultAge} & , \ LLinRelAdultAge \leq 0 \\
#'   \hat{m}*LLinRelAdultAge + \hat{m} & , \ LLinRelAdultAge \geq 0 \end{array}
#'   \right. ,} \deqn{\hat{m} =
#'   5.0*\left(\frac{gestation}{maturity}\right)^{0.38}.}
#'
#' @return A numeric, the transformed or inverse-transformed value of the input.
#' @examples
#' fun_llinreladult.trans(1,1,0.05)
#' fun_llinreladult.trans(c(1,2,1),1,0.05)
#' fun_llinreladult.trans(c(1,2,1),c(1,10,10),c(0.05,0.25,0.5))
#' fun_llinreladult.inv(0,1,0.05)
#' fun_llinreladult.inv(c(0,-1,1),1,0.05)
#' fun_llinreladult.inv(c(0,-1,1),c(1,10,10),c(0.05,0.25,0.5))
#' @export
fun_llinreladult.trans <- Vectorize(function(x, maturity, gestation) {
  if (is.na(x) | is.na(maturity) | is.na(gestation)) {return(NA)}
  k <- 2*gestation
  y <- 0
  if (x <= -k) {return(NA)}
  if (x < maturity) {y = log((x+k)/(maturity+k))}
  else {y = (x-maturity)/(maturity+k)}
  return(y)
})
#' @export
#' @rdname fun_llinreladult.trans
fun_llinreladult.inv <- Vectorize(function(y, maturity, gestation) {
  if (is.na(y) | is.na(maturity) | is.na(gestation)) {return(NA)}
  k <- 2*gestation
  x <- 0
  if (y < 0) {x = (maturity+k)*exp(y)-k}
  else {x = (maturity+k)*y+maturity}
  return(x)
})


