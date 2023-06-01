# Genetic_Algorithm
This repository contains an implementation of a Genetic Algorithm-based approach for obtaining PID (Proportional-Integral-Derivative) parameters. The Genetic Algorithm is used to optimize the PID controller's parameters for improved system performance.

# Usage
To use this algorithm, follow the steps below:

1. Define the transfer function (tf) and other parameters specific to your system.
2. Run the ga_pid function, which executes the Genetic Algorithm process to obtain the optimal PID parameters.
3. After the mutation process is complete, you can access the optimized PID parameters from the variable x.
4. To evaluate the performance of the tuned model, use the pid_test(G, dt, x) function, which provides the step response of the system using the optimized PID parameters.

Please note that you may need to modify the code and provide your own transfer function and other system-specific parameters to suit your requirements.

# Reference
Brunton, S., & Kutz, J. (2019). Frontmatter. In Data-Driven Science and Engineering: Machine Learning, Dynamical Systems, and Control (pp. I-Iv). Cambridge: Cambridge University Press.
