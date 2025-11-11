import re

# Define the regex pattern
TAG_PATTERN = r'^[0-9a-zA-Z\-_+=,.@:]{1,255}$'

# Reserved values according to the requirement
RESERVED_NAMES = {".", "..", "_index"}

def is_valid_tag(tag_key: str) -> bool:
    """
    Validate a tag key based on a given regex pattern and reserved names.

    Args:
        tag_key (str): The tag key to be validated.

    Returns:
        bool: True if the tag key is valid, False otherwise.
    """
    if tag_key in RESERVED_NAMES:
        print(f"'{tag_key}' is a reserved name.")
        return False
        
    if re.match(TAG_PATTERN, tag_key):
        return True
    else:
        print(f"'{tag_key}' does not match the required pattern.")
        return False

# Test examples
test_tags = [
    'kubernetes.io/cluster/Rubrik-Exocompute-WQPEOI',
    'valid_tag_key',
    '.',
    '..',
    '_index',
    'another:valid@tag=key',
    'invalid tag key'
]

for tag in test_tags:
    print(f"Tag '{tag}' is valid: {is_valid_tag(tag)}")