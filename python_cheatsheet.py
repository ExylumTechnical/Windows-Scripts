import sys, getopt

### command line arguments without fancy parsing
print("Number of arguments provided: "+str(len(sys.argv)))
print("Command line options supplied:")
for i in sys.argv:
        print(" "+i)

### command line arguments with fancy option parsing
def main(argv):
        infile=""
        outfile=""
        try:
                opts, args = getopt.getopt(argv, "hi:o:",["ifile=","ofile="])
        except:
                print("options.py -i <string> -o <string> -h")
                sys.exit(2)
        for opt, arg in opts:
                if opt == '-h':
                        print("options.py -i <string> -o <string> -h")
                elif opt in ("-i", "--ifile"):
                        infile=arg
                elif opt in ("-o", "--ofile"):
                        outfile=arg

        print(infile)
        print(outfile)

if __name__== "__main__":
        main(sys.argv[1:])
