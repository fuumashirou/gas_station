require 'csv'
class Station < ActiveRecord::Base



	def self.import(file)
		# CSV.foreach(file.path, headers: true) do |row|
		# 	station = find_by_id(row["id"]) || new
		# 	station.attributes = row.to_hash.slice(Station.attribute_names)
		# 	station.save!
		# end
		spreadsheet = open_spreadsheet(file)
		header = spreadsheet.row(1)
		(2..spreadsheet.last_row).each do |i|
			row = Hash[[header, spreadsheet.row(i)].transpose]
			station = find_by_id(row["id"]) || new
			station.attributes = row.to_hash.slice(*row.to_hash.keys)
			station.save!
			#raise find_by_id(row["id"]).inspect
		end
	end


	def self.open_spreadsheet(file)
		case File.extname(file.original_filename)
			when ".csv" then Roo::Csv.new(file.path)
			when ".xls" then Roo::Excel.new(file.path)
			when ".xlsx" then Roo::Excelx.new(file.path)
			else raise "Uknown file type: #{file.original_filename}"
		end
	end

end