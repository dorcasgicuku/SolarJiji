import cdsapi

c = cdsapi.Client()

time_data:str = [ ]
day_data:str =[ ] 
month_data:str=[ ]
year_data:str= [ ]
variable_name = [ ]



c.retrieve(
    'reanalysis-era5-single-levels',
    {
        'product_type': 'reanalysis',
        'format': 'grib',
        'variable': variable_name,
        'time': time_data,
        'day': day_data,
        'month': month_data,
        'year': year_data,
    },
    'download.grib')