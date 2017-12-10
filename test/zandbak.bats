#!/usr/bin/env bats

load test_helper

setup() {
  export _COMMAND="${BATS_TEST_DIRNAME}/../zandbak"
  export ZANDBAK_TMP="${BATS_TMPDIR}/zandbak-test"
  [ -d "$ZANDBAK_TMP" ] && rm -rf "$ZANDBAK_TMP"
  [ ! -d "$ZANDBAK_TMP" ] && mkdir -p "$ZANDBAK_TMP"
}

teardown() {
  [ -d "$ZANDBAK_TMP" ] && rm -rf "$ZANDBAK_TMP"
}

createRepository() {
  [ -d "$ZANDBAK_TMP" ] && mkdir -p "$ZANDBAK_TMP"/temp-repo
}

### General
#####################################################################

@test "\`zandbak\` without arguments exits with status 0." {
  run "${_COMMAND}"
  [[ "${status}" -eq 0 ]]
}

@test "\`zandbak -h\` without arguments exits with status 0." {
  run "${_COMMAND}" -h
  [[ "${status}" -eq 0 ]]
}

@test "\`zandbak --help\` without arguments exits with status 0." {
  run "${_COMMAND}" --help
  [[ "${status}" -eq 0 ]]
}

### Base path
#####################################################################

# Without argument

@test "\`zandbak -b\` without arguments exits with status 1." {
  run "${_COMMAND}" -b
  [[ "${status}" -eq 1 ]]
}

@test "\`zandbak -b\` base path option without arguments prints message." {
  run "${_COMMAND}" -b
  [[ "${output}" =~ "Option requires a argument: -b" ]]
}

@test "\`zandbak --base-path\` without arguments exits with status 1." {
  run "${_COMMAND}" --base-path
  [[ "${status}" -eq 1 ]]
}

@test "\`zandbak --base-path\` base path option without arguments prints message." {
  run "${_COMMAND}" --base-path
  [[ "${output}" =~ "Option requires a argument: --base-path" ]]
}

# With argument

@test "\`zandbak -b /tmp/\` base path option with argument '/tmp/' exits with status 0." {
  run "${_COMMAND}" -b /tmp/
  [[ "${status}" -eq 0 ]]
}

@test "\`zandbak --base-path /tmp/\` base path option with argument '/tmp/' exits with status 0." {
  run "${_COMMAND}" --base-path /tmp/
  [[ "${status}" -eq 0 ]]
}

# With non existing path

@test "\`zandbak -b /non/existing/path/\` base path option with argument '/non/existing/path/' exits with status 1." {
  run "${_COMMAND}" -b /non/existing/path/
  [[ "${status}" -eq 1 ]]
}

@test "\`zandbak -b /non/existing/path/\` base path option with argument '/non/existing/path/' prints message." {
  run "${_COMMAND}" -b /non/existing/path/
  [[ "${output}" =~ "Directory '/non/existing/path/' does not exist." ]]
}

@test "\`zandbak --base-path /non/existing/path/\` base path option with argument '/non/existing/path/' exits with status 1." {
  run "${_COMMAND}" --base-path /non/existing/path/
  [[ "${status}" -eq 1 ]]
}

@test "\`zandbak --base-path /non/existing/path/\` base path option with argument '/non/existing/path/' prints message." {
  run "${_COMMAND}" --base-path /non/existing/path/
  [[ "${output}" =~ "Directory '/non/existing/path/' does not exist." ]]
}

### Base path
#####################################################################

# Without argument

@test "\`zandbak -r\` without arguments exits with status 1." {
  run "${_COMMAND}" -r
  [[ "${status}" -eq 1 ]]
}

@test "\`zandbak -r\` repository option without arguments prints message." {
  run "${_COMMAND}" -r
  [[ "${output}" =~ "Option requires a argument: -r" ]]
}

@test "\`zandbak --repos\` without arguments exits with status 1." {
  run "${_COMMAND}" --repos
  [[ "${status}" -eq 1 ]]
}

@test "\`zandbak --repos\` repository option without arguments prints message." {
  run "${_COMMAND}" --repos
  [[ "${output}" =~ "Option requires a argument: --repos" ]]
}

# With argument

@test "\`zandbak -r /temp-repo/\` repository option with argument '/temp-repo/' exits with status 0." {
  createRepository
  run "${_COMMAND}" -b ${ZANDBAK_TMP} -r /temp-repo/
  [[ "${status}" -eq 0 ]]
}

@test "\`zandbak --repos /temp-repo/\` repository option with argument '/temp-repo/' exits with status 0." {
  createRepository
  run "${_COMMAND}" -b ${ZANDBAK_TMP} --repos /temp-repo/
  [[ "${status}" -eq 0 ]]
}

# With non existing path

@test "\`zandbak -r /non/existing/path/\` repository option with argument '/non/existing/path/' exits with status 1." {
  run "${_COMMAND}" -b ${ZANDBAK_TMP} -r /non/existing/path/
  [[ "${status}" -eq 1 ]]
}

@test "\`zandbak -r /non/existing/path/\` repository option with argument '/non/existing/path/' prints message." {
  run "${_COMMAND}" -b ${ZANDBAK_TMP} -r /non/existing/path/
  [[ "${output}" =~ "Directory '${ZANDBAK_TMP}/non/existing/path/' does not exist." ]]
}

@test "\`zandbak --repos /non/existing/path/\` repository option with argument '/non/existing/path/' exits with status 1." {
  run "${_COMMAND}" -b ${ZANDBAK_TMP} --repos /non/existing/path/
  [[ "${status}" -eq 1 ]]
}

@test "\`zandbak --repos /non/existing/path/\` repository option with argument '/non/existing/path/' prints message." {
  run "${_COMMAND}" -b ${ZANDBAK_TMP} --repos /non/existing/path/
  [[ "${output}" =~ "Directory '${ZANDBAK_TMP}/non/existing/path/' does not exist." ]]
}
