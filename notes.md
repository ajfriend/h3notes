# trying to pip install from the repo

```python
# todo: h3._is_valid, hex2str, string_to_h3, h3_to_string
# gotta figure these out!
# do we want to say invalid, or just throw an error on crazy inputs?
```

# Error handling

- how to pop up error handling to the interface level?

# TOX

- figure out how to use tox. will it speed up my iteration?
- need to install tox globally `pip install -U tox`
- also need skbuild: `pip install -U scikit-build`
- `pip install -U pip`
- `pip install -U cython`
- does all this need to happen in the system python?

# verification,
- should i make an array version for checking cells are valid?
- how do we get segfaults?

# 2019-11-28

- make a `di_edge.pyx`?

# 2019-12-05

thoughts on a memory managing context manager

```
cpdef H3int[:] disk(H3int h, int k):
    """ Return cells at grid distance `<= k` from `h`.
    """
    check_cell(h)
    if k < 0:
        raise H3ValueError('Invalid ring size: {}'.format(k))

    n = h3lib.maxKringSize(k)

    with alloc(n) as mem:
        h3lib.kRing(h, k, mem.ptr)
        mv = mem.mv  # this should give the ownership to a memview, set mem.ptr = NULL
    # at exit, with block frees whatever is in mem.ptr

    return mv

    # OOOORRRRR: 
    with alloc(n) as m:
        h3lib.kRing(h, k, m.ptr)
        return m.mv
```

# 2019-12-14

- convert memoryview to cpython.array? can i do that?
    + can i then use `int resize(array self, Py_ssize_t n) except -1`
    + hey... what if i just don't realloc the array, but i do resize it...?

# 2019-12-15

- would a memview object (like i had before) be a better option?
    + that might let us handle things like empty memory view input/output more gracefully...
- nice notes on moving between memory types in cython: https://candide-guevara.github.io/cs_related/python/2018/02/28/cython-memory-mgt.html
- allocating speeds: https://stackoverflow.com/questions/18462785/what-is-the-recommended-way-of-allocating-memory-for-a-typed-memory-view

- should we use `bint` instead of `bool`?
    + https://cython.readthedocs.io/en/latest/src/tutorial/clibraries.html

