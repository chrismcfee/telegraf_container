import datetime
import os


# user defined variable to set up
# file=

def parse_file(filename):
    with open(filename, 'r') as file:
        lines = file.readlines()

    domains = []
    for line in lines:
        # Skipping empty lines and lines not containing 'notAfter'
        if not line.strip() or 'notAfter' not in line:
            continue

        # Assuming the domain is on the previous line
        domain_index = lines.index(line) - 1
        if domain_index >= 0:
            domain = lines[domain_index].strip()
            not_after_str = line.strip().split('=')[1]
            not_after_date = datetime.datetime.strptime(not_after_str, '%b %d %H:%M:%S %Y GMT')
            domains.append((domain, not_after_date))
    return domains

def calculate_time_remaining(domains):
    now = datetime.datetime.now()
    for domain, not_after_date in domains:
        remaining = not_after_date - now
        print(f"{domain} - Time remaining: {remaining}")




# user defined variable to set up
var3=os.environ.get('STRIP_FILE')
filename = var3
domains = parse_file(filename)
calculate_time_remaining(domains)

