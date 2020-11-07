defmodule ElectionTest do
  use ExUnit.Case
  doctest Election

  pa = %ElectData{
    state: "PA",
    biden_votes: 3_323_940,
    trump_votes: 3_304_356,
    counted_percent: 96
  }

  nv = %ElectData{
    state: "NV",
    biden_votes: 632_558,
    trump_votes: 609_901,
    # counted_percent: 93
    # they said 120,000 left
    counted_percent: 91.15
  }

  nc = %ElectData{
    state: "NC",
    biden_votes: 2_655_858,
    trump_votes: 2_732_481,
    counted_percent: 98
  }

  ga = %ElectData{
    state: "GA",
    biden_votes: 2_456_473,
    trump_votes: 2_452_511,
    counted_percent: 99
  }

  az = %ElectData{
    state: "AZ",
    biden_votes: 1_572_346,
    trump_votes: 1_535_511,
    counted_percent: 90
  }

  ak = %ElectData{
    state: "AK",
    biden_votes: 56_849,
    trump_votes: 108_231,
    counted_percent: 56
  }

  wi = %ElectData{
    state: "WI",
    biden_votes: 1_630_570,
    trump_votes: 1_610_030,
    counted_percent: 99
  }

  mn = %ElectData{
    state: "MN",
    biden_votes: 1_717_815,
    trump_votes: 1_485_450,
    counted_percent: 99
  }

  election_dumps = [nv, az, ga, pa, nc, ak, wi, mn]

  Enum.each(election_dumps, &Election.calc_and_print/1)
end
