defmodule ElectionTest do
  use ExUnit.Case
  doctest Election

  pa = %ElectData{
    state: "PA",
    biden_votes: 3_417_479,
    trump_votes: 3_351_976,
    counted_percent: 99
  }

  nv = %ElectData{
    state: "NV",
    biden_votes: 703_486,
    trump_votes: 669_890,
    counted_percent: 99
  }

  nc = %ElectData{
    state: "NC",
    biden_votes: 2_681_124,
    trump_votes: 2_754_822,
    counted_percent: 99
    # uncounted_votes: 171_666
  }

  ga = %ElectData{
    state: "GA",
    biden_votes: 2_472_182,
    trump_votes: 2_458_010,
    counted_percent: 99
  }

  az = %ElectData{
    state: "AZ",
    biden_votes: 1_671_491,
    trump_votes: 1_661_475,
    counted_percent: 99.5
    # uncounted_votes: 77_000
  }

  ak = %ElectData{
    state: "AK",
    biden_votes: 143_047,
    trump_votes: 179_080,
    counted_percent: 99
    # uncounted_votes: 157_209
  }

  wi = %ElectData{
    state: "WI",
    biden_votes: 1_630_619,
    trump_votes: 1_610_073,
    counted_percent: 99
  }

  mn = %ElectData{
    state: "MN",
    biden_votes: 1_718_739,
    trump_votes: 1_485_345,
    counted_percent: 99
  }

  election_dumps = [nv, az, ga, pa, nc, ak, wi, mn]

  Enum.each(election_dumps, &Election.calc_and_print/1)
end
