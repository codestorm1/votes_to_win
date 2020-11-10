defmodule ElectionTest do
  use ExUnit.Case
  doctest Election

  pa = %ElectData{
    state: "PA",
    biden_votes: 3_358_920,
    trump_votes: 3_314_726,
    counted_percent: 98
  }

  nv = %ElectData{
    state: "NV",
    biden_votes: 664_162,
    trump_votes: 629_879,
    counted_percent: 97
  }

  nc = %ElectData{
    state: "NC",
    biden_votes: 2_658_274,
    trump_votes: 2_733_681,
    # counted_percent: 98,
    uncounted_votes: 171_666
  }

  ga = %ElectData{
    state: "GA",
    biden_votes: 2_465_781,
    trump_votes: 2_455_428,
    counted_percent: 99.5
  }

  az = %ElectData{
    state: "AZ",
    biden_votes: 1_643_664,
    trump_votes: 1_626_679,
    counted_percent: 98,
    uncounted_votes: 77_000
  }

  ak = %ElectData{
    state: "AK",
    biden_votes: 56_849,
    trump_votes: 108_231,
    # counted_percent: 56,
    uncounted_votes: 157_209
  }

  wi = %ElectData{
    state: "WI",
    biden_votes: 1_630_569,
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
