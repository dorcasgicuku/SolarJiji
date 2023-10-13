version 1.0

workflow fetch_data{
   # Array[String] api_parameters
    call api_fetch_data{ }
    
}
 # python apiRequest.py data_parameters

task api_fetch_data{
    input {
        Array[String] time_data
        Array[String] day_data 
        Array[String] month_data
        Array[String] year_data
        Array[String] variable_name
    }
    command <<<
    python <<CODE
import cdsapi
c = cdsapi.Client(verify=False)
        
c.retrieve(
    'reanalysis-era5-single-levels',
     {
        'product_type': 'reanalysis',
        'format': 'grib',
        'variable':[" ~{sep= '", "'variable_name}"],
        'time':[" ~{sep= '", "'time_data}"],
        'day': ["~{sep= '", "'day_data}"],
        'month':[" ~{sep= '", "'month_data}"],
        'year': ["~{sep= '", "'year_data}"],
     },
    'download.grib')
CODE     
    >>>

    output{
        File output_data = "download.grib"

    }
}
