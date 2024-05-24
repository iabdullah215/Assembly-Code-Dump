# Assembly Code Dump
Here are some of the assembly scripts I wrote...

## HOW TO RUN THESE SCRIPTS:

**STEP 1:** Open up your Visual Studio 2022 (or any)

**STEP 2:** Now go to the `Creat New Project Menu`.

**STEP 3:** In the Language section choose `C++` and then choose `Empty Project`.

![image1](images/image1.png)

**STEP 4:** In the `Project` section, first right click then from the `Build Dependencies` section choose `Build Customization`.

![image1](images/image2.png)

**STEP 5:** Now click the `masm` check box.

![image1](images/image3.png)

**STEP 6:** After checking the check box again right click in the `Project` section and from the `Add` section choose `New Item`.

![image1](images/image4.png)

**STEP 7:** Write the file name as follow and make sure to use `.asm` extension.

![image1](images/image5.png)

**STEP 8:** After this you'll have your code editor ready.

![image1](images/image6.png)

Use **https://godbolt.org/** for better understanding.

# Setting Irvine32 library

Here is a step by step method to set up `Irvine32` Library.

**STEP 1:** First search for `Irvine32` library on your browser and open the following git repository.

![image1](images/untitled.png)

**STEP 2:** In the repo, click the `Code` button in the top right corner and then click on the download zip file.

![image1](images/image5.png)

**STEP 3:** Now extract the file from the zipped folder.

![image1](images/image5.png)

**STEP 4:** Copy the path of the extracted file. I have saved the file in the following location.
**Location:** `D:\Semester 4\COAL\Irvine32 Library\Irvine32-master`

**STEP 5:** Now set the Visual Studio for assembly language.

**STEP 6:** Move to `Project > Properties`.

![image1](images/image5.png)

**STEP 7:** In properties move to the `Linker > Additional Library` Dependencies and then paste your copied file path there.

![image1](images/image5.png)

**STEP 8:** Now click on the `Input` tab. In the Additional Dependency section add `irvine32.lib`.

![image1](images/image5.png)

**STEP 9:** Now in the `Microsoft Macro Assembly > Include Paths` enter the file path again.

![image1](images/image5.png)

**STEP 10:** Verification

- Write the following code to verify the code.

```assembly
INCLUDE Irvine32.inc
.data
prompt db "Enter your name: ", 0
Computer Organization And Assembly Language 3
buffer db 20 dup(0)
greeting db "Hello, ", 0
newline db 13, 10, 0
.code
main PROC
 mov edx, OFFSET prompt
 call WriteString
 mov edx, OFFSET buffer
 mov ecx, SIZEOF buffer
 call ReadString
 mov edx, OFFSET greeting
 call WriteString
 mov edx, OFFSET buffer
 call WriteString
 mov edx, OFFSET newline
 call WriteString
 exit
main ENDP
END main
```

**Respective Output:**

![image1](images/image5.png)
