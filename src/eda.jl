using DataFrames, Parquet, CSV
using Statistics
using Plots
using Dates

function read_df()

  train = DataFrame(read_parquet("data/train.parquet"))
  test = DataFrame(read_parquet("data/test.parquet"))
  sub = DataFrame(CSV.File("data/sample_submission.csv"))
  labels = DataFrame(CSV.File("data/train_labels.csv"))

  return train, test, sub, labels

end

train, test, sub, labels = read_df()

train.S_2 = Date.(train.S_2, "yyyy-mm-dd")

customer = train.customer_ID[1]


