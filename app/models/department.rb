class Department < ApplicationRecord
  has_many :clazzs

  def self.import(file)
  spreadsheet = Roo::Spreadsheet.open(file.path)
  header = spreadsheet.row(1)
  
    row = Hash[[header, spreadsheet.row(2)].transpose]
    department = find_by(id: row["id"]) || new
    department.attributes = row.to_hash
    department
  
end
end
