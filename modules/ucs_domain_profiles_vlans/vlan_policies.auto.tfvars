#______________________________________________
#
# VLAN Policy Variables
#______________________________________________

vlan_policies = {
  "UCS-DEMO2-A" = {
    description  = ""
    organization = "UCS-DEMO2"
    tags = [
      {
        key   = "easyucs_origin",
        value = "convert",
      },
      {
        key   = "easyucs_version",
        value = "0.9.8",
      },
    ]
    vlans = {
      1 = {
        auto_allow_on_uplinks = true
        vlan_id               = 1,
        multicast_policy      = "UCS-DEMO2",
        name                  = "default",
        native_vlan           = true
      },
      2 = {
        auto_allow_on_uplinks = true
        vlan_id               = 2,
        multicast_policy      = "UCS-DEMO2",
        name                  = "hx-inband-mgmt",
        native_vlan           = false
      },
      3 = {
        auto_allow_on_uplinks = true
        vlan_id               = 3,
        multicast_policy      = "UCS-DEMO2",
        name                  = "OCB-3",
        native_vlan           = false
      },
      4 = {
        auto_allow_on_uplinks = true
        vlan_id               = 4,
        multicast_policy      = "UCS-DEMO2",
        name                  = "OCB-4",
        native_vlan           = false
      },
      5 = {
        auto_allow_on_uplinks = true
        vlan_id               = 5,
        multicast_policy      = "UCS-DEMO2",
        name                  = "OCB-5",
        native_vlan           = false
      },
      6 = {
        auto_allow_on_uplinks = true
        vlan_id               = 6,
        multicast_policy      = "UCS-DEMO2",
        name                  = "OCB-6",
        native_vlan           = false
      },
      7 = {
        auto_allow_on_uplinks = true
        vlan_id               = 7,
        multicast_policy      = "UCS-DEMO2",
        name                  = "OCB-7",
        native_vlan           = false
      },
      8 = {
        auto_allow_on_uplinks = true
        vlan_id               = 8,
        multicast_policy      = "UCS-DEMO2",
        name                  = "OCB-8",
        native_vlan           = false
      },
      9 = {
        auto_allow_on_uplinks = true
        vlan_id               = 9,
        multicast_policy      = "UCS-DEMO2",
        name                  = "OCB-9",
        native_vlan           = false
      },
      10 = {
        auto_allow_on_uplinks = true
        vlan_id               = 10,
        multicast_policy      = "UCS-DEMO2",
        name                  = "OCB-10",
        native_vlan           = false
      },
      11 = {
        auto_allow_on_uplinks = true
        vlan_id               = 11,
        multicast_policy      = "UCS-DEMO2",
        name                  = "OCB-11",
        native_vlan           = false
      },
      12 = {
        auto_allow_on_uplinks = true
        vlan_id               = 12,
        multicast_policy      = "UCS-DEMO2",
        name                  = "OCB-12",
        native_vlan           = false
      },
      13 = {
        auto_allow_on_uplinks = true
        vlan_id               = 13,
        multicast_policy      = "UCS-DEMO2",
        name                  = "OCB-13",
        native_vlan           = false
      },
      14 = {
        auto_allow_on_uplinks = true
        vlan_id               = 14,
        multicast_policy      = "UCS-DEMO2",
        name                  = "TOTO12345",
        native_vlan           = false
      },
      14 = {
        auto_allow_on_uplinks = true
        vlan_id               = 14,
        multicast_policy      = "UCS-DEMO2",
        name                  = "OCB-14",
        native_vlan           = false
      },
      15 = {
        auto_allow_on_uplinks = true
        vlan_id               = 15,
        multicast_policy      = "UCS-DEMO2",
        name                  = "OCB-15",
        native_vlan           = false
      },
      16 = {
        auto_allow_on_uplinks = true
        vlan_id               = 16,
        multicast_policy      = "UCS-DEMO2",
        name                  = "OCB-16",
        native_vlan           = false
      },
      17 = {
        auto_allow_on_uplinks = true
        vlan_id               = 17,
        multicast_policy      = "UCS-DEMO2",
        name                  = "OCB-17",
        native_vlan           = false
      },
      18 = {
        auto_allow_on_uplinks = true
        vlan_id               = 18,
        multicast_policy      = "UCS-DEMO2",
        name                  = "OCB-18",
        native_vlan           = false
      },
      19 = {
        auto_allow_on_uplinks = true
        vlan_id               = 19,
        multicast_policy      = "UCS-DEMO2",
        name                  = "OCB-19",
        native_vlan           = false
      },
      20 = {
        auto_allow_on_uplinks = true
        vlan_id               = 20,
        multicast_policy      = "UCS-DEMO2",
        name                  = "OCB-20",
        native_vlan           = false
      },
      21 = {
        auto_allow_on_uplinks = true
        vlan_id               = 21,
        multicast_policy      = "UCS-DEMO2",
        name                  = "vSAN",
        native_vlan           = false
      },
      22 = {
        auto_allow_on_uplinks = true
        vlan_id               = 22,
        multicast_policy      = "UCS-DEMO2",
        name                  = "NSX-T_Host_Overlay",
        native_vlan           = false
      },
      23 = {
        auto_allow_on_uplinks = true
        vlan_id               = 23,
        multicast_policy      = "UCS-DEMO2",
        name                  = "NSX-T_Edge_Uplink1",
        native_vlan           = false
      },
      24 = {
        auto_allow_on_uplinks = true
        vlan_id               = 24,
        multicast_policy      = "UCS-DEMO2",
        name                  = "NSX-T_Edge_Uplink2",
        native_vlan           = false
      },
      25 = {
        auto_allow_on_uplinks = true
        vlan_id               = 25,
        multicast_policy      = "UCS-DEMO2",
        name                  = "NSX-T_Edge_Overlay",
        native_vlan           = false
      },
      26 = {
        auto_allow_on_uplinks = true
        vlan_id               = 26,
        multicast_policy      = "UCS-DEMO2",
        name                  = "OCB-26",
        native_vlan           = false
      },
      27 = {
        auto_allow_on_uplinks = true
        vlan_id               = 27,
        multicast_policy      = "UCS-DEMO2",
        name                  = "OCB-27",
        native_vlan           = false
      },
      28 = {
        auto_allow_on_uplinks = true
        vlan_id               = 28,
        multicast_policy      = "UCS-DEMO2",
        name                  = "OCB-28",
        native_vlan           = false
      },
      29 = {
        auto_allow_on_uplinks = true
        vlan_id               = 29,
        multicast_policy      = "UCS-DEMO2",
        name                  = "OCB-29",
        native_vlan           = false
      },
      30 = {
        auto_allow_on_uplinks = true
        vlan_id               = 30,
        multicast_policy      = "UCS-DEMO2",
        name                  = "OCB-30",
        native_vlan           = false
      },
      31 = {
        auto_allow_on_uplinks = true
        vlan_id               = 31,
        multicast_policy      = "UCS-DEMO2",
        name                  = "ISCSI",
        native_vlan           = false
      },
      32 = {
        auto_allow_on_uplinks = true
        vlan_id               = 32,
        multicast_policy      = "UCS-DEMO2",
        name                  = "NFS",
        native_vlan           = false
      },
      33 = {
        auto_allow_on_uplinks = true
        vlan_id               = 33,
        multicast_policy      = "UCS-DEMO2",
        name                  = "OCB-33",
        native_vlan           = false
      },
      34 = {
        auto_allow_on_uplinks = true
        vlan_id               = 34,
        multicast_policy      = "UCS-DEMO2",
        name                  = "OCB-34",
        native_vlan           = false
      },
      35 = {
        auto_allow_on_uplinks = true
        vlan_id               = 35,
        multicast_policy      = "UCS-DEMO2",
        name                  = "OCB-35",
        native_vlan           = false
      },
      36 = {
        auto_allow_on_uplinks = true
        vlan_id               = 36,
        multicast_policy      = "UCS-DEMO2",
        name                  = "OCB-36",
        native_vlan           = false
      },
      37 = {
        auto_allow_on_uplinks = true
        vlan_id               = 37,
        multicast_policy      = "UCS-DEMO2",
        name                  = "OCB-37",
        native_vlan           = false
      },
      38 = {
        auto_allow_on_uplinks = true
        vlan_id               = 38,
        multicast_policy      = "UCS-DEMO2",
        name                  = "OCB-38",
        native_vlan           = false
      },
      39 = {
        auto_allow_on_uplinks = true
        vlan_id               = 39,
        multicast_policy      = "UCS-DEMO2",
        name                  = "OCB-39",
        native_vlan           = false
      },
      40 = {
        auto_allow_on_uplinks = true
        vlan_id               = 40,
        multicast_policy      = "UCS-DEMO2",
        name                  = "OCB-40",
        native_vlan           = false
      },
      41 = {
        auto_allow_on_uplinks = true
        vlan_id               = 41,
        multicast_policy      = "UCS-DEMO2",
        name                  = "OCB-41",
        native_vlan           = false
      },
      42 = {
        auto_allow_on_uplinks = true
        vlan_id               = 42,
        multicast_policy      = "UCS-DEMO2",
        name                  = "OCB-42",
        native_vlan           = false
      },
      43 = {
        auto_allow_on_uplinks = true
        vlan_id               = 43,
        multicast_policy      = "UCS-DEMO2",
        name                  = "OCB-43",
        native_vlan           = false
      },
      44 = {
        auto_allow_on_uplinks = true
        vlan_id               = 44,
        multicast_policy      = "UCS-DEMO2",
        name                  = "OCB-44",
        native_vlan           = false
      },
      45 = {
        auto_allow_on_uplinks = true
        vlan_id               = 45,
        multicast_policy      = "UCS-DEMO2",
        name                  = "OCB-45",
        native_vlan           = false
      },
      46 = {
        auto_allow_on_uplinks = true
        vlan_id               = 46,
        multicast_policy      = "UCS-DEMO2",
        name                  = "OCB-46",
        native_vlan           = false
      },
      47 = {
        auto_allow_on_uplinks = true
        vlan_id               = 47,
        multicast_policy      = "UCS-DEMO2",
        name                  = "OCB-47",
        native_vlan           = false
      },
      48 = {
        auto_allow_on_uplinks = true
        vlan_id               = 48,
        multicast_policy      = "UCS-DEMO2",
        name                  = "OCB-48",
        native_vlan           = false
      },
      49 = {
        auto_allow_on_uplinks = true
        vlan_id               = 49,
        multicast_policy      = "UCS-DEMO2",
        name                  = "OCB-49",
        native_vlan           = false
      },
      50 = {
        auto_allow_on_uplinks = true
        vlan_id               = 50,
        multicast_policy      = "UCS-DEMO2",
        name                  = "OCB-50",
        native_vlan           = false
      },
      51 = {
        auto_allow_on_uplinks = true
        vlan_id               = 51,
        multicast_policy      = "UCS-DEMO2",
        name                  = "hx-storage-data",
        native_vlan           = false
      },
      52 = {
        auto_allow_on_uplinks = true
        vlan_id               = 52,
        multicast_policy      = "UCS-DEMO2",
        name                  = "hx-vmotion",
        native_vlan           = false
      },
      53 = {
        auto_allow_on_uplinks = true
        vlan_id               = 53,
        multicast_policy      = "UCS-DEMO2",
        name                  = "OCB-53",
        native_vlan           = false
      },
      54 = {
        auto_allow_on_uplinks = true
        vlan_id               = 54,
        multicast_policy      = "UCS-DEMO2",
        name                  = "OCB-54",
        native_vlan           = false
      },
      55 = {
        auto_allow_on_uplinks = true
        vlan_id               = 55,
        multicast_policy      = "UCS-DEMO2",
        name                  = "OCB-55",
        native_vlan           = false
      },
      56 = {
        auto_allow_on_uplinks = true
        vlan_id               = 56,
        multicast_policy      = "UCS-DEMO2",
        name                  = "OCB-56",
        native_vlan           = false
      },
      57 = {
        auto_allow_on_uplinks = true
        vlan_id               = 57,
        multicast_policy      = "UCS-DEMO2",
        name                  = "OCB-57",
        native_vlan           = false
      },
      58 = {
        auto_allow_on_uplinks = true
        vlan_id               = 58,
        multicast_policy      = "UCS-DEMO2",
        name                  = "OCB-58",
        native_vlan           = false
      },
      59 = {
        auto_allow_on_uplinks = true
        vlan_id               = 59,
        multicast_policy      = "UCS-DEMO2",
        name                  = "OCB-59",
        native_vlan           = false
      },
      60 = {
        auto_allow_on_uplinks = true
        vlan_id               = 60,
        multicast_policy      = "UCS-DEMO2",
        name                  = "OCB-60",
        native_vlan           = false
      },
      61 = {
        auto_allow_on_uplinks = true
        vlan_id               = 61,
        multicast_policy      = "UCS-DEMO2",
        name                  = "OCB-61",
        native_vlan           = false
      },
      62 = {
        auto_allow_on_uplinks = true
        vlan_id               = 62,
        multicast_policy      = "UCS-DEMO2",
        name                  = "OCB-62",
        native_vlan           = false
      },
      63 = {
        auto_allow_on_uplinks = true
        vlan_id               = 63,
        multicast_policy      = "UCS-DEMO2",
        name                  = "OCB-63",
        native_vlan           = false
      },
      64 = {
        auto_allow_on_uplinks = true
        vlan_id               = 64,
        multicast_policy      = "UCS-DEMO2",
        name                  = "OCB-64",
        native_vlan           = false
      },
      65 = {
        auto_allow_on_uplinks = true
        vlan_id               = 65,
        multicast_policy      = "UCS-DEMO2",
        name                  = "OCB-65",
        native_vlan           = false
      },
      66 = {
        auto_allow_on_uplinks = true
        vlan_id               = 66,
        multicast_policy      = "UCS-DEMO2",
        name                  = "OCB-66",
        native_vlan           = false
      },
      67 = {
        auto_allow_on_uplinks = true
        vlan_id               = 67,
        multicast_policy      = "UCS-DEMO2",
        name                  = "OCB-67",
        native_vlan           = false
      },
      68 = {
        auto_allow_on_uplinks = true
        vlan_id               = 68,
        multicast_policy      = "UCS-DEMO2",
        name                  = "OCB-68",
        native_vlan           = false
      },
      69 = {
        auto_allow_on_uplinks = true
        vlan_id               = 69,
        multicast_policy      = "UCS-DEMO2",
        name                  = "OCB-69",
        native_vlan           = false
      },
      70 = {
        auto_allow_on_uplinks = true
        vlan_id               = 70,
        multicast_policy      = "UCS-DEMO2",
        name                  = "OCB-70",
        native_vlan           = false
      },
      71 = {
        auto_allow_on_uplinks = true
        vlan_id               = 71,
        multicast_policy      = "UCS-DEMO2",
        name                  = "OCB-71",
        native_vlan           = false
      },
      72 = {
        auto_allow_on_uplinks = true
        vlan_id               = 72,
        multicast_policy      = "UCS-DEMO2",
        name                  = "OCB-72",
        native_vlan           = false
      },
      73 = {
        auto_allow_on_uplinks = true
        vlan_id               = 73,
        multicast_policy      = "UCS-DEMO2",
        name                  = "OCB-73",
        native_vlan           = false
      },
      74 = {
        auto_allow_on_uplinks = true
        vlan_id               = 74,
        multicast_policy      = "UCS-DEMO2",
        name                  = "OCB-74",
        native_vlan           = false
      },
      75 = {
        auto_allow_on_uplinks = true
        vlan_id               = 75,
        multicast_policy      = "UCS-DEMO2",
        name                  = "OCB-75",
        native_vlan           = false
      },
      76 = {
        auto_allow_on_uplinks = true
        vlan_id               = 76,
        multicast_policy      = "UCS-DEMO2",
        name                  = "OCB-76",
        native_vlan           = false
      },
      77 = {
        auto_allow_on_uplinks = true
        vlan_id               = 77,
        multicast_policy      = "UCS-DEMO2",
        name                  = "OCB-77",
        native_vlan           = false
      },
      78 = {
        auto_allow_on_uplinks = true
        vlan_id               = 78,
        multicast_policy      = "UCS-DEMO2",
        name                  = "OCB-78",
        native_vlan           = false
      },
      79 = {
        auto_allow_on_uplinks = true
        vlan_id               = 79,
        multicast_policy      = "UCS-DEMO2",
        name                  = "OCB-79",
        native_vlan           = false
      },
      80 = {
        auto_allow_on_uplinks = true
        vlan_id               = 80,
        multicast_policy      = "UCS-DEMO2",
        name                  = "OCB-80",
        native_vlan           = false
      },
      81 = {
        auto_allow_on_uplinks = true
        vlan_id               = 81,
        multicast_policy      = "UCS-DEMO2",
        name                  = "OCB-81",
        native_vlan           = false
      },
      82 = {
        auto_allow_on_uplinks = true
        vlan_id               = 82,
        multicast_policy      = "UCS-DEMO2",
        name                  = "OCB-82",
        native_vlan           = false
      },
      83 = {
        auto_allow_on_uplinks = true
        vlan_id               = 83,
        multicast_policy      = "UCS-DEMO2",
        name                  = "OCB-83",
        native_vlan           = false
      },
      84 = {
        auto_allow_on_uplinks = true
        vlan_id               = 84,
        multicast_policy      = "UCS-DEMO2",
        name                  = "OCB-84",
        native_vlan           = false
      },
      85 = {
        auto_allow_on_uplinks = true
        vlan_id               = 85,
        multicast_policy      = "UCS-DEMO2",
        name                  = "OCB-85",
        native_vlan           = false
      },
      86 = {
        auto_allow_on_uplinks = true
        vlan_id               = 86,
        multicast_policy      = "UCS-DEMO2",
        name                  = "OCB-86",
        native_vlan           = false
      },
      87 = {
        auto_allow_on_uplinks = true
        vlan_id               = 87,
        multicast_policy      = "UCS-DEMO2",
        name                  = "OCB-87",
        native_vlan           = false
      },
      88 = {
        auto_allow_on_uplinks = true
        vlan_id               = 88,
        multicast_policy      = "UCS-DEMO2",
        name                  = "OCB-88",
        native_vlan           = false
      },
      89 = {
        auto_allow_on_uplinks = true
        vlan_id               = 89,
        multicast_policy      = "UCS-DEMO2",
        name                  = "OCB-89",
        native_vlan           = false
      },
      90 = {
        auto_allow_on_uplinks = true
        vlan_id               = 90,
        multicast_policy      = "UCS-DEMO2",
        name                  = "OCB-90",
        native_vlan           = false
      },
      91 = {
        auto_allow_on_uplinks = true
        vlan_id               = 91,
        multicast_policy      = "UCS-DEMO2",
        name                  = "OCB-91",
        native_vlan           = false
      },
      92 = {
        auto_allow_on_uplinks = true
        vlan_id               = 92,
        multicast_policy      = "UCS-DEMO2",
        name                  = "OCB-92",
        native_vlan           = false
      },
      93 = {
        auto_allow_on_uplinks = true
        vlan_id               = 93,
        multicast_policy      = "UCS-DEMO2",
        name                  = "OCB-93",
        native_vlan           = false
      },
      94 = {
        auto_allow_on_uplinks = true
        vlan_id               = 94,
        multicast_policy      = "UCS-DEMO2",
        name                  = "OCB-94",
        native_vlan           = false
      },
      95 = {
        auto_allow_on_uplinks = true
        vlan_id               = 95,
        multicast_policy      = "UCS-DEMO2",
        name                  = "OCB-95",
        native_vlan           = false
      },
      96 = {
        auto_allow_on_uplinks = true
        vlan_id               = 96,
        multicast_policy      = "UCS-DEMO2",
        name                  = "OCB-96",
        native_vlan           = false
      },
      97 = {
        auto_allow_on_uplinks = true
        vlan_id               = 97,
        multicast_policy      = "UCS-DEMO2",
        name                  = "OCB-97",
        native_vlan           = false
      },
      98 = {
        auto_allow_on_uplinks = true
        vlan_id               = 98,
        multicast_policy      = "UCS-DEMO2",
        name                  = "OCB-98",
        native_vlan           = false
      },
      99 = {
        auto_allow_on_uplinks = true
        vlan_id               = 99,
        multicast_policy      = "UCS-DEMO2",
        name                  = "OCB-99",
        native_vlan           = false
      },
      100 = {
        auto_allow_on_uplinks = true
        vlan_id               = 100,
        multicast_policy      = "UCS-DEMO2",
        name                  = "ADMIN",
        native_vlan           = false
      },
      101 = {
        auto_allow_on_uplinks = true
        vlan_id               = 101,
        multicast_policy      = "UCS-DEMO2",
        name                  = "ESX-101",
        native_vlan           = false
      },
      102 = {
        auto_allow_on_uplinks = true
        vlan_id               = 102,
        multicast_policy      = "UCS-DEMO2",
        name                  = "ESX-102",
        native_vlan           = false
      },
      103 = {
        auto_allow_on_uplinks = true
        vlan_id               = 103,
        multicast_policy      = "UCS-DEMO2",
        name                  = "ESX-103",
        native_vlan           = false
      },
      104 = {
        auto_allow_on_uplinks = true
        vlan_id               = 104,
        multicast_policy      = "UCS-DEMO2",
        name                  = "ESX-104",
        native_vlan           = false
      },
      105 = {
        auto_allow_on_uplinks = true
        vlan_id               = 105,
        multicast_policy      = "UCS-DEMO2",
        name                  = "ESX-105",
        native_vlan           = false
      },
      106 = {
        auto_allow_on_uplinks = true
        vlan_id               = 106,
        multicast_policy      = "UCS-DEMO2",
        name                  = "ESX-106",
        native_vlan           = false
      },
      107 = {
        auto_allow_on_uplinks = true
        vlan_id               = 107,
        multicast_policy      = "UCS-DEMO2",
        name                  = "ESX-107",
        native_vlan           = false
      },
      108 = {
        auto_allow_on_uplinks = true
        vlan_id               = 108,
        multicast_policy      = "UCS-DEMO2",
        name                  = "ESX-108",
        native_vlan           = false
      },
      109 = {
        auto_allow_on_uplinks = true
        vlan_id               = 109,
        multicast_policy      = "UCS-DEMO2",
        name                  = "ESX-109",
        native_vlan           = false
      },
      110 = {
        auto_allow_on_uplinks = true
        vlan_id               = 110,
        multicast_policy      = "UCS-DEMO2",
        name                  = "ESX-110",
        native_vlan           = false
      },
      123 = {
        auto_allow_on_uplinks = true
        vlan_id               = 123,
        multicast_policy      = "UCS-DEMO2",
        name                  = "Test123",
        native_vlan           = false
      },
      213 = {
        auto_allow_on_uplinks = true
        vlan_id               = 213,
        multicast_policy      = "UCS-DEMO2",
        name                  = "IB-MGMT",
        native_vlan           = false
      },
      456 = {
        auto_allow_on_uplinks = true
        vlan_id               = 456,
        multicast_policy      = "UCS-DEMO2",
        name                  = "TOTOCAGIP",
        native_vlan           = false
      },
      756 = {
        auto_allow_on_uplinks = true
        vlan_id               = 756,
        multicast_policy      = "UCS-DEMO2",
        name                  = "CEPH-BE",
        native_vlan           = false
      },
      757 = {
        auto_allow_on_uplinks = true
        vlan_id               = 757,
        multicast_policy      = "UCS-DEMO2",
        name                  = "CEPH-FE",
        native_vlan           = false
      },
      837 = {
        auto_allow_on_uplinks = true
        vlan_id               = 837,
        multicast_policy      = "HyperFlex",
        name                  = "primary",
        native_vlan           = false
      },
      838 = {
        auto_allow_on_uplinks = true
        vlan_id               = 838,
        multicast_policy      = "UCS-DEMO2",
        name                  = "isolated",
        native_vlan           = false
      },
      897 = {
        auto_allow_on_uplinks = true
        vlan_id               = 897,
        multicast_policy      = "UCS-DEMO2",
        name                  = "AdminCAGIP-OSB3-897",
        native_vlan           = false
      },
      1101 = {
        auto_allow_on_uplinks = true
        vlan_id               = 1101,
        multicast_policy      = "UCS-DEMO2",
        name                  = "ACI-VMM-1101",
        native_vlan           = false
      },
      1102 = {
        auto_allow_on_uplinks = true
        vlan_id               = 1102,
        multicast_policy      = "UCS-DEMO2",
        name                  = "ACI-VMM-1102",
        native_vlan           = false
      },
      1103 = {
        auto_allow_on_uplinks = true
        vlan_id               = 1103,
        multicast_policy      = "UCS-DEMO2",
        name                  = "ACI-VMM-1103",
        native_vlan           = false
      },
      1104 = {
        auto_allow_on_uplinks = true
        vlan_id               = 1104,
        multicast_policy      = "UCS-DEMO2",
        name                  = "ACI-VMM-1104",
        native_vlan           = false
      },
      1105 = {
        auto_allow_on_uplinks = true
        vlan_id               = 1105,
        multicast_policy      = "UCS-DEMO2",
        name                  = "ACI-VMM-1105",
        native_vlan           = false
      },
      1106 = {
        auto_allow_on_uplinks = true
        vlan_id               = 1106,
        multicast_policy      = "UCS-DEMO2",
        name                  = "ACI-VMM-1106",
        native_vlan           = false
      },
      1107 = {
        auto_allow_on_uplinks = true
        vlan_id               = 1107,
        multicast_policy      = "UCS-DEMO2",
        name                  = "ACI-VMM-1107",
        native_vlan           = false
      },
      1108 = {
        auto_allow_on_uplinks = true
        vlan_id               = 1108,
        multicast_policy      = "UCS-DEMO2",
        name                  = "ACI-VMM-1108",
        native_vlan           = false
      },
      1109 = {
        auto_allow_on_uplinks = true
        vlan_id               = 1109,
        multicast_policy      = "UCS-DEMO2",
        name                  = "ACI-VMM-1109",
        native_vlan           = false
      },
      1110 = {
        auto_allow_on_uplinks = true
        vlan_id               = 1110,
        multicast_policy      = "UCS-DEMO2",
        name                  = "ACI-VMM-1110",
        native_vlan           = false
      },
      1111 = {
        auto_allow_on_uplinks = true
        vlan_id               = 1111,
        multicast_policy      = "UCS-DEMO2",
        name                  = "ACI-VMM-1111",
        native_vlan           = false
      },
      1112 = {
        auto_allow_on_uplinks = true
        vlan_id               = 1112,
        multicast_policy      = "UCS-DEMO2",
        name                  = "ACI-VMM-1112",
        native_vlan           = false
      },
      1113 = {
        auto_allow_on_uplinks = true
        vlan_id               = 1113,
        multicast_policy      = "UCS-DEMO2",
        name                  = "ACI-VMM-1113",
        native_vlan           = false
      },
      1114 = {
        auto_allow_on_uplinks = true
        vlan_id               = 1114,
        multicast_policy      = "UCS-DEMO2",
        name                  = "ACI-VMM-1114",
        native_vlan           = false
      },
      1115 = {
        auto_allow_on_uplinks = true
        vlan_id               = 1115,
        multicast_policy      = "UCS-DEMO2",
        name                  = "ACI-VMM-1115",
        native_vlan           = false
      },
      1116 = {
        auto_allow_on_uplinks = true
        vlan_id               = 1116,
        multicast_policy      = "UCS-DEMO2",
        name                  = "ACI-VMM-1116",
        native_vlan           = false
      },
      1117 = {
        auto_allow_on_uplinks = true
        vlan_id               = 1117,
        multicast_policy      = "UCS-DEMO2",
        name                  = "ACI-VMM-1117",
        native_vlan           = false
      },
      1118 = {
        auto_allow_on_uplinks = true
        vlan_id               = 1118,
        multicast_policy      = "UCS-DEMO2",
        name                  = "ACI-VMM-1118",
        native_vlan           = false
      },
      1119 = {
        auto_allow_on_uplinks = true
        vlan_id               = 1119,
        multicast_policy      = "UCS-DEMO2",
        name                  = "ACI-VMM-1119",
        native_vlan           = false
      },
      1120 = {
        auto_allow_on_uplinks = true
        vlan_id               = 1120,
        multicast_policy      = "UCS-DEMO2",
        name                  = "ACI-VMM-1120",
        native_vlan           = false
      },
      1121 = {
        auto_allow_on_uplinks = true
        vlan_id               = 1121,
        multicast_policy      = "UCS-DEMO2",
        name                  = "ACI-VMM-1121",
        native_vlan           = false
      },
      1122 = {
        auto_allow_on_uplinks = true
        vlan_id               = 1122,
        multicast_policy      = "UCS-DEMO2",
        name                  = "ACI-VMM-1122",
        native_vlan           = false
      },
      1123 = {
        auto_allow_on_uplinks = true
        vlan_id               = 1123,
        multicast_policy      = "UCS-DEMO2",
        name                  = "ACI-VMM-1123",
        native_vlan           = false
      },
      1124 = {
        auto_allow_on_uplinks = true
        vlan_id               = 1124,
        multicast_policy      = "UCS-DEMO2",
        name                  = "ACI-VMM-1124",
        native_vlan           = false
      },
      1125 = {
        auto_allow_on_uplinks = true
        vlan_id               = 1125,
        multicast_policy      = "UCS-DEMO2",
        name                  = "ACI-VMM-1125",
        native_vlan           = false
      },
      1126 = {
        auto_allow_on_uplinks = true
        vlan_id               = 1126,
        multicast_policy      = "UCS-DEMO2",
        name                  = "ACI-VMM-1126",
        native_vlan           = false
      },
      1127 = {
        auto_allow_on_uplinks = true
        vlan_id               = 1127,
        multicast_policy      = "UCS-DEMO2",
        name                  = "ACI-VMM-1127",
        native_vlan           = false
      },
      1128 = {
        auto_allow_on_uplinks = true
        vlan_id               = 1128,
        multicast_policy      = "UCS-DEMO2",
        name                  = "ACI-VMM-1128",
        native_vlan           = false
      },
      1129 = {
        auto_allow_on_uplinks = true
        vlan_id               = 1129,
        multicast_policy      = "UCS-DEMO2",
        name                  = "ACI-VMM-1129",
        native_vlan           = false
      },
      1130 = {
        auto_allow_on_uplinks = true
        vlan_id               = 1130,
        multicast_policy      = "UCS-DEMO2",
        name                  = "ACI-VMM-1130",
        native_vlan           = false
      },
      1131 = {
        auto_allow_on_uplinks = true
        vlan_id               = 1131,
        multicast_policy      = "UCS-DEMO2",
        name                  = "ACI-VMM-1131",
        native_vlan           = false
      },
      1132 = {
        auto_allow_on_uplinks = true
        vlan_id               = 1132,
        multicast_policy      = "UCS-DEMO2",
        name                  = "ACI-VMM-1132",
        native_vlan           = false
      },
      1133 = {
        auto_allow_on_uplinks = true
        vlan_id               = 1133,
        multicast_policy      = "UCS-DEMO2",
        name                  = "ACI-VMM-1133",
        native_vlan           = false
      },
      1134 = {
        auto_allow_on_uplinks = true
        vlan_id               = 1134,
        multicast_policy      = "UCS-DEMO2",
        name                  = "ACI-VMM-1134",
        native_vlan           = false
      },
      1135 = {
        auto_allow_on_uplinks = true
        vlan_id               = 1135,
        multicast_policy      = "UCS-DEMO2",
        name                  = "ACI-VMM-1135",
        native_vlan           = false
      },
      1136 = {
        auto_allow_on_uplinks = true
        vlan_id               = 1136,
        multicast_policy      = "UCS-DEMO2",
        name                  = "ACI-VMM-1136",
        native_vlan           = false
      },
      1137 = {
        auto_allow_on_uplinks = true
        vlan_id               = 1137,
        multicast_policy      = "UCS-DEMO2",
        name                  = "ACI-VMM-1137",
        native_vlan           = false
      },
      1138 = {
        auto_allow_on_uplinks = true
        vlan_id               = 1138,
        multicast_policy      = "UCS-DEMO2",
        name                  = "ACI-VMM-1138",
        native_vlan           = false
      },
      1139 = {
        auto_allow_on_uplinks = true
        vlan_id               = 1139,
        multicast_policy      = "UCS-DEMO2",
        name                  = "ACI-VMM-1139",
        native_vlan           = false
      },
      1140 = {
        auto_allow_on_uplinks = true
        vlan_id               = 1140,
        multicast_policy      = "UCS-DEMO2",
        name                  = "ACI-VMM-1140",
        native_vlan           = false
      },
      1141 = {
        auto_allow_on_uplinks = true
        vlan_id               = 1141,
        multicast_policy      = "UCS-DEMO2",
        name                  = "ACI-VMM-1141",
        native_vlan           = false
      },
      1142 = {
        auto_allow_on_uplinks = true
        vlan_id               = 1142,
        multicast_policy      = "UCS-DEMO2",
        name                  = "ACI-VMM-1142",
        native_vlan           = false
      },
      1143 = {
        auto_allow_on_uplinks = true
        vlan_id               = 1143,
        multicast_policy      = "UCS-DEMO2",
        name                  = "ACI-VMM-1143",
        native_vlan           = false
      },
      1144 = {
        auto_allow_on_uplinks = true
        vlan_id               = 1144,
        multicast_policy      = "UCS-DEMO2",
        name                  = "ACI-VMM-1144",
        native_vlan           = false
      },
      1145 = {
        auto_allow_on_uplinks = true
        vlan_id               = 1145,
        multicast_policy      = "UCS-DEMO2",
        name                  = "ACI-VMM-1145",
        native_vlan           = false
      },
      1146 = {
        auto_allow_on_uplinks = true
        vlan_id               = 1146,
        multicast_policy      = "UCS-DEMO2",
        name                  = "ACI-VMM-1146",
        native_vlan           = false
      },
      1147 = {
        auto_allow_on_uplinks = true
        vlan_id               = 1147,
        multicast_policy      = "UCS-DEMO2",
        name                  = "ACI-VMM-1147",
        native_vlan           = false
      },
      1148 = {
        auto_allow_on_uplinks = true
        vlan_id               = 1148,
        multicast_policy      = "UCS-DEMO2",
        name                  = "ACI-VMM-1148",
        native_vlan           = false
      },
      1149 = {
        auto_allow_on_uplinks = true
        vlan_id               = 1149,
        multicast_policy      = "UCS-DEMO2",
        name                  = "ACI-VMM-1149",
        native_vlan           = false
      },
      1150 = {
        auto_allow_on_uplinks = true
        vlan_id               = 1150,
        multicast_policy      = "UCS-DEMO2",
        name                  = "ACI-VMM-1150",
        native_vlan           = false
      },
      1945 = {
        auto_allow_on_uplinks = true
        vlan_id               = 1945,
        multicast_policy      = "UCS-DEMO2",
        name                  = "ProdCAGIP-CAGIP-1945",
        native_vlan           = false
      },
      3110 = {
        auto_allow_on_uplinks = true
        vlan_id               = 3110,
        multicast_policy      = "UCS-DEMO2",
        name                  = "iSCSI-A",
        native_vlan           = false
      },
      3120 = {
        auto_allow_on_uplinks = true
        vlan_id               = 3120,
        multicast_policy      = "UCS-DEMO2",
        name                  = "iSCSI-B",
        native_vlan           = false
      },
    }
  }
  "UCS-DEMO2-B" = {
    description  = ""
    organization = "UCS-DEMO2"
    tags = [
      {
        key   = "easyucs_origin",
        value = "convert",
      },
      {
        key   = "easyucs_version",
        value = "0.9.8",
      },
    ]
    vlans = {
      1 = {
        auto_allow_on_uplinks = true
        vlan_id               = 1,
        multicast_policy      = "UCS-DEMO2",
        name                  = "default",
        native_vlan           = true
      },
      2 = {
        auto_allow_on_uplinks = true
        vlan_id               = 2,
        multicast_policy      = "UCS-DEMO2",
        name                  = "hx-inband-mgmt",
        native_vlan           = false
      },
      3 = {
        auto_allow_on_uplinks = true
        vlan_id               = 3,
        multicast_policy      = "UCS-DEMO2",
        name                  = "OCB-3",
        native_vlan           = false
      },
      4 = {
        auto_allow_on_uplinks = true
        vlan_id               = 4,
        multicast_policy      = "UCS-DEMO2",
        name                  = "OCB-4",
        native_vlan           = false
      },
      5 = {
        auto_allow_on_uplinks = true
        vlan_id               = 5,
        multicast_policy      = "UCS-DEMO2",
        name                  = "OCB-5",
        native_vlan           = false
      },
      6 = {
        auto_allow_on_uplinks = true
        vlan_id               = 6,
        multicast_policy      = "UCS-DEMO2",
        name                  = "OCB-6",
        native_vlan           = false
      },
      7 = {
        auto_allow_on_uplinks = true
        vlan_id               = 7,
        multicast_policy      = "UCS-DEMO2",
        name                  = "OCB-7",
        native_vlan           = false
      },
      8 = {
        auto_allow_on_uplinks = true
        vlan_id               = 8,
        multicast_policy      = "UCS-DEMO2",
        name                  = "OCB-8",
        native_vlan           = false
      },
      9 = {
        auto_allow_on_uplinks = true
        vlan_id               = 9,
        multicast_policy      = "UCS-DEMO2",
        name                  = "OCB-9",
        native_vlan           = false
      },
      10 = {
        auto_allow_on_uplinks = true
        vlan_id               = 10,
        multicast_policy      = "UCS-DEMO2",
        name                  = "OCB-10",
        native_vlan           = false
      },
      11 = {
        auto_allow_on_uplinks = true
        vlan_id               = 11,
        multicast_policy      = "UCS-DEMO2",
        name                  = "OCB-11",
        native_vlan           = false
      },
      12 = {
        auto_allow_on_uplinks = true
        vlan_id               = 12,
        multicast_policy      = "UCS-DEMO2",
        name                  = "OCB-12",
        native_vlan           = false
      },
      13 = {
        auto_allow_on_uplinks = true
        vlan_id               = 13,
        multicast_policy      = "UCS-DEMO2",
        name                  = "OCB-13",
        native_vlan           = false
      },
      14 = {
        auto_allow_on_uplinks = true
        vlan_id               = 14,
        multicast_policy      = "UCS-DEMO2",
        name                  = "OCB-14",
        native_vlan           = false
      },
      15 = {
        auto_allow_on_uplinks = true
        vlan_id               = 15,
        multicast_policy      = "UCS-DEMO2",
        name                  = "OCB-15",
        native_vlan           = false
      },
      16 = {
        auto_allow_on_uplinks = true
        vlan_id               = 16,
        multicast_policy      = "UCS-DEMO2",
        name                  = "OCB-16",
        native_vlan           = false
      },
      17 = {
        auto_allow_on_uplinks = true
        vlan_id               = 17,
        multicast_policy      = "UCS-DEMO2",
        name                  = "OCB-17",
        native_vlan           = false
      },
      18 = {
        auto_allow_on_uplinks = true
        vlan_id               = 18,
        multicast_policy      = "UCS-DEMO2",
        name                  = "OCB-18",
        native_vlan           = false
      },
      19 = {
        auto_allow_on_uplinks = true
        vlan_id               = 19,
        multicast_policy      = "UCS-DEMO2",
        name                  = "OCB-19",
        native_vlan           = false
      },
      20 = {
        auto_allow_on_uplinks = true
        vlan_id               = 20,
        multicast_policy      = "UCS-DEMO2",
        name                  = "OCB-20",
        native_vlan           = false
      },
      21 = {
        auto_allow_on_uplinks = true
        vlan_id               = 21,
        multicast_policy      = "UCS-DEMO2",
        name                  = "vSAN",
        native_vlan           = false
      },
      22 = {
        auto_allow_on_uplinks = true
        vlan_id               = 22,
        multicast_policy      = "UCS-DEMO2",
        name                  = "NSX-T_Host_Overlay",
        native_vlan           = false
      },
      23 = {
        auto_allow_on_uplinks = true
        vlan_id               = 23,
        multicast_policy      = "UCS-DEMO2",
        name                  = "NSX-T_Edge_Uplink1",
        native_vlan           = false
      },
      24 = {
        auto_allow_on_uplinks = true
        vlan_id               = 24,
        multicast_policy      = "UCS-DEMO2",
        name                  = "NSX-T_Edge_Uplink2",
        native_vlan           = false
      },
      25 = {
        auto_allow_on_uplinks = true
        vlan_id               = 25,
        multicast_policy      = "UCS-DEMO2",
        name                  = "NSX-T_Edge_Overlay",
        native_vlan           = false
      },
      26 = {
        auto_allow_on_uplinks = true
        vlan_id               = 26,
        multicast_policy      = "UCS-DEMO2",
        name                  = "OCB-26",
        native_vlan           = false
      },
      27 = {
        auto_allow_on_uplinks = true
        vlan_id               = 27,
        multicast_policy      = "UCS-DEMO2",
        name                  = "OCB-27",
        native_vlan           = false
      },
      28 = {
        auto_allow_on_uplinks = true
        vlan_id               = 28,
        multicast_policy      = "UCS-DEMO2",
        name                  = "OCB-28",
        native_vlan           = false
      },
      29 = {
        auto_allow_on_uplinks = true
        vlan_id               = 29,
        multicast_policy      = "UCS-DEMO2",
        name                  = "OCB-29",
        native_vlan           = false
      },
      30 = {
        auto_allow_on_uplinks = true
        vlan_id               = 30,
        multicast_policy      = "UCS-DEMO2",
        name                  = "OCB-30",
        native_vlan           = false
      },
      31 = {
        auto_allow_on_uplinks = true
        vlan_id               = 31,
        multicast_policy      = "UCS-DEMO2",
        name                  = "ISCSI",
        native_vlan           = false
      },
      32 = {
        auto_allow_on_uplinks = true
        vlan_id               = 32,
        multicast_policy      = "UCS-DEMO2",
        name                  = "NFS",
        native_vlan           = false
      },
      33 = {
        auto_allow_on_uplinks = true
        vlan_id               = 33,
        multicast_policy      = "UCS-DEMO2",
        name                  = "OCB-33",
        native_vlan           = false
      },
      34 = {
        auto_allow_on_uplinks = true
        vlan_id               = 34,
        multicast_policy      = "UCS-DEMO2",
        name                  = "OCB-34",
        native_vlan           = false
      },
      35 = {
        auto_allow_on_uplinks = true
        vlan_id               = 35,
        multicast_policy      = "UCS-DEMO2",
        name                  = "OCB-35",
        native_vlan           = false
      },
      36 = {
        auto_allow_on_uplinks = true
        vlan_id               = 36,
        multicast_policy      = "UCS-DEMO2",
        name                  = "OCB-36",
        native_vlan           = false
      },
      37 = {
        auto_allow_on_uplinks = true
        vlan_id               = 37,
        multicast_policy      = "UCS-DEMO2",
        name                  = "OCB-37",
        native_vlan           = false
      },
      38 = {
        auto_allow_on_uplinks = true
        vlan_id               = 38,
        multicast_policy      = "UCS-DEMO2",
        name                  = "OCB-38",
        native_vlan           = false
      },
      39 = {
        auto_allow_on_uplinks = true
        vlan_id               = 39,
        multicast_policy      = "UCS-DEMO2",
        name                  = "OCB-39",
        native_vlan           = false
      },
      40 = {
        auto_allow_on_uplinks = true
        vlan_id               = 40,
        multicast_policy      = "UCS-DEMO2",
        name                  = "OCB-40",
        native_vlan           = false
      },
      41 = {
        auto_allow_on_uplinks = true
        vlan_id               = 41,
        multicast_policy      = "UCS-DEMO2",
        name                  = "OCB-41",
        native_vlan           = false
      },
      42 = {
        auto_allow_on_uplinks = true
        vlan_id               = 42,
        multicast_policy      = "UCS-DEMO2",
        name                  = "OCB-42",
        native_vlan           = false
      },
      43 = {
        auto_allow_on_uplinks = true
        vlan_id               = 43,
        multicast_policy      = "UCS-DEMO2",
        name                  = "OCB-43",
        native_vlan           = false
      },
      44 = {
        auto_allow_on_uplinks = true
        vlan_id               = 44,
        multicast_policy      = "UCS-DEMO2",
        name                  = "OCB-44",
        native_vlan           = false
      },
      45 = {
        auto_allow_on_uplinks = true
        vlan_id               = 45,
        multicast_policy      = "UCS-DEMO2",
        name                  = "OCB-45",
        native_vlan           = false
      },
      46 = {
        auto_allow_on_uplinks = true
        vlan_id               = 46,
        multicast_policy      = "UCS-DEMO2",
        name                  = "OCB-46",
        native_vlan           = false
      },
      47 = {
        auto_allow_on_uplinks = true
        vlan_id               = 47,
        multicast_policy      = "UCS-DEMO2",
        name                  = "OCB-47",
        native_vlan           = false
      },
      48 = {
        auto_allow_on_uplinks = true
        vlan_id               = 48,
        multicast_policy      = "UCS-DEMO2",
        name                  = "OCB-48",
        native_vlan           = false
      },
      49 = {
        auto_allow_on_uplinks = true
        vlan_id               = 49,
        multicast_policy      = "UCS-DEMO2",
        name                  = "OCB-49",
        native_vlan           = false
      },
      50 = {
        auto_allow_on_uplinks = true
        vlan_id               = 50,
        multicast_policy      = "UCS-DEMO2",
        name                  = "OCB-50",
        native_vlan           = false
      },
      51 = {
        auto_allow_on_uplinks = true
        vlan_id               = 51,
        multicast_policy      = "UCS-DEMO2",
        name                  = "hx-storage-data",
        native_vlan           = false
      },
      52 = {
        auto_allow_on_uplinks = true
        vlan_id               = 52,
        multicast_policy      = "UCS-DEMO2",
        name                  = "hx-vmotion",
        native_vlan           = false
      },
      53 = {
        auto_allow_on_uplinks = true
        vlan_id               = 53,
        multicast_policy      = "UCS-DEMO2",
        name                  = "OCB-53",
        native_vlan           = false
      },
      54 = {
        auto_allow_on_uplinks = true
        vlan_id               = 54,
        multicast_policy      = "UCS-DEMO2",
        name                  = "OCB-54",
        native_vlan           = false
      },
      55 = {
        auto_allow_on_uplinks = true
        vlan_id               = 55,
        multicast_policy      = "UCS-DEMO2",
        name                  = "OCB-55",
        native_vlan           = false
      },
      56 = {
        auto_allow_on_uplinks = true
        vlan_id               = 56,
        multicast_policy      = "UCS-DEMO2",
        name                  = "OCB-56",
        native_vlan           = false
      },
      57 = {
        auto_allow_on_uplinks = true
        vlan_id               = 57,
        multicast_policy      = "UCS-DEMO2",
        name                  = "OCB-57",
        native_vlan           = false
      },
      58 = {
        auto_allow_on_uplinks = true
        vlan_id               = 58,
        multicast_policy      = "UCS-DEMO2",
        name                  = "OCB-58",
        native_vlan           = false
      },
      59 = {
        auto_allow_on_uplinks = true
        vlan_id               = 59,
        multicast_policy      = "UCS-DEMO2",
        name                  = "OCB-59",
        native_vlan           = false
      },
      60 = {
        auto_allow_on_uplinks = true
        vlan_id               = 60,
        multicast_policy      = "UCS-DEMO2",
        name                  = "OCB-60",
        native_vlan           = false
      },
      61 = {
        auto_allow_on_uplinks = true
        vlan_id               = 61,
        multicast_policy      = "UCS-DEMO2",
        name                  = "OCB-61",
        native_vlan           = false
      },
      62 = {
        auto_allow_on_uplinks = true
        vlan_id               = 62,
        multicast_policy      = "UCS-DEMO2",
        name                  = "OCB-62",
        native_vlan           = false
      },
      63 = {
        auto_allow_on_uplinks = true
        vlan_id               = 63,
        multicast_policy      = "UCS-DEMO2",
        name                  = "OCB-63",
        native_vlan           = false
      },
      64 = {
        auto_allow_on_uplinks = true
        vlan_id               = 64,
        multicast_policy      = "UCS-DEMO2",
        name                  = "OCB-64",
        native_vlan           = false
      },
      65 = {
        auto_allow_on_uplinks = true
        vlan_id               = 65,
        multicast_policy      = "UCS-DEMO2",
        name                  = "OCB-65",
        native_vlan           = false
      },
      66 = {
        auto_allow_on_uplinks = true
        vlan_id               = 66,
        multicast_policy      = "UCS-DEMO2",
        name                  = "OCB-66",
        native_vlan           = false
      },
      67 = {
        auto_allow_on_uplinks = true
        vlan_id               = 67,
        multicast_policy      = "UCS-DEMO2",
        name                  = "OCB-67",
        native_vlan           = false
      },
      68 = {
        auto_allow_on_uplinks = true
        vlan_id               = 68,
        multicast_policy      = "UCS-DEMO2",
        name                  = "OCB-68",
        native_vlan           = false
      },
      69 = {
        auto_allow_on_uplinks = true
        vlan_id               = 69,
        multicast_policy      = "UCS-DEMO2",
        name                  = "OCB-69",
        native_vlan           = false
      },
      70 = {
        auto_allow_on_uplinks = true
        vlan_id               = 70,
        multicast_policy      = "UCS-DEMO2",
        name                  = "OCB-70",
        native_vlan           = false
      },
      71 = {
        auto_allow_on_uplinks = true
        vlan_id               = 71,
        multicast_policy      = "UCS-DEMO2",
        name                  = "OCB-71",
        native_vlan           = false
      },
      72 = {
        auto_allow_on_uplinks = true
        vlan_id               = 72,
        multicast_policy      = "UCS-DEMO2",
        name                  = "OCB-72",
        native_vlan           = false
      },
      73 = {
        auto_allow_on_uplinks = true
        vlan_id               = 73,
        multicast_policy      = "UCS-DEMO2",
        name                  = "OCB-73",
        native_vlan           = false
      },
      74 = {
        auto_allow_on_uplinks = true
        vlan_id               = 74,
        multicast_policy      = "UCS-DEMO2",
        name                  = "OCB-74",
        native_vlan           = false
      },
      75 = {
        auto_allow_on_uplinks = true
        vlan_id               = 75,
        multicast_policy      = "UCS-DEMO2",
        name                  = "OCB-75",
        native_vlan           = false
      },
      76 = {
        auto_allow_on_uplinks = true
        vlan_id               = 76,
        multicast_policy      = "UCS-DEMO2",
        name                  = "OCB-76",
        native_vlan           = false
      },
      77 = {
        auto_allow_on_uplinks = true
        vlan_id               = 77,
        multicast_policy      = "UCS-DEMO2",
        name                  = "OCB-77",
        native_vlan           = false
      },
      78 = {
        auto_allow_on_uplinks = true
        vlan_id               = 78,
        multicast_policy      = "UCS-DEMO2",
        name                  = "OCB-78",
        native_vlan           = false
      },
      79 = {
        auto_allow_on_uplinks = true
        vlan_id               = 79,
        multicast_policy      = "UCS-DEMO2",
        name                  = "OCB-79",
        native_vlan           = false
      },
      80 = {
        auto_allow_on_uplinks = true
        vlan_id               = 80,
        multicast_policy      = "UCS-DEMO2",
        name                  = "OCB-80",
        native_vlan           = false
      },
      81 = {
        auto_allow_on_uplinks = true
        vlan_id               = 81,
        multicast_policy      = "UCS-DEMO2",
        name                  = "OCB-81",
        native_vlan           = false
      },
      82 = {
        auto_allow_on_uplinks = true
        vlan_id               = 82,
        multicast_policy      = "UCS-DEMO2",
        name                  = "OCB-82",
        native_vlan           = false
      },
      83 = {
        auto_allow_on_uplinks = true
        vlan_id               = 83,
        multicast_policy      = "UCS-DEMO2",
        name                  = "OCB-83",
        native_vlan           = false
      },
      84 = {
        auto_allow_on_uplinks = true
        vlan_id               = 84,
        multicast_policy      = "UCS-DEMO2",
        name                  = "OCB-84",
        native_vlan           = false
      },
      85 = {
        auto_allow_on_uplinks = true
        vlan_id               = 85,
        multicast_policy      = "UCS-DEMO2",
        name                  = "OCB-85",
        native_vlan           = false
      },
      86 = {
        auto_allow_on_uplinks = true
        vlan_id               = 86,
        multicast_policy      = "UCS-DEMO2",
        name                  = "OCB-86",
        native_vlan           = false
      },
      87 = {
        auto_allow_on_uplinks = true
        vlan_id               = 87,
        multicast_policy      = "UCS-DEMO2",
        name                  = "OCB-87",
        native_vlan           = false
      },
      88 = {
        auto_allow_on_uplinks = true
        vlan_id               = 88,
        multicast_policy      = "UCS-DEMO2",
        name                  = "OCB-88",
        native_vlan           = false
      },
      89 = {
        auto_allow_on_uplinks = true
        vlan_id               = 89,
        multicast_policy      = "UCS-DEMO2",
        name                  = "OCB-89",
        native_vlan           = false
      },
      90 = {
        auto_allow_on_uplinks = true
        vlan_id               = 90,
        multicast_policy      = "UCS-DEMO2",
        name                  = "OCB-90",
        native_vlan           = false
      },
      91 = {
        auto_allow_on_uplinks = true
        vlan_id               = 91,
        multicast_policy      = "UCS-DEMO2",
        name                  = "OCB-91",
        native_vlan           = false
      },
      92 = {
        auto_allow_on_uplinks = true
        vlan_id               = 92,
        multicast_policy      = "UCS-DEMO2",
        name                  = "OCB-92",
        native_vlan           = false
      },
      93 = {
        auto_allow_on_uplinks = true
        vlan_id               = 93,
        multicast_policy      = "UCS-DEMO2",
        name                  = "OCB-93",
        native_vlan           = false
      },
      94 = {
        auto_allow_on_uplinks = true
        vlan_id               = 94,
        multicast_policy      = "UCS-DEMO2",
        name                  = "OCB-94",
        native_vlan           = false
      },
      95 = {
        auto_allow_on_uplinks = true
        vlan_id               = 95,
        multicast_policy      = "UCS-DEMO2",
        name                  = "OCB-95",
        native_vlan           = false
      },
      96 = {
        auto_allow_on_uplinks = true
        vlan_id               = 96,
        multicast_policy      = "UCS-DEMO2",
        name                  = "OCB-96",
        native_vlan           = false
      },
      97 = {
        auto_allow_on_uplinks = true
        vlan_id               = 97,
        multicast_policy      = "UCS-DEMO2",
        name                  = "OCB-97",
        native_vlan           = false
      },
      98 = {
        auto_allow_on_uplinks = true
        vlan_id               = 98,
        multicast_policy      = "UCS-DEMO2",
        name                  = "OCB-98",
        native_vlan           = false
      },
      99 = {
        auto_allow_on_uplinks = true
        vlan_id               = 99,
        multicast_policy      = "UCS-DEMO2",
        name                  = "OCB-99",
        native_vlan           = false
      },
      100 = {
        auto_allow_on_uplinks = true
        vlan_id               = 100,
        multicast_policy      = "UCS-DEMO2",
        name                  = "ADMIN",
        native_vlan           = false
      },
      101 = {
        auto_allow_on_uplinks = true
        vlan_id               = 101,
        multicast_policy      = "UCS-DEMO2",
        name                  = "ESX-101",
        native_vlan           = false
      },
      102 = {
        auto_allow_on_uplinks = true
        vlan_id               = 102,
        multicast_policy      = "UCS-DEMO2",
        name                  = "ESX-102",
        native_vlan           = false
      },
      103 = {
        auto_allow_on_uplinks = true
        vlan_id               = 103,
        multicast_policy      = "UCS-DEMO2",
        name                  = "ESX-103",
        native_vlan           = false
      },
      104 = {
        auto_allow_on_uplinks = true
        vlan_id               = 104,
        multicast_policy      = "UCS-DEMO2",
        name                  = "ESX-104",
        native_vlan           = false
      },
      105 = {
        auto_allow_on_uplinks = true
        vlan_id               = 105,
        multicast_policy      = "UCS-DEMO2",
        name                  = "ESX-105",
        native_vlan           = false
      },
      106 = {
        auto_allow_on_uplinks = true
        vlan_id               = 106,
        multicast_policy      = "UCS-DEMO2",
        name                  = "ESX-106",
        native_vlan           = false
      },
      107 = {
        auto_allow_on_uplinks = true
        vlan_id               = 107,
        multicast_policy      = "UCS-DEMO2",
        name                  = "ESX-107",
        native_vlan           = false
      },
      108 = {
        auto_allow_on_uplinks = true
        vlan_id               = 108,
        multicast_policy      = "UCS-DEMO2",
        name                  = "ESX-108",
        native_vlan           = false
      },
      109 = {
        auto_allow_on_uplinks = true
        vlan_id               = 109,
        multicast_policy      = "UCS-DEMO2",
        name                  = "ESX-109",
        native_vlan           = false
      },
      110 = {
        auto_allow_on_uplinks = true
        vlan_id               = 110,
        multicast_policy      = "UCS-DEMO2",
        name                  = "ESX-110",
        native_vlan           = false
      },
      123 = {
        auto_allow_on_uplinks = true
        vlan_id               = 123,
        multicast_policy      = "UCS-DEMO2",
        name                  = "Test123",
        native_vlan           = false
      },
      213 = {
        auto_allow_on_uplinks = true
        vlan_id               = 213,
        multicast_policy      = "UCS-DEMO2",
        name                  = "IB-MGMT",
        native_vlan           = false
      },
      456 = {
        auto_allow_on_uplinks = true
        vlan_id               = 456,
        multicast_policy      = "UCS-DEMO2",
        name                  = "TOTOCAGIP",
        native_vlan           = false
      },
      756 = {
        auto_allow_on_uplinks = true
        vlan_id               = 756,
        multicast_policy      = "UCS-DEMO2",
        name                  = "CEPH-BE",
        native_vlan           = false
      },
      757 = {
        auto_allow_on_uplinks = true
        vlan_id               = 757,
        multicast_policy      = "UCS-DEMO2",
        name                  = "CEPH-FE",
        native_vlan           = false
      },
      837 = {
        auto_allow_on_uplinks = true
        vlan_id               = 837,
        multicast_policy      = "HyperFlex",
        name                  = "primary",
        native_vlan           = false
      },
      838 = {
        auto_allow_on_uplinks = true
        vlan_id               = 838,
        multicast_policy      = "UCS-DEMO2",
        name                  = "isolated",
        native_vlan           = false
      },
      897 = {
        auto_allow_on_uplinks = true
        vlan_id               = 897,
        multicast_policy      = "UCS-DEMO2",
        name                  = "AdminCAGIP-OSB3-897",
        native_vlan           = false
      },
      1101 = {
        auto_allow_on_uplinks = true
        vlan_id               = 1101,
        multicast_policy      = "UCS-DEMO2",
        name                  = "ACI-VMM-1101",
        native_vlan           = false
      },
      1102 = {
        auto_allow_on_uplinks = true
        vlan_id               = 1102,
        multicast_policy      = "UCS-DEMO2",
        name                  = "ACI-VMM-1102",
        native_vlan           = false
      },
      1103 = {
        auto_allow_on_uplinks = true
        vlan_id               = 1103,
        multicast_policy      = "UCS-DEMO2",
        name                  = "ACI-VMM-1103",
        native_vlan           = false
      },
      1104 = {
        auto_allow_on_uplinks = true
        vlan_id               = 1104,
        multicast_policy      = "UCS-DEMO2",
        name                  = "ACI-VMM-1104",
        native_vlan           = false
      },
      1105 = {
        auto_allow_on_uplinks = true
        vlan_id               = 1105,
        multicast_policy      = "UCS-DEMO2",
        name                  = "ACI-VMM-1105",
        native_vlan           = false
      },
      1106 = {
        auto_allow_on_uplinks = true
        vlan_id               = 1106,
        multicast_policy      = "UCS-DEMO2",
        name                  = "ACI-VMM-1106",
        native_vlan           = false
      },
      1107 = {
        auto_allow_on_uplinks = true
        vlan_id               = 1107,
        multicast_policy      = "UCS-DEMO2",
        name                  = "ACI-VMM-1107",
        native_vlan           = false
      },
      1108 = {
        auto_allow_on_uplinks = true
        vlan_id               = 1108,
        multicast_policy      = "UCS-DEMO2",
        name                  = "ACI-VMM-1108",
        native_vlan           = false
      },
      1109 = {
        auto_allow_on_uplinks = true
        vlan_id               = 1109,
        multicast_policy      = "UCS-DEMO2",
        name                  = "ACI-VMM-1109",
        native_vlan           = false
      },
      1110 = {
        auto_allow_on_uplinks = true
        vlan_id               = 1110,
        multicast_policy      = "UCS-DEMO2",
        name                  = "ACI-VMM-1110",
        native_vlan           = false
      },
      1111 = {
        auto_allow_on_uplinks = true
        vlan_id               = 1111,
        multicast_policy      = "UCS-DEMO2",
        name                  = "ACI-VMM-1111",
        native_vlan           = false
      },
      1112 = {
        auto_allow_on_uplinks = true
        vlan_id               = 1112,
        multicast_policy      = "UCS-DEMO2",
        name                  = "ACI-VMM-1112",
        native_vlan           = false
      },
      1113 = {
        auto_allow_on_uplinks = true
        vlan_id               = 1113,
        multicast_policy      = "UCS-DEMO2",
        name                  = "ACI-VMM-1113",
        native_vlan           = false
      },
      1114 = {
        auto_allow_on_uplinks = true
        vlan_id               = 1114,
        multicast_policy      = "UCS-DEMO2",
        name                  = "ACI-VMM-1114",
        native_vlan           = false
      },
      1115 = {
        auto_allow_on_uplinks = true
        vlan_id               = 1115,
        multicast_policy      = "UCS-DEMO2",
        name                  = "ACI-VMM-1115",
        native_vlan           = false
      },
      1116 = {
        auto_allow_on_uplinks = true
        vlan_id               = 1116,
        multicast_policy      = "UCS-DEMO2",
        name                  = "ACI-VMM-1116",
        native_vlan           = false
      },
      1117 = {
        auto_allow_on_uplinks = true
        vlan_id               = 1117,
        multicast_policy      = "UCS-DEMO2",
        name                  = "ACI-VMM-1117",
        native_vlan           = false
      },
      1118 = {
        auto_allow_on_uplinks = true
        vlan_id               = 1118,
        multicast_policy      = "UCS-DEMO2",
        name                  = "ACI-VMM-1118",
        native_vlan           = false
      },
      1119 = {
        auto_allow_on_uplinks = true
        vlan_id               = 1119,
        multicast_policy      = "UCS-DEMO2",
        name                  = "ACI-VMM-1119",
        native_vlan           = false
      },
      1120 = {
        auto_allow_on_uplinks = true
        vlan_id               = 1120,
        multicast_policy      = "UCS-DEMO2",
        name                  = "ACI-VMM-1120",
        native_vlan           = false
      },
      1121 = {
        auto_allow_on_uplinks = true
        vlan_id               = 1121,
        multicast_policy      = "UCS-DEMO2",
        name                  = "ACI-VMM-1121",
        native_vlan           = false
      },
      1122 = {
        auto_allow_on_uplinks = true
        vlan_id               = 1122,
        multicast_policy      = "UCS-DEMO2",
        name                  = "ACI-VMM-1122",
        native_vlan           = false
      },
      1123 = {
        auto_allow_on_uplinks = true
        vlan_id               = 1123,
        multicast_policy      = "UCS-DEMO2",
        name                  = "ACI-VMM-1123",
        native_vlan           = false
      },
      1124 = {
        auto_allow_on_uplinks = true
        vlan_id               = 1124,
        multicast_policy      = "UCS-DEMO2",
        name                  = "ACI-VMM-1124",
        native_vlan           = false
      },
      1125 = {
        auto_allow_on_uplinks = true
        vlan_id               = 1125,
        multicast_policy      = "UCS-DEMO2",
        name                  = "ACI-VMM-1125",
        native_vlan           = false
      },
      1126 = {
        auto_allow_on_uplinks = true
        vlan_id               = 1126,
        multicast_policy      = "UCS-DEMO2",
        name                  = "ACI-VMM-1126",
        native_vlan           = false
      },
      1127 = {
        auto_allow_on_uplinks = true
        vlan_id               = 1127,
        multicast_policy      = "UCS-DEMO2",
        name                  = "ACI-VMM-1127",
        native_vlan           = false
      },
      1128 = {
        auto_allow_on_uplinks = true
        vlan_id               = 1128,
        multicast_policy      = "UCS-DEMO2",
        name                  = "ACI-VMM-1128",
        native_vlan           = false
      },
      1129 = {
        auto_allow_on_uplinks = true
        vlan_id               = 1129,
        multicast_policy      = "UCS-DEMO2",
        name                  = "ACI-VMM-1129",
        native_vlan           = false
      },
      1130 = {
        auto_allow_on_uplinks = true
        vlan_id               = 1130,
        multicast_policy      = "UCS-DEMO2",
        name                  = "ACI-VMM-1130",
        native_vlan           = false
      },
      1131 = {
        auto_allow_on_uplinks = true
        vlan_id               = 1131,
        multicast_policy      = "UCS-DEMO2",
        name                  = "ACI-VMM-1131",
        native_vlan           = false
      },
      1132 = {
        auto_allow_on_uplinks = true
        vlan_id               = 1132,
        multicast_policy      = "UCS-DEMO2",
        name                  = "ACI-VMM-1132",
        native_vlan           = false
      },
      1133 = {
        auto_allow_on_uplinks = true
        vlan_id               = 1133,
        multicast_policy      = "UCS-DEMO2",
        name                  = "ACI-VMM-1133",
        native_vlan           = false
      },
      1134 = {
        auto_allow_on_uplinks = true
        vlan_id               = 1134,
        multicast_policy      = "UCS-DEMO2",
        name                  = "ACI-VMM-1134",
        native_vlan           = false
      },
      1135 = {
        auto_allow_on_uplinks = true
        vlan_id               = 1135,
        multicast_policy      = "UCS-DEMO2",
        name                  = "ACI-VMM-1135",
        native_vlan           = false
      },
      1136 = {
        auto_allow_on_uplinks = true
        vlan_id               = 1136,
        multicast_policy      = "UCS-DEMO2",
        name                  = "ACI-VMM-1136",
        native_vlan           = false
      },
      1137 = {
        auto_allow_on_uplinks = true
        vlan_id               = 1137,
        multicast_policy      = "UCS-DEMO2",
        name                  = "ACI-VMM-1137",
        native_vlan           = false
      },
      1138 = {
        auto_allow_on_uplinks = true
        vlan_id               = 1138,
        multicast_policy      = "UCS-DEMO2",
        name                  = "ACI-VMM-1138",
        native_vlan           = false
      },
      1139 = {
        auto_allow_on_uplinks = true
        vlan_id               = 1139,
        multicast_policy      = "UCS-DEMO2",
        name                  = "ACI-VMM-1139",
        native_vlan           = false
      },
      1140 = {
        auto_allow_on_uplinks = true
        vlan_id               = 1140,
        multicast_policy      = "UCS-DEMO2",
        name                  = "ACI-VMM-1140",
        native_vlan           = false
      },
      1141 = {
        auto_allow_on_uplinks = true
        vlan_id               = 1141,
        multicast_policy      = "UCS-DEMO2",
        name                  = "ACI-VMM-1141",
        native_vlan           = false
      },
      1142 = {
        auto_allow_on_uplinks = true
        vlan_id               = 1142,
        multicast_policy      = "UCS-DEMO2",
        name                  = "ACI-VMM-1142",
        native_vlan           = false
      },
      1143 = {
        auto_allow_on_uplinks = true
        vlan_id               = 1143,
        multicast_policy      = "UCS-DEMO2",
        name                  = "ACI-VMM-1143",
        native_vlan           = false
      },
      1144 = {
        auto_allow_on_uplinks = true
        vlan_id               = 1144,
        multicast_policy      = "UCS-DEMO2",
        name                  = "ACI-VMM-1144",
        native_vlan           = false
      },
      1145 = {
        auto_allow_on_uplinks = true
        vlan_id               = 1145,
        multicast_policy      = "UCS-DEMO2",
        name                  = "ACI-VMM-1145",
        native_vlan           = false
      },
      1146 = {
        auto_allow_on_uplinks = true
        vlan_id               = 1146,
        multicast_policy      = "UCS-DEMO2",
        name                  = "ACI-VMM-1146",
        native_vlan           = false
      },
      1147 = {
        auto_allow_on_uplinks = true
        vlan_id               = 1147,
        multicast_policy      = "UCS-DEMO2",
        name                  = "ACI-VMM-1147",
        native_vlan           = false
      },
      1148 = {
        auto_allow_on_uplinks = true
        vlan_id               = 1148,
        multicast_policy      = "UCS-DEMO2",
        name                  = "ACI-VMM-1148",
        native_vlan           = false
      },
      1149 = {
        auto_allow_on_uplinks = true
        vlan_id               = 1149,
        multicast_policy      = "UCS-DEMO2",
        name                  = "ACI-VMM-1149",
        native_vlan           = false
      },
      1150 = {
        auto_allow_on_uplinks = true
        vlan_id               = 1150,
        multicast_policy      = "UCS-DEMO2",
        name                  = "ACI-VMM-1150",
        native_vlan           = false
      },
      1945 = {
        auto_allow_on_uplinks = true
        vlan_id               = 1945,
        multicast_policy      = "UCS-DEMO2",
        name                  = "ProdCAGIP-CAGIP-1945",
        native_vlan           = false
      },
      3110 = {
        auto_allow_on_uplinks = true
        vlan_id               = 3110,
        multicast_policy      = "UCS-DEMO2",
        name                  = "iSCSI-A",
        native_vlan           = false
      },
      3120 = {
        auto_allow_on_uplinks = true
        vlan_id               = 3120,
        multicast_policy      = "UCS-DEMO2",
        name                  = "iSCSI-B",
        native_vlan           = false
      },
    }
  }
}