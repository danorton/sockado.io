
def setup_function(fun):
    print 'setting up %s' % (fun.__name__)
    """ setup any state tied to the execution of the given function.
    Invoked for every test function in the module.
    """


def teardown_function(fun):
    print 'tearing down %s' % (fun.__name__)
    """ teardown any state that was previously setup with a setup_function
    call.
    """


def test_main_1():
    assert True


def test_main_2():
    assert True
