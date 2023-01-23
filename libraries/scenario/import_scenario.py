def import_scenario_body(num): #ip4,ext_id
    print(num)
    if num == '1' :
        return {
            "gNBs": [
                {
                "gNB_id": "AAAAA2",
                "name": "gNB2",
                "description": "This is a base station",
                "location": "location-B"
                }
            ],
            "cells": [
                {
                "cell_id": "AAAAA1002",
                "name": "cell2",
                "description": "Building 2",
                "gNB_id": 1,
                "latitude": 37.994133,
                "longitude": 23.774766,
                "radius": 150
                }
            ],
            "UEs": [
                {
                "name": "UE2",
                "description": "This is a UE",
                "ip_address_v4": "10.0.0.2",
                "ip_address_v6": "::1",
                "mac_address": "22-00-00-00-00-01",
                "dnn": "province1.mnc01.mcc202.gprs",
                "mcc": 202,
                "mnc": 1,
                "external_identifier": "10002@domain.com",
                "speed": "LOW",
                "supi": "202010000000002"
                }
            ],
            "paths": [
                {
                "description": "",
                "start_point": {
                    "latitude": 37.993154,
                    "longitude": 23.776274
                },
                "end_point": {
                    "latitude": 37.994144,
                    "longitude": 23.774729
                },
                "color": "#3399ff",
                "id": 1,
                "points": [
                    {
                    "latitude": 37.99316,
                    "longitude": 23.776266
                    },
                    {
                    "latitude": 37.993166,
                    "longitude": 23.776257
                    },
                    {
                    "latitude": 37.993171,
                    "longitude": 23.776248
                    },
                    {
                    "latitude": 37.993177,
                    "longitude": 23.776239
                    },
                    {
                    "latitude": 37.993183,
                    "longitude": 23.77623
                    },
                    {
                    "latitude": 37.993188,
                    "longitude": 23.776221
                    },
                    {
                    "latitude": 37.993194,
                    "longitude": 23.776212
                    },
                    {
                    "latitude": 37.9932,
                    "longitude": 23.776204
                    },
                    {
                    "latitude": 37.993205,
                    "longitude": 23.776195
                    },
                    {
                    "latitude": 37.993211,
                    "longitude": 23.776186
                    },
                    {
                    "latitude": 37.993217,
                    "longitude": 23.776177
                    },
                    {
                    "latitude": 37.993222,
                    "longitude": 23.776168
                    },
                    {
                    "latitude": 37.993228,
                    "longitude": 23.776159
                    },
                    {
                    "latitude": 37.993234,
                    "longitude": 23.77615
                    },
                    {
                    "latitude": 37.993239,
                    "longitude": 23.776142
                    },
                    {
                    "latitude": 37.993245,
                    "longitude": 23.776133
                    },
                    {
                    "latitude": 37.993251,
                    "longitude": 23.776124
                    },
                    {
                    "latitude": 37.993256,
                    "longitude": 23.776115
                    },
                    {
                    "latitude": 37.993262,
                    "longitude": 23.776106
                    },
                    {
                    "latitude": 37.993268,
                    "longitude": 23.776097
                    },
                    {
                    "latitude": 37.993273,
                    "longitude": 23.776088
                    },
                    {
                    "latitude": 37.993279,
                    "longitude": 23.77608
                    },
                    {
                    "latitude": 37.993285,
                    "longitude": 23.776071
                    },
                    {
                    "latitude": 37.99329,
                    "longitude": 23.776062
                    },
                    {
                    "latitude": 37.993296,
                    "longitude": 23.776053
                    },
                    {
                    "latitude": 37.993302,
                    "longitude": 23.776044
                    },
                    {
                    "latitude": 37.993307,
                    "longitude": 23.776035
                    },
                    {
                    "latitude": 37.993313,
                    "longitude": 23.776026
                    },
                    {
                    "latitude": 37.993319,
                    "longitude": 23.776018
                    },
                    {
                    "latitude": 37.993325,
                    "longitude": 23.776009
                    },
                    {
                    "latitude": 37.99333,
                    "longitude": 23.776
                    },
                    {
                    "latitude": 37.993336,
                    "longitude": 23.775991
                    },
                    {
                    "latitude": 37.993342,
                    "longitude": 23.775982
                    },
                    {
                    "latitude": 37.993347,
                    "longitude": 23.775973
                    },
                    {
                    "latitude": 37.993353,
                    "longitude": 23.775964
                    },
                    {
                    "latitude": 37.993359,
                    "longitude": 23.775956
                    },
                    {
                    "latitude": 37.993364,
                    "longitude": 23.775947
                    },
                    {
                    "latitude": 37.99337,
                    "longitude": 23.775938
                    },
                    {
                    "latitude": 37.993376,
                    "longitude": 23.775929
                    },
                    {
                    "latitude": 37.993381,
                    "longitude": 23.77592
                    },
                    {
                    "latitude": 37.993387,
                    "longitude": 23.775911
                    },
                    {
                    "latitude": 37.993393,
                    "longitude": 23.775902
                    },
                    {
                    "latitude": 37.993398,
                    "longitude": 23.775894
                    },
                    {
                    "latitude": 37.993404,
                    "longitude": 23.775885
                    },
                    {
                    "latitude": 37.99341,
                    "longitude": 23.775876
                    },
                    {
                    "latitude": 37.993415,
                    "longitude": 23.775867
                    },
                    {
                    "latitude": 37.993421,
                    "longitude": 23.775858
                    },
                    {
                    "latitude": 37.993427,
                    "longitude": 23.775849
                    },
                    {
                    "latitude": 37.993432,
                    "longitude": 23.77584
                    },
                    {
                    "latitude": 37.993438,
                    "longitude": 23.775832
                    },
                    {
                    "latitude": 37.993444,
                    "longitude": 23.775823
                    },
                    {
                    "latitude": 37.993449,
                    "longitude": 23.775814
                    },
                    {
                    "latitude": 37.993455,
                    "longitude": 23.775805
                    },
                    {
                    "latitude": 37.993461,
                    "longitude": 23.775796
                    },
                    {
                    "latitude": 37.993466,
                    "longitude": 23.775787
                    },
                    {
                    "latitude": 37.993472,
                    "longitude": 23.775778
                    },
                    {
                    "latitude": 37.993478,
                    "longitude": 23.77577
                    },
                    {
                    "latitude": 37.993483,
                    "longitude": 23.775761
                    },
                    {
                    "latitude": 37.993489,
                    "longitude": 23.775752
                    },
                    {
                    "latitude": 37.993495,
                    "longitude": 23.775743
                    },
                    {
                    "latitude": 37.9935,
                    "longitude": 23.775734
                    },
                    {
                    "latitude": 37.993506,
                    "longitude": 23.775725
                    },
                    {
                    "latitude": 37.993512,
                    "longitude": 23.775716
                    },
                    {
                    "latitude": 37.993517,
                    "longitude": 23.775708
                    },
                    {
                    "latitude": 37.993523,
                    "longitude": 23.775699
                    },
                    {
                    "latitude": 37.993529,
                    "longitude": 23.77569
                    },
                    {
                    "latitude": 37.993534,
                    "longitude": 23.775681
                    },
                    {
                    "latitude": 37.99354,
                    "longitude": 23.775672
                    },
                    {
                    "latitude": 37.993546,
                    "longitude": 23.775663
                    },
                    {
                    "latitude": 37.993551,
                    "longitude": 23.775654
                    },
                    {
                    "latitude": 37.993557,
                    "longitude": 23.775646
                    },
                    {
                    "latitude": 37.993563,
                    "longitude": 23.775637
                    },
                    {
                    "latitude": 37.993568,
                    "longitude": 23.775628
                    },
                    {
                    "latitude": 37.993574,
                    "longitude": 23.775619
                    },
                    {
                    "latitude": 37.99358,
                    "longitude": 23.77561
                    },
                    {
                    "latitude": 37.993585,
                    "longitude": 23.775601
                    },
                    {
                    "latitude": 37.993591,
                    "longitude": 23.775592
                    },
                    {
                    "latitude": 37.993597,
                    "longitude": 23.775584
                    },
                    {
                    "latitude": 37.993602,
                    "longitude": 23.775575
                    },
                    {
                    "latitude": 37.993608,
                    "longitude": 23.775566
                    },
                    {
                    "latitude": 37.993614,
                    "longitude": 23.775557
                    },
                    {
                    "latitude": 37.993619,
                    "longitude": 23.775548
                    },
                    {
                    "latitude": 37.993625,
                    "longitude": 23.775539
                    },
                    {
                    "latitude": 37.993631,
                    "longitude": 23.77553
                    },
                    {
                    "latitude": 37.993636,
                    "longitude": 23.775522
                    },
                    {
                    "latitude": 37.993642,
                    "longitude": 23.775513
                    },
                    {
                    "latitude": 37.993648,
                    "longitude": 23.775504
                    },
                    {
                    "latitude": 37.993653,
                    "longitude": 23.775495
                    },
                    {
                    "latitude": 37.993659,
                    "longitude": 23.775486
                    },
                    {
                    "latitude": 37.993665,
                    "longitude": 23.775477
                    },
                    {
                    "latitude": 37.99367,
                    "longitude": 23.775468
                    },
                    {
                    "latitude": 37.993676,
                    "longitude": 23.77546
                    },
                    {
                    "latitude": 37.993682,
                    "longitude": 23.775451
                    },
                    {
                    "latitude": 37.993687,
                    "longitude": 23.775442
                    },
                    {
                    "latitude": 37.993693,
                    "longitude": 23.775433
                    },
                    {
                    "latitude": 37.993699,
                    "longitude": 23.775424
                    },
                    {
                    "latitude": 37.993704,
                    "longitude": 23.775415
                    },
                    {
                    "latitude": 37.99371,
                    "longitude": 23.775406
                    },
                    {
                    "latitude": 37.993716,
                    "longitude": 23.775398
                    },
                    {
                    "latitude": 37.993721,
                    "longitude": 23.775389
                    },
                    {
                    "latitude": 37.993727,
                    "longitude": 23.77538
                    },
                    {
                    "latitude": 37.993733,
                    "longitude": 23.775371
                    },
                    {
                    "latitude": 37.993738,
                    "longitude": 23.775362
                    },
                    {
                    "latitude": 37.993744,
                    "longitude": 23.775353
                    },
                    {
                    "latitude": 37.99375,
                    "longitude": 23.775344
                    },
                    {
                    "latitude": 37.993756,
                    "longitude": 23.775336
                    },
                    {
                    "latitude": 37.993761,
                    "longitude": 23.775327
                    },
                    {
                    "latitude": 37.993767,
                    "longitude": 23.775318
                    },
                    {
                    "latitude": 37.993773,
                    "longitude": 23.775309
                    },
                    {
                    "latitude": 37.993778,
                    "longitude": 23.7753
                    },
                    {
                    "latitude": 37.993784,
                    "longitude": 23.775291
                    },
                    {
                    "latitude": 37.99379,
                    "longitude": 23.775282
                    },
                    {
                    "latitude": 37.993795,
                    "longitude": 23.775274
                    },
                    {
                    "latitude": 37.993801,
                    "longitude": 23.775265
                    },
                    {
                    "latitude": 37.993807,
                    "longitude": 23.775256
                    },
                    {
                    "latitude": 37.993812,
                    "longitude": 23.775247
                    },
                    {
                    "latitude": 37.993818,
                    "longitude": 23.775238
                    },
                    {
                    "latitude": 37.993824,
                    "longitude": 23.775229
                    },
                    {
                    "latitude": 37.993829,
                    "longitude": 23.775221
                    },
                    {
                    "latitude": 37.993835,
                    "longitude": 23.775212
                    },
                    {
                    "latitude": 37.993841,
                    "longitude": 23.775203
                    },
                    {
                    "latitude": 37.993846,
                    "longitude": 23.775194
                    },
                    {
                    "latitude": 37.993852,
                    "longitude": 23.775185
                    },
                    {
                    "latitude": 37.993858,
                    "longitude": 23.775176
                    },
                    {
                    "latitude": 37.993863,
                    "longitude": 23.775167
                    },
                    {
                    "latitude": 37.993869,
                    "longitude": 23.775159
                    },
                    {
                    "latitude": 37.993875,
                    "longitude": 23.77515
                    },
                    {
                    "latitude": 37.99388,
                    "longitude": 23.775141
                    },
                    {
                    "latitude": 37.993886,
                    "longitude": 23.775132
                    },
                    {
                    "latitude": 37.993892,
                    "longitude": 23.775123
                    },
                    {
                    "latitude": 37.993897,
                    "longitude": 23.775114
                    },
                    {
                    "latitude": 37.993903,
                    "longitude": 23.775105
                    },
                    {
                    "latitude": 37.993909,
                    "longitude": 23.775097
                    },
                    {
                    "latitude": 37.993914,
                    "longitude": 23.775088
                    },
                    {
                    "latitude": 37.99392,
                    "longitude": 23.775079
                    },
                    {
                    "latitude": 37.993926,
                    "longitude": 23.77507
                    },
                    {
                    "latitude": 37.993931,
                    "longitude": 23.775061
                    },
                    {
                    "latitude": 37.993937,
                    "longitude": 23.775052
                    },
                    {
                    "latitude": 37.993943,
                    "longitude": 23.775043
                    },
                    {
                    "latitude": 37.993948,
                    "longitude": 23.775035
                    },
                    {
                    "latitude": 37.993954,
                    "longitude": 23.775026
                    },
                    {
                    "latitude": 37.99396,
                    "longitude": 23.775017
                    },
                    {
                    "latitude": 37.993965,
                    "longitude": 23.775008
                    },
                    {
                    "latitude": 37.993971,
                    "longitude": 23.774999
                    },
                    {
                    "latitude": 37.993977,
                    "longitude": 23.77499
                    },
                    {
                    "latitude": 37.993982,
                    "longitude": 23.774981
                    },
                    {
                    "latitude": 37.993988,
                    "longitude": 23.774973
                    },
                    {
                    "latitude": 37.993994,
                    "longitude": 23.774964
                    },
                    {
                    "latitude": 37.993999,
                    "longitude": 23.774955
                    },
                    {
                    "latitude": 37.994005,
                    "longitude": 23.774946
                    },
                    {
                    "latitude": 37.994011,
                    "longitude": 23.774937
                    },
                    {
                    "latitude": 37.994016,
                    "longitude": 23.774928
                    },
                    {
                    "latitude": 37.994022,
                    "longitude": 23.774919
                    },
                    {
                    "latitude": 37.994028,
                    "longitude": 23.774911
                    },
                    {
                    "latitude": 37.994033,
                    "longitude": 23.774902
                    },
                    {
                    "latitude": 37.994039,
                    "longitude": 23.774893
                    },
                    {
                    "latitude": 37.994045,
                    "longitude": 23.774884
                    },
                    {
                    "latitude": 37.99405,
                    "longitude": 23.774875
                    },
                    {
                    "latitude": 37.994056,
                    "longitude": 23.774866
                    },
                    {
                    "latitude": 37.994062,
                    "longitude": 23.774857
                    },
                    {
                    "latitude": 37.994067,
                    "longitude": 23.774849
                    },
                    {
                    "latitude": 37.994073,
                    "longitude": 23.77484
                    },
                    {
                    "latitude": 37.994079,
                    "longitude": 23.774831
                    },
                    {
                    "latitude": 37.994084,
                    "longitude": 23.774822
                    },
                    {
                    "latitude": 37.99409,
                    "longitude": 23.774813
                    },
                    {
                    "latitude": 37.994096,
                    "longitude": 23.774804
                    },
                    {
                    "latitude": 37.994101,
                    "longitude": 23.774795
                    },
                    {
                    "latitude": 37.994107,
                    "longitude": 23.774787
                    },
                    {
                    "latitude": 37.994113,
                    "longitude": 23.774778
                    },
                    {
                    "latitude": 37.994118,
                    "longitude": 23.774769
                    },
                    {
                    "latitude": 37.994124,
                    "longitude": 23.77476
                    },
                    {
                    "latitude": 37.99413,
                    "longitude": 23.774751
                    },
                    {
                    "latitude": 37.994135,
                    "longitude": 23.774742
                    },
                    {
                    "latitude": 37.994141,
                    "longitude": 23.774733
                    }
                ]
                }
            ],
            "ue_path_association": [
                {
                "supi": "202010000000002",
                "path": 1
                }
            ]
        }
    elif num=='2' :
        return {
            "gNBs": [
                {
                "gNB_id": "AAAAA1",
                "name": "gNB1",
                "description": "This is a base station",
                "location": "location-A"
                }
            ],
            "cells": [
                {
                "cell_id": "AAAAA1001",
                "name": "cell1",
                "description": "Building 1",
                "gNB_id": 1,
                "latitude": 37.994133,
                "longitude": 23.774766,
                "radius": 150
                }
            ],
            "UEs": [
                {
                "name": "UE1",
                "description": "This is a UE",
                "ip_address_v4": "10.0.0.1",
                "ip_address_v6": "::1",
                "mac_address": "22-00-00-00-00-01",
                "dnn": "province1.mnc01.mcc202.gprs",
                "mcc": 202,
                "mnc": 1,
                "external_identifier": "10001@domain.com",
                "speed": "LOW",
                "supi": "202010000000001"
                }
            ],
            "paths": [
                {
                "description": "",
                "start_point": {
                    "latitude": 37.993154,
                    "longitude": 23.776274
                },
                "end_point": {
                    "latitude": 37.994144,
                    "longitude": 23.774729
                },
                "color": "#3399ff",
                "id": 1,
                "points": [
                    {
                    "latitude": 37.99316,
                    "longitude": 23.776266
                    },
                    {
                    "latitude": 37.993166,
                    "longitude": 23.776257
                    },
                    {
                    "latitude": 37.993171,
                    "longitude": 23.776248
                    },
                    {
                    "latitude": 37.993177,
                    "longitude": 23.776239
                    },
                    {
                    "latitude": 37.993183,
                    "longitude": 23.77623
                    },
                    {
                    "latitude": 37.993188,
                    "longitude": 23.776221
                    },
                    {
                    "latitude": 37.993194,
                    "longitude": 23.776212
                    },
                    {
                    "latitude": 37.9932,
                    "longitude": 23.776204
                    },
                    {
                    "latitude": 37.993205,
                    "longitude": 23.776195
                    },
                    {
                    "latitude": 37.993211,
                    "longitude": 23.776186
                    },
                    {
                    "latitude": 37.993217,
                    "longitude": 23.776177
                    },
                    {
                    "latitude": 37.993222,
                    "longitude": 23.776168
                    },
                    {
                    "latitude": 37.993228,
                    "longitude": 23.776159
                    },
                    {
                    "latitude": 37.993234,
                    "longitude": 23.77615
                    },
                    {
                    "latitude": 37.993239,
                    "longitude": 23.776142
                    },
                    {
                    "latitude": 37.993245,
                    "longitude": 23.776133
                    },
                    {
                    "latitude": 37.993251,
                    "longitude": 23.776124
                    },
                    {
                    "latitude": 37.993256,
                    "longitude": 23.776115
                    },
                    {
                    "latitude": 37.993262,
                    "longitude": 23.776106
                    },
                    {
                    "latitude": 37.993268,
                    "longitude": 23.776097
                    },
                    {
                    "latitude": 37.993273,
                    "longitude": 23.776088
                    },
                    {
                    "latitude": 37.993279,
                    "longitude": 23.77608
                    },
                    {
                    "latitude": 37.993285,
                    "longitude": 23.776071
                    },
                    {
                    "latitude": 37.99329,
                    "longitude": 23.776062
                    },
                    {
                    "latitude": 37.993296,
                    "longitude": 23.776053
                    },
                    {
                    "latitude": 37.993302,
                    "longitude": 23.776044
                    },
                    {
                    "latitude": 37.993307,
                    "longitude": 23.776035
                    },
                    {
                    "latitude": 37.993313,
                    "longitude": 23.776026
                    },
                    {
                    "latitude": 37.993319,
                    "longitude": 23.776018
                    },
                    {
                    "latitude": 37.993325,
                    "longitude": 23.776009
                    },
                    {
                    "latitude": 37.99333,
                    "longitude": 23.776
                    },
                    {
                    "latitude": 37.993336,
                    "longitude": 23.775991
                    },
                    {
                    "latitude": 37.993342,
                    "longitude": 23.775982
                    },
                    {
                    "latitude": 37.993347,
                    "longitude": 23.775973
                    },
                    {
                    "latitude": 37.993353,
                    "longitude": 23.775964
                    },
                    {
                    "latitude": 37.993359,
                    "longitude": 23.775956
                    },
                    {
                    "latitude": 37.993364,
                    "longitude": 23.775947
                    },
                    {
                    "latitude": 37.99337,
                    "longitude": 23.775938
                    },
                    {
                    "latitude": 37.993376,
                    "longitude": 23.775929
                    },
                    {
                    "latitude": 37.993381,
                    "longitude": 23.77592
                    },
                    {
                    "latitude": 37.993387,
                    "longitude": 23.775911
                    },
                    {
                    "latitude": 37.993393,
                    "longitude": 23.775902
                    },
                    {
                    "latitude": 37.993398,
                    "longitude": 23.775894
                    },
                    {
                    "latitude": 37.993404,
                    "longitude": 23.775885
                    },
                    {
                    "latitude": 37.99341,
                    "longitude": 23.775876
                    },
                    {
                    "latitude": 37.993415,
                    "longitude": 23.775867
                    },
                    {
                    "latitude": 37.993421,
                    "longitude": 23.775858
                    },
                    {
                    "latitude": 37.993427,
                    "longitude": 23.775849
                    },
                    {
                    "latitude": 37.993432,
                    "longitude": 23.77584
                    },
                    {
                    "latitude": 37.993438,
                    "longitude": 23.775832
                    },
                    {
                    "latitude": 37.993444,
                    "longitude": 23.775823
                    },
                    {
                    "latitude": 37.993449,
                    "longitude": 23.775814
                    },
                    {
                    "latitude": 37.993455,
                    "longitude": 23.775805
                    },
                    {
                    "latitude": 37.993461,
                    "longitude": 23.775796
                    },
                    {
                    "latitude": 37.993466,
                    "longitude": 23.775787
                    },
                    {
                    "latitude": 37.993472,
                    "longitude": 23.775778
                    },
                    {
                    "latitude": 37.993478,
                    "longitude": 23.77577
                    },
                    {
                    "latitude": 37.993483,
                    "longitude": 23.775761
                    },
                    {
                    "latitude": 37.993489,
                    "longitude": 23.775752
                    },
                    {
                    "latitude": 37.993495,
                    "longitude": 23.775743
                    },
                    {
                    "latitude": 37.9935,
                    "longitude": 23.775734
                    },
                    {
                    "latitude": 37.993506,
                    "longitude": 23.775725
                    },
                    {
                    "latitude": 37.993512,
                    "longitude": 23.775716
                    },
                    {
                    "latitude": 37.993517,
                    "longitude": 23.775708
                    },
                    {
                    "latitude": 37.993523,
                    "longitude": 23.775699
                    },
                    {
                    "latitude": 37.993529,
                    "longitude": 23.77569
                    },
                    {
                    "latitude": 37.993534,
                    "longitude": 23.775681
                    },
                    {
                    "latitude": 37.99354,
                    "longitude": 23.775672
                    },
                    {
                    "latitude": 37.993546,
                    "longitude": 23.775663
                    },
                    {
                    "latitude": 37.993551,
                    "longitude": 23.775654
                    },
                    {
                    "latitude": 37.993557,
                    "longitude": 23.775646
                    },
                    {
                    "latitude": 37.993563,
                    "longitude": 23.775637
                    },
                    {
                    "latitude": 37.993568,
                    "longitude": 23.775628
                    },
                    {
                    "latitude": 37.993574,
                    "longitude": 23.775619
                    },
                    {
                    "latitude": 37.99358,
                    "longitude": 23.77561
                    },
                    {
                    "latitude": 37.993585,
                    "longitude": 23.775601
                    },
                    {
                    "latitude": 37.993591,
                    "longitude": 23.775592
                    },
                    {
                    "latitude": 37.993597,
                    "longitude": 23.775584
                    },
                    {
                    "latitude": 37.993602,
                    "longitude": 23.775575
                    },
                    {
                    "latitude": 37.993608,
                    "longitude": 23.775566
                    },
                    {
                    "latitude": 37.993614,
                    "longitude": 23.775557
                    },
                    {
                    "latitude": 37.993619,
                    "longitude": 23.775548
                    },
                    {
                    "latitude": 37.993625,
                    "longitude": 23.775539
                    },
                    {
                    "latitude": 37.993631,
                    "longitude": 23.77553
                    },
                    {
                    "latitude": 37.993636,
                    "longitude": 23.775522
                    },
                    {
                    "latitude": 37.993642,
                    "longitude": 23.775513
                    },
                    {
                    "latitude": 37.993648,
                    "longitude": 23.775504
                    },
                    {
                    "latitude": 37.993653,
                    "longitude": 23.775495
                    },
                    {
                    "latitude": 37.993659,
                    "longitude": 23.775486
                    },
                    {
                    "latitude": 37.993665,
                    "longitude": 23.775477
                    },
                    {
                    "latitude": 37.99367,
                    "longitude": 23.775468
                    },
                    {
                    "latitude": 37.993676,
                    "longitude": 23.77546
                    },
                    {
                    "latitude": 37.993682,
                    "longitude": 23.775451
                    },
                    {
                    "latitude": 37.993687,
                    "longitude": 23.775442
                    },
                    {
                    "latitude": 37.993693,
                    "longitude": 23.775433
                    },
                    {
                    "latitude": 37.993699,
                    "longitude": 23.775424
                    },
                    {
                    "latitude": 37.993704,
                    "longitude": 23.775415
                    },
                    {
                    "latitude": 37.99371,
                    "longitude": 23.775406
                    },
                    {
                    "latitude": 37.993716,
                    "longitude": 23.775398
                    },
                    {
                    "latitude": 37.993721,
                    "longitude": 23.775389
                    },
                    {
                    "latitude": 37.993727,
                    "longitude": 23.77538
                    },
                    {
                    "latitude": 37.993733,
                    "longitude": 23.775371
                    },
                    {
                    "latitude": 37.993738,
                    "longitude": 23.775362
                    },
                    {
                    "latitude": 37.993744,
                    "longitude": 23.775353
                    },
                    {
                    "latitude": 37.99375,
                    "longitude": 23.775344
                    },
                    {
                    "latitude": 37.993756,
                    "longitude": 23.775336
                    },
                    {
                    "latitude": 37.993761,
                    "longitude": 23.775327
                    },
                    {
                    "latitude": 37.993767,
                    "longitude": 23.775318
                    },
                    {
                    "latitude": 37.993773,
                    "longitude": 23.775309
                    },
                    {
                    "latitude": 37.993778,
                    "longitude": 23.7753
                    },
                    {
                    "latitude": 37.993784,
                    "longitude": 23.775291
                    },
                    {
                    "latitude": 37.99379,
                    "longitude": 23.775282
                    },
                    {
                    "latitude": 37.993795,
                    "longitude": 23.775274
                    },
                    {
                    "latitude": 37.993801,
                    "longitude": 23.775265
                    },
                    {
                    "latitude": 37.993807,
                    "longitude": 23.775256
                    },
                    {
                    "latitude": 37.993812,
                    "longitude": 23.775247
                    },
                    {
                    "latitude": 37.993818,
                    "longitude": 23.775238
                    },
                    {
                    "latitude": 37.993824,
                    "longitude": 23.775229
                    },
                    {
                    "latitude": 37.993829,
                    "longitude": 23.775221
                    },
                    {
                    "latitude": 37.993835,
                    "longitude": 23.775212
                    },
                    {
                    "latitude": 37.993841,
                    "longitude": 23.775203
                    },
                    {
                    "latitude": 37.993846,
                    "longitude": 23.775194
                    },
                    {
                    "latitude": 37.993852,
                    "longitude": 23.775185
                    },
                    {
                    "latitude": 37.993858,
                    "longitude": 23.775176
                    },
                    {
                    "latitude": 37.993863,
                    "longitude": 23.775167
                    },
                    {
                    "latitude": 37.993869,
                    "longitude": 23.775159
                    },
                    {
                    "latitude": 37.993875,
                    "longitude": 23.77515
                    },
                    {
                    "latitude": 37.99388,
                    "longitude": 23.775141
                    },
                    {
                    "latitude": 37.993886,
                    "longitude": 23.775132
                    },
                    {
                    "latitude": 37.993892,
                    "longitude": 23.775123
                    },
                    {
                    "latitude": 37.993897,
                    "longitude": 23.775114
                    },
                    {
                    "latitude": 37.993903,
                    "longitude": 23.775105
                    },
                    {
                    "latitude": 37.993909,
                    "longitude": 23.775097
                    },
                    {
                    "latitude": 37.993914,
                    "longitude": 23.775088
                    },
                    {
                    "latitude": 37.99392,
                    "longitude": 23.775079
                    },
                    {
                    "latitude": 37.993926,
                    "longitude": 23.77507
                    },
                    {
                    "latitude": 37.993931,
                    "longitude": 23.775061
                    },
                    {
                    "latitude": 37.993937,
                    "longitude": 23.775052
                    },
                    {
                    "latitude": 37.993943,
                    "longitude": 23.775043
                    },
                    {
                    "latitude": 37.993948,
                    "longitude": 23.775035
                    },
                    {
                    "latitude": 37.993954,
                    "longitude": 23.775026
                    },
                    {
                    "latitude": 37.99396,
                    "longitude": 23.775017
                    },
                    {
                    "latitude": 37.993965,
                    "longitude": 23.775008
                    },
                    {
                    "latitude": 37.993971,
                    "longitude": 23.774999
                    },
                    {
                    "latitude": 37.993977,
                    "longitude": 23.77499
                    },
                    {
                    "latitude": 37.993982,
                    "longitude": 23.774981
                    },
                    {
                    "latitude": 37.993988,
                    "longitude": 23.774973
                    },
                    {
                    "latitude": 37.993994,
                    "longitude": 23.774964
                    },
                    {
                    "latitude": 37.993999,
                    "longitude": 23.774955
                    },
                    {
                    "latitude": 37.994005,
                    "longitude": 23.774946
                    },
                    {
                    "latitude": 37.994011,
                    "longitude": 23.774937
                    },
                    {
                    "latitude": 37.994016,
                    "longitude": 23.774928
                    },
                    {
                    "latitude": 37.994022,
                    "longitude": 23.774919
                    },
                    {
                    "latitude": 37.994028,
                    "longitude": 23.774911
                    },
                    {
                    "latitude": 37.994033,
                    "longitude": 23.774902
                    },
                    {
                    "latitude": 37.994039,
                    "longitude": 23.774893
                    },
                    {
                    "latitude": 37.994045,
                    "longitude": 23.774884
                    },
                    {
                    "latitude": 37.99405,
                    "longitude": 23.774875
                    },
                    {
                    "latitude": 37.994056,
                    "longitude": 23.774866
                    },
                    {
                    "latitude": 37.994062,
                    "longitude": 23.774857
                    },
                    {
                    "latitude": 37.994067,
                    "longitude": 23.774849
                    },
                    {
                    "latitude": 37.994073,
                    "longitude": 23.77484
                    },
                    {
                    "latitude": 37.994079,
                    "longitude": 23.774831
                    },
                    {
                    "latitude": 37.994084,
                    "longitude": 23.774822
                    },
                    {
                    "latitude": 37.99409,
                    "longitude": 23.774813
                    },
                    {
                    "latitude": 37.994096,
                    "longitude": 23.774804
                    },
                    {
                    "latitude": 37.994101,
                    "longitude": 23.774795
                    },
                    {
                    "latitude": 37.994107,
                    "longitude": 23.774787
                    },
                    {
                    "latitude": 37.994113,
                    "longitude": 23.774778
                    },
                    {
                    "latitude": 37.994118,
                    "longitude": 23.774769
                    },
                    {
                    "latitude": 37.994124,
                    "longitude": 23.77476
                    },
                    {
                    "latitude": 37.99413,
                    "longitude": 23.774751
                    },
                    {
                    "latitude": 37.994135,
                    "longitude": 23.774742
                    },
                    {
                    "latitude": 37.994141,
                    "longitude": 23.774733
                    }
                ]
                }
            ],
            "ue_path_association": [
                {
                "supi": "202010000000001",
                "path": 1
                }
            ]
        }