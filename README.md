# Launch Interceptor Program

This project consists of an implementation of a function `decide` which is part of a hypothetical anti-ballistic missile system. The function analyses radar tracking information, consisting of a collection of planar point coordinates, and returns a boolean signal which determines whether an interceptor should be launched based on this information.

The project is a part of the course [Software Engineering and Cloud Computing](https://kth.instructure.com/courses/9098). The assignment is based upon the material in the article *"An experimental evaluation of the assumption of independence in multiversion programming", J.C. Knight and N. G. Leveson, IEEE Transactions on Software Engineering 12(1):96-109, January 1986*.

## Inputs and Outputs of `decide`
### Inputs
The `decide` function has the following inputs:
* `points`: A matrix containing the coordinates of data points `(xi,yi)` on the format `[x1 y1; x2 y2; ...]`.
* `parameters`: A struct containing parameters for the Launch Interceptor Conditions (LICs).
* `lcm`: Logical Connector Matrix with elements `0 = notused`, `1 = or`, `2 = and`.
* `puv`: Preliminary Unlocking Vector.

### Outputs
The `decide` function has the following outputs:
* `launch`: Final launch/no launch decision encoded as `YES` or `NO` (standard output).
* `cmv`: Conditions Met Vector.
* `pum`: Preliminary Unlocking Matrix.
* `fuv`: Final Unlocking Vector.

## Description of the `decide` Function
The `decide` function computes whether 15 different *Launch Interceptor Conditions (LICs)* are fulfilled. Each of the LIC functions has as inputs the x-coordinates `x` and the y-coordinates `y` of the points in `points`, as well as some of the parameters in `parameters`. The results are stored in the 15-dimensional Conditions Met Vector `cmv`, such that `cmv(i) = 1` if LIC i is met and `cmv(i) = 0` if not.

The *Logical Connector Matrix* `lcm` (size 15 x 15) has as entries `0`, `1` and `2`, to be interpreted as `0 = notused`, `1 = or`, `2 = and`. This matrix represents connections between the different LICs. Using `lcm`, the results of the LICs in `cmv` are combined to form the *Preliminary Unlocking Matrix* `pum` (size 15 x 15). This proceeds as follows:
* If `lcm(i,j) = 0` (`notused`), then `pum(i,j) = 1` (`true`).
* If `lcm(i,j) = 1` (`or`), then `pum(i,j) = 1` (`true`) if `cmv(i) = 1` or `cmv(j) = 1`, and `pum(i,j) = 0` otherwise.
* If `lcm(i,j) = 2` (`and`), then `pum(i,j) = 1` (`true`) if `cmv(i) = 1` and `cmv(j) = 1`, and `pum(i,j) = 0` otherwise.

The input *Preliminary Unlocking Vector* `puv` (lenght 15) has elements `puv(i) = 1` if LIC i should be considered as a factor in signaling interceptor launch and `puv(i) = 0` if it should not.

The *Final Unlocking Vector* `fuv` (length 15) is constructed according to:
* `fuv(i) = 1` if `puv(i) = 0` (i.e., if LIC i should not be considered).
* `fuv(i) = 1` if `puv(i) = 1` and all elements of row `i` in `pum` are `1` (`true`).
* `fuv(i) = 0` otherwise.

Finally, the decision `launch` is set to `YES` if all entries of `fuv` are true (`1`) and to `NO` otherwise.

## How to use it?
The main program `main.m` defines example inputs to the `decide` function, invokes the function and prints the outputs (of which the first one is the decision `launch = 'YES'` or `launch = 'NO'`). The meanings of the parameters as well as the general evaluation criteria for the LICs are described in the comments of each function `lic1.m`, ..., `lic15.m` which are located in the folder `conditions`. The program `main.m` can be run as it is to illustrate the functioning of the `decide` function. The user can then try to modify the paramters in `parameters`, the entries of the Logical Connector Matrix `lcm` (where each entry should be an integer according to `0 = notused`, `1 = or` and `2 = and`), the Preliminary Unlocking Vector `puv` (where each entry is `0` or `1` corresponding to `false` or `true`) as well as the data point matrix `points = [x1 y1; x2 y2; ...]`.
