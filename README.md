## RPM Package Information CSV Generator

This script (`generate_csv.sh`) generates a CSV file containing RPM package information of executable files. It reads a list of executable files from user's `inputfile`. The extracted information is then stored in a CSV format.

### Prerequisites

- Linux environment
- RPM package manager

### Usage

1. Create a file named `inputfile` and add executable file paths, one per line, to this file. You may use a command like: 

```bash
find . -type f -executable > inputfile
 ```

2. Make sure the script is executable:

```bash
chmod +x generate_csv.sh
```

3. Run the script using the following command:

```bash
   ./generate_csv.sh inputfile [outputfile]
```

inputpackage: The file containing the list of executable files to be checked, one per line.
outputfile (optional): The CSV output file to store the package information. If not provided, the script will use out.csv as the default output file name.