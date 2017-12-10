# zandbak

> Run php sandbox shell commands

## Usage:
```
$ zandbak [--option <argument>]
```
### Options

##### `-h`, `--help`

Display help information.

##### `-b`, `--base-path`

Set base path for repositories.

Default: `/home/vagrant/repositories/`

##### `-r`, `--repos`

Select repositories to run commands in.

Default: All sub directories of base path.

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
