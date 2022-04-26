## Disclaimer
This code is a modification of the original code from [PLStream
repository](https://github.com/HuilinWu2/PLStream/tree/cf9112b402609c1cfe4236de83db37be6d8b309e).
**Therefore, all credit goes to the authors of the original code**. You can
check out the paper for which the code was written [here](https://arxiv.org/pdf/2203.12368v1.pdf). 
## About
The original code assumed that the environment in which the code will be
executed is a cluster with 4 quite powerful nodes. The purpose of this repo is to allow the
execution of the code on a local machine. More specifically, the code was tested
in the following environment:

```
OS: macOS Monterey v12.2.1
Processor: 2 GHz Quad-Core Intel Core i5
Memory: 16 GB 3733 MHz
```

## Quickstart
### Software installation
In order to run the code, you first need to make sure you have the below
mentioned software installed.

#### Apache Flink

Assuming you have `brew` installed, run the following:

```bash
brew install apache-flink
```

#### Java V8
Check if you have `Java v8` installed (Java 18 was
tested and is not compatible with Apache Flink)

```bash
java --version
```

Some Java versions use `java -version` to query
the version of the runtime environment.

If not, then you can install it according to this [tutorial](https://docs.oracle.com/javase/8/docs/technotes/guides/install/mac_jdk.html).

If you already have a Java environment installed,
but in the wrong version, then you need to switch
the default RTE used. First check all current Java
environments installed by running:

```
/usr/libexec/java_home -V
```

Here you should have a Java version `1.8` or `8`
installed. Go into your shell config file
(`.zshrc`/ `.bashrc`) and set the global
`JAVA_HOME` environment variable by adding this
line into the config file.

```
export JAVA_HOME=$(/usr/libexec/java_home -v 1.8)
```

Exit the file and source the changes `source
.zshrc` (in the case of `zsh` as default shell).
Now running `java --version` (or `java -version`
should return the version specified in the config
file.

#### Python==3.7
Again, check if you have python installed with at
version 3.7 (both lower and higher version might
not be compatible) It is recommended to create
a virtual env with this Python version. This is an
example in conda.

```bash
conda env create python=3.7
pip install -r requirements.txt
```

If not, you can follow the official [docs](https://www.python.org/downloads/) to install it.

### Run the code
#### Getting data and downloading packages
Assuming you are at the root of repo, first, we need to download yelp review data and
install python dependencies:

```bash
source setup.sh
```

`[Warning]` You might run into issues when installing dependencies since you
might have different versions of packages already installed and according to the
requirements file, you need a different version. As of now, just ignore these
conflicts. With that being said, make sure that all packages listed in
`requirements.txt` are installed.

#### Run redis
Before execution of the scripts, please run `redis` in a separate terminal window:

```bash
redis-server
```
You might need to install it seperately with
```bash
brew install redis
```

#### Get text with predictions
Finally, you can run the code and get reviews with corresponding label:

```bash
cd src
plreview
```
If you get an error with `nltk` run the python interpreter and run:
```
import nltk
nltk.download('stopwords')
```

The output is stored in the folder called `output` present within the `src`
directory. In the output folder, you can find sub-directories which are named in
the form of `YY-mm-hh`. If you then enter corresponding sub-folder you can check
its content by writing:

```
ls -a
```

As you can see, this subfolder includes several files. If you choose the one
created most recently you can check the output by for example using `head`.
As mentioned in the original docs:
>  The outputs' form is "original text" + "label" + "@@@@". With help of a split("@@@@") function we can further reorganize the labelled dataset.

So for example, you can run the following command to get the result in a nice
form to the file called `result.out` (make sure you replace the variable in
square brackets):

```bash
cat [name_of_the_raw_file] | tr "@@@@" "\n" > result.out
```

#### Get accuracy
You can check how accuracy of the model evolves as you input more data by
running the following:

```bash
cd src
placc
```

To check the output, follow the similar steps as in the previous section.

## Todo

Here are the possible improvements:

- [ ] Add better logging including time it takes to execute particular parts
- [ ] Figure out how to better save the results - better naming of the files
- [ ] Figure out how to use all available cores 

## Bug report
If you have encountered any problem, please report an issue.

