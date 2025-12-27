import pandas as pd
import numpy as np

# Display options
pd.set_option('display.max_columns', None)
pd.options.display.float_format = '{:,.2f}'.format
pd.set_option('display.max_rows', 20)
pd.set_option('display.width', 120)

from rich import pretty, traceback

pretty.install()
traceback.install()
