def get_monitoring_callback():
    return {
        "externalId": "123456789@domain.com",
        "monitoringType": "LOCATION_REPORTING",
        "locationInfo": {
            "cellId": "string",
            "enodeBId": "string"
        },
        "ipv4Addr": "10.0.0.0",
        "subscription":  "http://example.com/",
        "lossOfConnectReason": 0,
        "reachabilityType": "DATA"
    }

def get_qos_callback():
    return {
        "transaction": "https://myresource.com",
        "eventReports": [{
                "event": "QOS_GUARANTEED",
                "accumulatedUsage": {
                    "duration": 0,
                    "totalVolume": 0,
                    "downlinkVolume": 0,
                    "uplinkVolume": 0
                },
                "appliedQosRef": "string",
                "qosMonReports": [
                    {
                    "dlDelays": [
                        0
                    ],
                    "ulDelays": [
                        0
                    ],
                    "rtDelays": [
                        0
                    ]
                    }
                ]
            }
        ]
    }