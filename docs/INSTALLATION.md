Before installing Idris, you will need to make sure you have all of the necessary libraries and tools. You will need:

 *  A fairly recent Haskell platform. Version 2013.2.0.0 should be sufficiently recent, though it is better to be completely up to date.
 *  The GNU Multiple Precision Arithmetic Library (GMP) is available from MacPorts/Homebrew and all major Linux distributions.


The easiest way to install Idris, if you have all of the prerequisites, is to type:

```shell
cabal update; cabal install idris
```

This will install the latest version released on Hackage, along with any dependencies. 
If, however, you would like the most up to date development version you can find it, 
as well as build instructions, on GitHub at: https://github.com/idris-lang/Idris-dev.
