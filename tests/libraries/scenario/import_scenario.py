def import_scenario_body(): #ip4,ext_id
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
            "latitude": 37.994221,
            "longitude": 23.77474,
            "radius": 150
            }
        ],
        "UEs": [
            {
            "name": "UE1",
            "description": "This is a UE",
            "gNB_id": 1,
            "Cell_id": 1,
            "ip_address_v4": "10.0.0.3",
            "ip_address_v6": "::1",
            "mac_address": "22-00-00-00-00-01",
            "dnn": "province1.mnc01.mcc202.gprs",
            "mcc": 202,
            "mnc": 1,
            "external_identifier": "10003@domain.com",
            "speed": "LOW",
            "supi": "202010000000001",
            "latitude": 37.994141,
            "longitude": 23.774833,
            "path_id": 1
            }
        ],
        "paths": [
            {
            "description": "testing",
            "start_point": {
                "latitude": 37.992894,
                "longitude": 23.776446
            },
            "end_point": {
                "latitude": 37.994188,
                "longitude": 23.774772
            },
            "color": "#3399ff",
            "points": [
                {
                "latitude": 37.9929,
                "longitude": 23.776438
                },
                {
                "latitude": 37.992907,
                "longitude": 23.77643
                },
                {
                "latitude": 37.992913,
                "longitude": 23.776422
                },
                {
                "latitude": 37.992919,
                "longitude": 23.776414
                },
                {
                "latitude": 37.992925,
                "longitude": 23.776405
                },
                {
                "latitude": 37.992932,
                "longitude": 23.776397
                },
                {
                "latitude": 37.992938,
                "longitude": 23.776389
                },
                {
                "latitude": 37.992944,
                "longitude": 23.776381
                },
                {
                "latitude": 37.992951,
                "longitude": 23.776373
                },
                {
                "latitude": 37.992957,
                "longitude": 23.776365
                },
                {
                "latitude": 37.992963,
                "longitude": 23.776356
                },
                {
                "latitude": 37.99297,
                "longitude": 23.776348
                },
                {
                "latitude": 37.992976,
                "longitude": 23.77634
                },
                {
                "latitude": 37.992982,
                "longitude": 23.776332
                },
                {
                "latitude": 37.992988,
                "longitude": 23.776324
                },
                {
                "latitude": 37.992995,
                "longitude": 23.776316
                },
                {
                "latitude": 37.993001,
                "longitude": 23.776308
                },
                {
                "latitude": 37.993007,
                "longitude": 23.776299
                },
                {
                "latitude": 37.993014,
                "longitude": 23.776291
                },
                {
                "latitude": 37.99302,
                "longitude": 23.776283
                },
                {
                "latitude": 37.993026,
                "longitude": 23.776275
                },
                {
                "latitude": 37.993032,
                "longitude": 23.776267
                },
                {
                "latitude": 37.993039,
                "longitude": 23.776259
                },
                {
                "latitude": 37.993045,
                "longitude": 23.776251
                },
                {
                "latitude": 37.993051,
                "longitude": 23.776242
                },
                {
                "latitude": 37.993058,
                "longitude": 23.776234
                },
                {
                "latitude": 37.993064,
                "longitude": 23.776226
                },
                {
                "latitude": 37.99307,
                "longitude": 23.776218
                },
                {
                "latitude": 37.993077,
                "longitude": 23.77621
                },
                {
                "latitude": 37.993083,
                "longitude": 23.776202
                },
                {
                "latitude": 37.993089,
                "longitude": 23.776194
                },
                {
                "latitude": 37.993095,
                "longitude": 23.776185
                },
                {
                "latitude": 37.993102,
                "longitude": 23.776177
                },
                {
                "latitude": 37.993108,
                "longitude": 23.776169
                },
                {
                "latitude": 37.993114,
                "longitude": 23.776161
                },
                {
                "latitude": 37.993121,
                "longitude": 23.776153
                },
                {
                "latitude": 37.993127,
                "longitude": 23.776145
                },
                {
                "latitude": 37.993133,
                "longitude": 23.776137
                },
                {
                "latitude": 37.99314,
                "longitude": 23.776128
                },
                {
                "latitude": 37.993146,
                "longitude": 23.77612
                },
                {
                "latitude": 37.993152,
                "longitude": 23.776112
                },
                {
                "latitude": 37.993158,
                "longitude": 23.776104
                },
                {
                "latitude": 37.993165,
                "longitude": 23.776096
                },
                {
                "latitude": 37.993171,
                "longitude": 23.776088
                },
                {
                "latitude": 37.993177,
                "longitude": 23.776079
                },
                {
                "latitude": 37.993184,
                "longitude": 23.776071
                },
                {
                "latitude": 37.99319,
                "longitude": 23.776063
                },
                {
                "latitude": 37.993196,
                "longitude": 23.776055
                },
                {
                "latitude": 37.993203,
                "longitude": 23.776047
                },
                {
                "latitude": 37.993209,
                "longitude": 23.776039
                },
                {
                "latitude": 37.993215,
                "longitude": 23.776031
                },
                {
                "latitude": 37.993221,
                "longitude": 23.776022
                },
                {
                "latitude": 37.993228,
                "longitude": 23.776014
                },
                {
                "latitude": 37.993234,
                "longitude": 23.776006
                },
                {
                "latitude": 37.99324,
                "longitude": 23.775998
                },
                {
                "latitude": 37.993247,
                "longitude": 23.77599
                },
                {
                "latitude": 37.993253,
                "longitude": 23.775982
                },
                {
                "latitude": 37.993259,
                "longitude": 23.775974
                },
                {
                "latitude": 37.993265,
                "longitude": 23.775965
                },
                {
                "latitude": 37.993272,
                "longitude": 23.775957
                },
                {
                "latitude": 37.993278,
                "longitude": 23.775949
                },
                {
                "latitude": 37.993284,
                "longitude": 23.775941
                },
                {
                "latitude": 37.993291,
                "longitude": 23.775933
                },
                {
                "latitude": 37.993297,
                "longitude": 23.775925
                },
                {
                "latitude": 37.993303,
                "longitude": 23.775917
                },
                {
                "latitude": 37.99331,
                "longitude": 23.775908
                },
                {
                "latitude": 37.993316,
                "longitude": 23.7759
                },
                {
                "latitude": 37.993322,
                "longitude": 23.775892
                },
                {
                "latitude": 37.993328,
                "longitude": 23.775884
                },
                {
                "latitude": 37.993335,
                "longitude": 23.775876
                },
                {
                "latitude": 37.993341,
                "longitude": 23.775868
                },
                {
                "latitude": 37.993347,
                "longitude": 23.77586
                },
                {
                "latitude": 37.993354,
                "longitude": 23.775851
                },
                {
                "latitude": 37.99336,
                "longitude": 23.775843
                },
                {
                "latitude": 37.993366,
                "longitude": 23.775835
                },
                {
                "latitude": 37.993373,
                "longitude": 23.775827
                },
                {
                "latitude": 37.993379,
                "longitude": 23.775819
                },
                {
                "latitude": 37.993385,
                "longitude": 23.775811
                },
                {
                "latitude": 37.993391,
                "longitude": 23.775802
                },
                {
                "latitude": 37.993398,
                "longitude": 23.775794
                },
                {
                "latitude": 37.993404,
                "longitude": 23.775786
                },
                {
                "latitude": 37.99341,
                "longitude": 23.775778
                },
                {
                "latitude": 37.993417,
                "longitude": 23.77577
                },
                {
                "latitude": 37.993423,
                "longitude": 23.775762
                },
                {
                "latitude": 37.993429,
                "longitude": 23.775754
                },
                {
                "latitude": 37.993436,
                "longitude": 23.775745
                },
                {
                "latitude": 37.993442,
                "longitude": 23.775737
                },
                {
                "latitude": 37.993448,
                "longitude": 23.775729
                },
                {
                "latitude": 37.993454,
                "longitude": 23.775721
                },
                {
                "latitude": 37.993461,
                "longitude": 23.775713
                },
                {
                "latitude": 37.993467,
                "longitude": 23.775705
                },
                {
                "latitude": 37.993473,
                "longitude": 23.775697
                },
                {
                "latitude": 37.99348,
                "longitude": 23.775688
                },
                {
                "latitude": 37.993486,
                "longitude": 23.77568
                },
                {
                "latitude": 37.993492,
                "longitude": 23.775672
                },
                {
                "latitude": 37.993498,
                "longitude": 23.775664
                },
                {
                "latitude": 37.993505,
                "longitude": 23.775656
                },
                {
                "latitude": 37.993511,
                "longitude": 23.775648
                },
                {
                "latitude": 37.993517,
                "longitude": 23.77564
                },
                {
                "latitude": 37.993524,
                "longitude": 23.775631
                },
                {
                "latitude": 37.99353,
                "longitude": 23.775623
                },
                {
                "latitude": 37.993536,
                "longitude": 23.775615
                },
                {
                "latitude": 37.993543,
                "longitude": 23.775607
                },
                {
                "latitude": 37.993549,
                "longitude": 23.775599
                },
                {
                "latitude": 37.993555,
                "longitude": 23.775591
                },
                {
                "latitude": 37.993561,
                "longitude": 23.775583
                },
                {
                "latitude": 37.993568,
                "longitude": 23.775574
                },
                {
                "latitude": 37.993574,
                "longitude": 23.775566
                },
                {
                "latitude": 37.99358,
                "longitude": 23.775558
                },
                {
                "latitude": 37.993587,
                "longitude": 23.77555
                },
                {
                "latitude": 37.993593,
                "longitude": 23.775542
                },
                {
                "latitude": 37.993599,
                "longitude": 23.775534
                },
                {
                "latitude": 37.993606,
                "longitude": 23.775525
                },
                {
                "latitude": 37.993612,
                "longitude": 23.775517
                },
                {
                "latitude": 37.993618,
                "longitude": 23.775509
                },
                {
                "latitude": 37.993624,
                "longitude": 23.775501
                },
                {
                "latitude": 37.993631,
                "longitude": 23.775493
                },
                {
                "latitude": 37.993637,
                "longitude": 23.775485
                },
                {
                "latitude": 37.993643,
                "longitude": 23.775477
                },
                {
                "latitude": 37.99365,
                "longitude": 23.775468
                },
                {
                "latitude": 37.993656,
                "longitude": 23.77546
                },
                {
                "latitude": 37.993662,
                "longitude": 23.775452
                },
                {
                "latitude": 37.993668,
                "longitude": 23.775444
                },
                {
                "latitude": 37.993675,
                "longitude": 23.775436
                },
                {
                "latitude": 37.993681,
                "longitude": 23.775428
                },
                {
                "latitude": 37.993687,
                "longitude": 23.77542
                },
                {
                "latitude": 37.993694,
                "longitude": 23.775411
                },
                {
                "latitude": 37.9937,
                "longitude": 23.775403
                },
                {
                "latitude": 37.993706,
                "longitude": 23.775395
                },
                {
                "latitude": 37.993713,
                "longitude": 23.775387
                },
                {
                "latitude": 37.993719,
                "longitude": 23.775379
                },
                {
                "latitude": 37.993725,
                "longitude": 23.775371
                },
                {
                "latitude": 37.993731,
                "longitude": 23.775363
                },
                {
                "latitude": 37.993738,
                "longitude": 23.775354
                },
                {
                "latitude": 37.993744,
                "longitude": 23.775346
                },
                {
                "latitude": 37.99375,
                "longitude": 23.775338
                },
                {
                "latitude": 37.993757,
                "longitude": 23.77533
                },
                {
                "latitude": 37.993763,
                "longitude": 23.775322
                },
                {
                "latitude": 37.993769,
                "longitude": 23.775314
                },
                {
                "latitude": 37.993776,
                "longitude": 23.775306
                },
                {
                "latitude": 37.993782,
                "longitude": 23.775297
                },
                {
                "latitude": 37.993788,
                "longitude": 23.775289
                },
                {
                "latitude": 37.993794,
                "longitude": 23.775281
                },
                {
                "latitude": 37.993801,
                "longitude": 23.775273
                },
                {
                "latitude": 37.993807,
                "longitude": 23.775265
                },
                {
                "latitude": 37.993813,
                "longitude": 23.775257
                },
                {
                "latitude": 37.99382,
                "longitude": 23.775248
                },
                {
                "latitude": 37.993826,
                "longitude": 23.77524
                },
                {
                "latitude": 37.993832,
                "longitude": 23.775232
                },
                {
                "latitude": 37.993839,
                "longitude": 23.775224
                },
                {
                "latitude": 37.993845,
                "longitude": 23.775216
                },
                {
                "latitude": 37.993851,
                "longitude": 23.775208
                },
                {
                "latitude": 37.993857,
                "longitude": 23.7752
                },
                {
                "latitude": 37.993864,
                "longitude": 23.775191
                },
                {
                "latitude": 37.99387,
                "longitude": 23.775183
                },
                {
                "latitude": 37.993876,
                "longitude": 23.775175
                },
                {
                "latitude": 37.993883,
                "longitude": 23.775167
                },
                {
                "latitude": 37.993889,
                "longitude": 23.775159
                },
                {
                "latitude": 37.993895,
                "longitude": 23.775151
                },
                {
                "latitude": 37.993901,
                "longitude": 23.775143
                },
                {
                "latitude": 37.993908,
                "longitude": 23.775134
                },
                {
                "latitude": 37.993914,
                "longitude": 23.775126
                },
                {
                "latitude": 37.99392,
                "longitude": 23.775118
                },
                {
                "latitude": 37.993927,
                "longitude": 23.77511
                },
                {
                "latitude": 37.993933,
                "longitude": 23.775102
                },
                {
                "latitude": 37.993939,
                "longitude": 23.775094
                },
                {
                "latitude": 37.993946,
                "longitude": 23.775086
                },
                {
                "latitude": 37.993952,
                "longitude": 23.775077
                },
                {
                "latitude": 37.993958,
                "longitude": 23.775069
                },
                {
                "latitude": 37.993964,
                "longitude": 23.775061
                },
                {
                "latitude": 37.993971,
                "longitude": 23.775053
                },
                {
                "latitude": 37.993977,
                "longitude": 23.775045
                },
                {
                "latitude": 37.993983,
                "longitude": 23.775037
                },
                {
                "latitude": 37.99399,
                "longitude": 23.775029
                },
                {
                "latitude": 37.993996,
                "longitude": 23.77502
                },
                {
                "latitude": 37.994002,
                "longitude": 23.775012
                },
                {
                "latitude": 37.994009,
                "longitude": 23.775004
                },
                {
                "latitude": 37.994015,
                "longitude": 23.774996
                },
                {
                "latitude": 37.994021,
                "longitude": 23.774988
                },
                {
                "latitude": 37.994027,
                "longitude": 23.77498
                },
                {
                "latitude": 37.994034,
                "longitude": 23.774971
                },
                {
                "latitude": 37.99404,
                "longitude": 23.774963
                },
                {
                "latitude": 37.994046,
                "longitude": 23.774955
                },
                {
                "latitude": 37.994053,
                "longitude": 23.774947
                },
                {
                "latitude": 37.994059,
                "longitude": 23.774939
                },
                {
                "latitude": 37.994065,
                "longitude": 23.774931
                },
                {
                "latitude": 37.994072,
                "longitude": 23.774923
                },
                {
                "latitude": 37.994078,
                "longitude": 23.774914
                },
                {
                "latitude": 37.994084,
                "longitude": 23.774906
                },
                {
                "latitude": 37.99409,
                "longitude": 23.774898
                },
                {
                "latitude": 37.994097,
                "longitude": 23.77489
                },
                {
                "latitude": 37.994103,
                "longitude": 23.774882
                },
                {
                "latitude": 37.994109,
                "longitude": 23.774874
                },
                {
                "latitude": 37.994116,
                "longitude": 23.774866
                },
                {
                "latitude": 37.994122,
                "longitude": 23.774857
                },
                {
                "latitude": 37.994128,
                "longitude": 23.774849
                },
                {
                "latitude": 37.994134,
                "longitude": 23.774841
                },
                {
                "latitude": 37.994141,
                "longitude": 23.774833
                },
                {
                "latitude": 37.994147,
                "longitude": 23.774825
                },
                {
                "latitude": 37.994153,
                "longitude": 23.774817
                },
                {
                "latitude": 37.99416,
                "longitude": 23.774809
                },
                {
                "latitude": 37.994166,
                "longitude": 23.7748
                },
                {
                "latitude": 37.994172,
                "longitude": 23.774792
                },
                {
                "latitude": 37.994179,
                "longitude": 23.774784
                },
                {
                "latitude": 37.994185,
                "longitude": 23.774776
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
    } #.format(ip4=ip4,ext_id=ext_id)