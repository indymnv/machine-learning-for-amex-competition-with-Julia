using DataFrames, Parquet, CSV
using Statistics
using Plots
using Dates
using XGBoost

function read_df()

  train = DataFrame(read_parquet("data/train.parquet"))
  test = DataFrame(read_parquet("data/test.parquet"))
  sub = DataFrame(CSV.File("data/sample_submission.csv"))
  labels = DataFrame(CSV.File("data/train_labels.csv"))

  return train, test, sub, labels

end

# Create DataFrames
train, test, sub, labels = read_df()

#Transform string to Dates
train.S_2 = Date.(train.S_2, "yyyy-mm-dd")
test.S_2 = Date.(test.S_2, "yyyy-mm-dd")

#split dataframe
