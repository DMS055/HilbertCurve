# HilbertCurve

A simple Java program for visualising the Hilbert Curve (a space-filling curve) written using the Processing 3 evniorment.

Inspired by the one and only Daniel Shiffman and [Marcin Chwedczuk's algorithm for drawing Hilbert curve](http://blog.marcinchwedczuk.pl/iterative-algorithm-for-drawing-hilbert-curve).

**Note: this is not a pure Java project, it doesn't include a grphic lib, it uses the default one from Processing 3, so it won't work if run as an independent file!**

## Some additional info
**You can change the way the complete curve is being presented by changing:**
```java
  for (int i = 1; i < total; i++)
```
**to**
```java
beginShape();
...
  for (int i = 1; i < iterator; i++)
endShape();
```
