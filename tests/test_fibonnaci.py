from app.math_func import fibonacci


def test_fibonacci_basic_init():
    assert fibonacci(0) == 0
    assert fibonacci(1) == 1


def test_fibonacci_2():
    assert fibonacci(2) == 1


def test_fibonacci_3():
    assert fibonacci(3) == 2
