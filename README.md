# JInstrumenter

Using JInstrumenter you can create execution traces of any java application
that you like.

It uses JRE's agent interface (introduced in JDK 1.5) to attach to the class 
loader and injects its own source code into the classes of the target project.
It adds the code necessary to track the classes and function calls and it is
configurable through the config files and JVM parameters.

## Usage

You should include the ample.jar as the java agent to java command that runs
your target application. In order to do that, you need to use `-javaagent:`
argument followed by path to the jar file. Also since this is dependent on some
other libraries (their jar files are included in `lib` directory), you need
to add them to the classpath. But, since it is a java agent that gets attached
to the normal java class loader, you should use `-Xbootclasspath` instead of
`-classpath`.

So an example can be:
    
    
    java \
        -Xbootclasspath/a:lib/asm-7.0.jar:lib/asm-analysis-7.0.jar:lib/asm-commons-7.0.jar:lib/asm-tree-7.0.jar:lib/asm-util-7.0.jar:lib/commons-collections-1.0.jar:lib/commons-io-1.0.jar:lib/commons-lang-2.1.jar:lib/log4j-1.2.13.jar:lib/util-0.1.jar:ample/ample-1.0.jar \
        -javaagent:ample/ample-1.0.jar \
        -jar path/to/target/application.jar
    

where all the dependencies are in `lib/` and this project's jar file is located
in `ample/ample-1.0.jar`.

JInstrumenter can be attached to ant and maven targets as well.


## Configuration parameters  
These configuration options are available at runtime:

`jinst.filterfile`    Path to the white/blacklist of classes file. Default is set to `jifilter.txt`


example:
    
    java \
        -Xbootclasspath/a:lib/asm-7.0.jar:lib/asm-analysis-7.0.jar:lib/asm-commons-7.0.jar:lib/asm-tree-7.0.jar:lib/asm-util-7.0.jar:lib/commons-collections-1.0.jar:lib/commons-io-1.0.jar:lib/commons-lang-2.1.jar:lib/log4j-1.2.13.jar:lib/util-0.1.jar:ample/ample-1.0.jar \
        -javaagent:ample/ample-1.0.jar \
        -Djinst.filterfile=whitelist.txt \
        -jar path/to/target/application.jar
      


### Note

This work is based on Ample project developed at saarland university, DE. 
We upgraded the source code to be able to be run on newer versions of Java
and the dependencies. We have changed the functionality of the code to instrument
arbitrary java applications and create traces. This is a complete overhaul of
that project with a ton of refactoring and adding documentations.

