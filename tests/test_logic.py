import pytest

from cyclone.logic import n_prime


def test_true():
    assert n_prime(1337) == 11027


def test_false():
    assert n_prime(666) != 2137


def test_corner():
    assert n_prime(0) is None


def test_corner_type():
    with pytest.raises(ValueError):
        n_prime(0.1)


def test_corner_type2():
    with pytest.raises(TypeError):
        n_prime("str")
