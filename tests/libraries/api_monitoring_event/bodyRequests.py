def monitoring_event_sub_body():
    return {
        "externalId": "10003@domain.com",
        "notificationDestination": "http://nef-emulator_backend_1:80/api/v1/utils/monitoring/callback",
        "monitoringType": "LOCATION_REPORTING",
        "maximumNumberOfReports": 2,
        "monitorExpireTime": "2022-03-25T13:00:48.634Z"
    }

def one_time_monitoring_event_body():
    return {
        "externalId": "10003@domain.com",
        "notificationDestination": "http://nef-emulator_backend_1:80/api/v1/utils/monitoring/callback",
        "monitoringType": "LOCATION_REPORTING",
        "maximumNumberOfReports": 1,
        "monitorExpireTime": "2022-03-25T13:00:48.634Z"        
    }