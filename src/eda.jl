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

# Create DataFrames
train, test, sub, labels = read_df()

#Transform string to Dates
train.S_2 = Date.(train.S_2, "yyyy-mm-dd")
test.S_2 = Date.(test.S_2, "yyyy-mm-dd")

#Select first customer in train DataFrame

function filter_by_client(position::Int)
  customer = train.customer_ID[position]
  first_client(name::String)= name == customer #Create function to filter the client
  client_df = filter(:customer_ID => first_client, train)
  
  return client_df

end

client_df = filter_by_client(56)

plot( client_df.S_2, client_df.P_2 )
plot!( client_df.S_2, client_df.B_2 )
plot!(title="P_2 for client A")
