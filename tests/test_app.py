import unittest

from src.app import assess_password


class TestPasswordAssessment(unittest.TestCase):

    def test_short_password_is_weak(self):
        self.assertEqual(assess_password("abc"), "weak")

    def test_letters_only_password_is_moderate(self):
        self.assertEqual(assess_password("password"), "moderate")

    def test_mixed_password_is_strong(self):
        self.assertEqual(assess_password("abc123!@"), "strong")


if __name__ == "__main__":
    unittest.main()
    