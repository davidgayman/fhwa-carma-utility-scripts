# Import PWD so further imports refer to subpackages directly.
# Usage from source and test code:
#   import package
#   import subpackage1
#   import subpackage2
import os, sys
current_dir = os.path.dirname(os.path.abspath(__file__))
sys.path.append(current_dir)
