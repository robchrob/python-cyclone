from app.math_func import collatz_element


def test_collatz_init():
    assert collatz_element(0) == 0


def test_collatz_1():
    assert collatz_element(1) == 4


def test_collatz_2():
    assert collatz_element(1) == 4
