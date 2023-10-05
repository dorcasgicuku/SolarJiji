version 1.0

workflow fetch_data{
   # Array[String] api_parameters
    call api_fetch_data{ }
    
}
 # python apiRequest.py data_parameters

task api_fetch_data{
    input {
        Array[String] time_data = ['00:00', '01:00', '07:00','13:00', '19:00']
        Array[String] day_data =['07','08']
        Array[String] month_data =['07','08']
        Array[String] year_data=['1999','2000']
        Array[String] variable_name=['10m_u_component_of_wind', '10m_v_component_of_wind', '2m_dewpoint_temperature',
            '2m_temperature', 'mean_sea_level_pressure', 'mean_wave_direction',
            'mean_wave_period', 'sea_surface_temperature', 'significant_height_of_combined_wind_waves_and_swell',
            'surface_pressure', 'total_precipitation']
    }
    command <<<
    python <<CODE
        import cdsapi
        c = cdsapi.Client()
        
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