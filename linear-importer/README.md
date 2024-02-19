# Linear Importer

[Linear Importer](https://github.com/linear/linear/tree/master/packages/import) is a tool for importing data into [Linear](https://linear.app/).

## Usage

To use the Linear Importer, run the following Docker command:

`docker run -it -v $(pwd):/workspace --rm ogontaro/linear-importer`

This command will start the Linear Importer container and mount the current directory (`$(pwd)`) to the `/workspace` directory inside the container. Make sure you have the necessary data files in the current directory before running the command.

For more information on how to use the Linear Importer, please refer to the [official documentation](https://github.com/linear/linear/tree/master/packages/import).
