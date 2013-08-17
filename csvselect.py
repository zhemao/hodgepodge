import sys
import csv

def all_numeric(keys):
    for key in keys:
        try:
            float(key)
        except ValueError:
            return False
    return True

def where_clause(where_str, row):
    if where_str is None:
        return True

    try:
        return eval(where_str, {}, dict(row=row))
    except:
        return False

def csv_select(keys, fname, where=None, limit=0):
    with open(fname) as f:
        rdr = csv.reader(f)
        if '*' not in keys:
            indices = set([int(s) for s in keys])
        else:
            indices = set([])
        
        for rownum, row in enumerate(rdr):
            if (limit == 0 or rownum < limit) and where_clause(where, row):
                yield([cell for (cellnum, cell) in enumerate(row)
                                if len(indices) == 0 or cellnum in indices])

def main():
    if len(sys.argv) < 4 or sys.argv[2] != 'from':
        print("Usage: csvselect <keys> from <file> [where <clause>] [limit <num>]")
        sys.exit(-1)

    keys = sys.argv[1].split(",")
    fname = sys.argv[3]
    where = None
    limit = 0

    for i in range(4, len(sys.argv), 2):
        if i + 1 < len(sys.argv):
            if sys.argv[i] == 'where':
                where = sys.argv[i+1]
            elif sys.argv[i] == 'limit':
                limit = int(sys.argv[i+1])

    for row in csv_select(keys, fname, where, limit):
        print("\t".join(row))

if __name__ == '__main__':
    main()
