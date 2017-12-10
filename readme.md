# zandbak

> Run php sandbox shell commands

## Usage:
```
$ zandbak [--option <argument>]
```
### Options

##### `-h`, `--help`

Display help information.

##### `-x`, `--option-x`

An option named 'x'.

##### `-o`

Short option with argument.

##### `--long-option-with-argument`

Long option with argument.

##### `--debug`

Display debug information.

### Testing

This program uses [Bats](https://github.com/sstephenson/bats)
(Bash Automated Testing System) for testing. The Bats testing file for this
program can be found in the '/test' directory.

#### Usage

```
$ bats test/zandbak.bats
```

## License

MIT © [Bram Kok](https://github.com/bramkok)
