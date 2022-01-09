class SurveyQuestion < ApplicationRecord
  # Note: I originally added a `type` column, which I forgot was reserved for Single Table Inheritance
  #       Rather than completely drop the column and start from the beginning, I wanted to demonstrate the approach
  #       Needed to rename and remove a column correctly.
  # Renaming a column requires the following:
  # 1. that you add a column with the new name
  # 2. write to both columns
  # 3. backfill data old data to the new column
  # 4. change code to only read/write to new column (self.ignored_columns helps) since the old column will be cached by AR
  # 5. finally drop the column in the db and clean up this class-attribute assignment below.
  self.ignored_columns = %i(type)

  include HasResponseType

  belongs_to :survey
end
