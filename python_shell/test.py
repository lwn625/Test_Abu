import subprocess
import numpy as np

process_out1=subprocess.run(['ls','-l'],stdout=subprocess.PIPE)
print(process_out1.stdout.decode('utf-8'))
