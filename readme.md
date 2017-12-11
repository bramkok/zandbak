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

##### `--gs`

Run `git status -s` on all repositories.

##### `--gb`

Show current branch on all repositories.

Executes `git rev-parse --abbrev-ref HEAD`.

##### `--gco`

Git checkout branch on all repositories.

##### `--gr`

Run `git reset` on all repositories.

##### `--gcl`

Run `git clean` on all repositories.

##### `--gpl`

Run `git pull --ff-only` on all repositories.

##### `--ci`

Run `composer install` on all repositories.

##### `--cu`

Run `composer update` on all repositories.

##### `--rf`

Run `redis-cli flushall`.

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
