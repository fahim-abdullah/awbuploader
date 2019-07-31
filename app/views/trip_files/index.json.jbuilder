json.set! :data do
  json.array! @trip_files do |trip_file|
    json.partial! 'trip_files/trip_file', trip_file: trip_file
    json.url  "
              #{link_to 'Show', trip_file }
              #{link_to 'Edit', edit_trip_file_path(trip_file)}
              #{link_to 'Destroy', trip_file, method: :delete, data: { confirm: 'Are you sure?' }}
              "
  end
end