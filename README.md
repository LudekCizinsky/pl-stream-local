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
Check if you have `Java v8` installed:

```bash
java --version
```

If not, then you can install it according to this [tutorial](https://docs.oracle.com/javase/8/docs/technotes/guides/install/mac_jdk.html).


#### Python >3.7
Again, check if you have python installed with at least version 3.7:

```bash
python --version
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

#### Get text with predictions
Finally, you can run the code and get reviews with corresponding label:

```bash
cd src
python PLStream.py
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
python PLStream_acc.py
```

To check the output, follow the similar steps as in the previous section.

## Todo

Here are the possible improvements:

- [ ] Add better logging including time it takes to execute particular parts
- [ ] Figure out how to better save the results - better naming of the files
- [ ] Figure out how to use all available cores 

## Bug report
If you have encountered any problem, please report an issue.

