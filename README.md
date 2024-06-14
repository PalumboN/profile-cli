## Profile CLI

This is an extension to the `test` command line handler in Pharo, but profiling data instead of test result.

It is useful to run tests as bechmarks and get specific information about the runtime.

------

### How to install?

Cloning this repository or by Metacello:

```st
Metacello new
    baseline: 'ProfileCLI';
    repository: 'github://palumbon/profile-cli';
    load.
```

------

### How to use?

You can run `profile <report> <tests_query>` on the image, where:

- `<report>` is the data to print as profile result. See all of them are [listed here](./src/Profile-CLI/ProfileCommandLineHandler.class.st#L24-L57).
- `<tests_query>` is the same query expected by the `test` command.

Example to run all _Kernel_ tests and get the _FullGC_ count:
```bash
> pharo path/to/pharo.image profile --fullGC-count "Kernel.*"
9
```
