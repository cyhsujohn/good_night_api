json.clock_ins @clock_ins do |clock_in|
  json.extract! clock_in, :id, :created_at, :way
end
