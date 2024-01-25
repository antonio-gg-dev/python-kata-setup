import unittest

from src.change_me import ChangeMe


class ChangeMeTest(unittest.TestCase):

    def test_setup_is_working(self):
        change_me = ChangeMe()

        self.assertTrue(change_me.my_method())
