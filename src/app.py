def assess_password(password: str) -> str:
    """Return a basic password-strength assessment."""

    if len(password) < 8:
        return "weak"

    if password.isalpha() or password.isdigit():
        return "moderate"

    return "strong"