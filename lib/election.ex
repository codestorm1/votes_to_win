defmodule Election do
  @moduledoc """
  Documentation for `Election`.
  """

  @spec calc_and_print(ElectData.t()) :: :ok
  @doc """
  This was a simple exs script and should be cleaned up and made beautiful before the next election...
  """
  def calc_and_print(%ElectData{} = ed) do
    hum = fn num -> Number.Delimit.number_to_delimited(num, delimiter: ",", precision: 0) end
    gap = ed.trump_votes - ed.biden_votes
    uncounted_votes = uncounted_votes(ed)

    split_remaining = uncounted_votes - gap
    split_each = split_remaining / 2
    biden_needs_votes = (split_each + gap) |> round()
    biden_needs_percent = (biden_needs_votes * 100 / uncounted_votes) |> round()
    IO.puts("")
    IO.puts("With roughly #{ed.counted_percent}% of the votes counted in #{ed.state}")

    if gap < 0 do
      gap = abs(gap)
      IO.puts("Biden is ahead by #{hum.(gap)} votes")
    else
      IO.puts("Trump is ahead by #{hum.(gap)} votes")
    end

    if biden_needs_votes < 0 do
      IO.puts("Biden has won the majority of votes!")
      IO.puts("He needs none of the estimated #{hum.(uncounted_votes)} remaining votes")
    else
      IO.puts("Biden needs: #{hum.(biden_needs_votes)} or #{biden_needs_percent}%")
      IO.puts("of the estimated #{hum.(uncounted_votes)} remaining votes")
    end

    :ok
  end

  # Given a number of uncounted votes, use it
  defp uncounted_votes(%ElectData{uncounted_votes: uncounted}) when uncounted > 0 do
    uncounted
  end

  # Given a total of counted votes and a percentage counted, calculate remaining votes
  defp uncounted_votes(%ElectData{} = ed) do
    counted = ed.trump_votes + ed.biden_votes
    total_expected = 100 * counted / ed.counted_percent
    uncounted = total_expected - counted

    uncounted
    |> round()
  end
end
