En esta sencilla app, usted encontrara una serie de solapas que permiten
que usted navegue por algunas caracteristicas relacionadas con un set de
datos generado de una manera aleatoria, y del tamaño que usted decida
entre 2 y 10000 numeros aleatorios con distribucion normal con media
*m**u* y desviacion estandar de *s**i**g**m**a*.

\$f(x)=\\frac{1}{\\sigma \\sqrt{2\\pi}} \\exp \\left [ - \\frac{(x-\\mu)\^2}{2 \\sigma\^2} \\right ].\$

    set.seed(1)
    dist<-rnorm(5000,10,1)
    hist(dist,main="Histogram of Random Points",50)

![plot of chunk
unnamed-chunk-1](./Docu_files/figure-markdown_strict/unnamed-chunk-1.png)

por defecto se encuentra el slide en 5000 puntos por defecto,*m**u* = 10
y *s**i**g**m**a* = 1
