package com.github.chrishantha.jfr.flamegraph.output;

import com.beust.jcommander.Parameter;

import java.io.File;


public class JfrParameters {
    @Parameter(names = {"-h", "--help" }, description = "Display Help", help = true)
    boolean help;

    @Parameter(names = { "-f", "--jfrdump" }, description = "Java Flight Recorder Dump", required = true)
    File jfrdump;

    @Parameter(names = { "-d", "--decompress" }, description = "Decompress the JFR file")
    boolean decompress;
}
