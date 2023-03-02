import math

"""Nth prime number.

Get nth prime number

Args:
    num - nth prime number

Returns:
    some number, lol

Raises:
    Exception: TODO(tm)
"""


def n_prime(n):
    if n <= 0:
        return None
    elif n == 1:
        return 2

    primes = [2]
    limit = int(n * (math.log(n) + math.log(math.log(n))))
    sieve = [True] * limit
    for i in range(3, int(math.sqrt(limit)) + 1, 2):
        if sieve[i // 2]:
            for j in range(i * i, limit, i * 2):
                sieve[j // 2] = False

    for i in range(3, limit, 2):
        if sieve[i // 2]:
            primes.append(i)

    return primes[n - 1]
