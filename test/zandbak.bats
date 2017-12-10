#!/usr/bin/env bats

load test_helper

setup() {
  export _COMMAND="${BATS_TEST_DIRNAME}/../zandbak"
}

@test "\`zandbak\` without arguments exits with status 0." {
  run "${_COMMAND}"
  [[ "${status}" -eq 0 ]]
}

@test "\`zandbak\` without arguments prints a string." {
  run "${_COMMAND}"
  [[ "${output}" == "Perform a simple operation." ]]
}

@test "\`zandbak -h\` without arguments exits with status 0." {
  run "${_COMMAND}" -h
  [[ "${status}" -eq 0 ]]
}

@test "\`zandbak --help\` without arguments exits with status 0." {
  run "${_COMMAND}" --help
  [[ "${status}" -eq 0 ]]
}

@test "\`zandbak -x\` without arguments exits with status 0." {
  run "${_COMMAND}" -x
  [[ "${status}" -eq 0 ]]
}

@test "\`zandbak -x\` prints message for option 'x'." {
  run "${_COMMAND}" -x
  [[ "${output}" == "Perform a simple operation with --option-x." ]]
}

@test "\`zandbak --option-x\` without arguments exits with status 0." {
  run "${_COMMAND}" --option-x
  [[ "${status}" -eq 0 ]]
}

@test "\`zandbak --option-x\` prints message for option 'x'." {
  run "${_COMMAND}" --option-x
  [[ "${output}" == "Perform a simple operation with --option-x." ]]
}

@test "\`zandbak -o\` without value exits with status 1." {
  run "${_COMMAND}" -o
  [[ "${status}" -eq 1 ]]
}

@test "\`zandbak -o\` without value prints message." {
  run "${_COMMAND}" -o
  [[ "${output}" == "Option requires a argument: -o" ]]
}

@test "\`zandbak -o\` with value exits with status 0." {
  run "${_COMMAND}" -o 'short option value'
  [[ "${status}" -eq 0 ]]
}

@test "\`zandbak -o\` with value prints optional message." {
  run "${_COMMAND}" -o 'short option value'
  [[ "${lines[0]}" == "Perform a simple operation." ]]
  [[ "${lines[1]}" == "Short option parameter: short option value" ]]
}

@test "\`zandbak\` with long opt and missing required value exits with status 1." {
  run "${_COMMAND}" --long-option-with-argument
  [[ "${status}" -eq 1 ]]
}

@test "\`zandbak\` with long option and missing required value prints message." {
  run "${_COMMAND}" --long-option-with-argument
  [[ "${output}" =~ "Option requires a argument: --long-option-with-argument" ]]
}

@test "\`zandbak\` with option and required value exits with status 0." {
  run "${_COMMAND}" --long-option-with-argument 'long option value'
  [[ "${status}" -eq 0 ]]
}

@test "\`zandbak\` with option and required value prints optional message." {
  run "${_COMMAND}" --long-option-with-argument 'long option value'
  [[ "${lines[0]}" == "Perform a simple operation." ]]
  [[ "${lines[1]}" == "Long option parameter: long option value" ]]
}
