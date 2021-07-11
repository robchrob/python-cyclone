def fibonacci(n):
    """Get n-th fibonacci number.

    Uses funny _ notation and range, also swapping values.

    Args:
        n: N-th (>=0) fibonacci number

    Returns:
        A number that is N-th fibonacci number
        example:
        fibonacci(1) = 1

    Raises:
        Exception: because why not.
    """

    a, b = 0, 1
    for _ in range(n):
        a, b = b, a + b
    return a


def collatz_element(n):
    if n % 2 == 0:
        return n / 2
    else:
        return 3 * n + 1
