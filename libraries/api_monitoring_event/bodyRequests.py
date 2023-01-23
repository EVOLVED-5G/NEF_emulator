def monitoring_event_sub_body():
    return {
        "externalId": "10001@domain.com",
        "notificationDestination": "http://localhost:80/api/v1/utils/monitoring/callback",
        "monitoringType": "LOCATION_REPORTING",
        "maximumNumberOfReports": 2,
        "monitorExpireTime": "2025-09-25T13:00:48.634Z"
    }

def one_time_monitoring_event_body():
    return {
        "externalId": "10002@domain.com",
        "notificationDestination": "http://localhost:80/api/v1/utils/monitoring/callback",
        "monitoringType": "LOCATION_REPORTING",
        "maximumNumberOfReports": 1,
        "monitorExpireTime": "2025-09-25T13:00:48.634Z"
    }