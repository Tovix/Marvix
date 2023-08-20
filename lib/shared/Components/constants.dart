Map<String, dynamic>?  token;
List<Map<int, dynamic>> fakedItems = [

  {0:
  {"title": "Slim Fit Crew Neck Printed T-Shirt",
  "images": [
    "https://dfcdn.defacto.com.tr/7/Z3084AZ_23SP_ER105_01_02.jpg"
  ]}
  },
  {0: {"title": "Slim Fit Crew Neck Printed T-Shirt",
  "images": [
    "https://dfcdn.defacto.com.tr/7/Z3086AZ_23SP_BR341_03_03.jpg"
  ]}},
  {0: {"title": "Comfort Fit Crew Neck T-Shirt",
  "images": [
    "https://dfcdn.defacto.com.tr/7/Z2450AZ_23SP_WT34_02_05.jpg"
  ]}},
  {0: {"title": "Oversize Fit Crew Neck Cotton Premium T-Shirt",
  "images": [
    "https://dfcdn.defacto.com.tr/7/T3661AZ_23SP_BK81_01_02.jpg"
  ]}},
  {0: {"title": "NBA Los Angeles Lakers Licensed Crew Neck T-Shirt",
  "images": [
    "https://dfcdn.defacto.com.tr/7/A6753AX_23HS_BG662_01_02.jpg"
  ]}},
  {0: {"title": "Slim Fit Polo Neck Long Sleeve Cotton Shirt",
  "images": [
    "https://dfcdn.defacto.com.tr/7/M7180AZ_23SP_KH277_01_03.jpg"
  ]}},
  {0: {"title": "Regular Fit Short Sleeve Shirt",
  "images": [
    "https://dfcdn.defacto.com.tr/7/Z5281AZ_23SM_BN534_02_03.jpg"
  ]}},
  {0: {"title": "Slim Fit Polo Collar Poplin Long Sleeve Shirt",
  "images": [
    "https://dfcdn.defacto.com.tr/7/R4340AZ_23AU_BK27_01_01.jpg"
  ]}},
  {0: {"title": "Regular Fit Polo Neck Suede Long Sleeve Shirt",
  "images": [
    "https://dfcdn.defacto.com.tr/7/T6266AZ_23SP_BG56_03_01.jpg"
  ]}},
  {0: {"title": "Slim Fit Long Sleeve Cotton Shirt",
  "images": [
    "https://dfcdn.defacto.com.tr/7/R1680AZ_23SP_TR157_01_02.jpg"
  ]}},
  {0: {"title": "Regular Fit Viscose Printed Short Sleeve Shirt",
    "images": [
      "https://dfcdn.defacto.com.tr/7/Y2903AZ_23SM_BE509_02_04.jpg"
    ]}},

  {0: {"title": "Regular Fit Crew Neck Long Sleeve Shirt",
    "images": [
      "https://dfcdn.defacto.com.tr/7/A6788AX_23SM_WT34_01_02.jpg"
    ]}},
  {0: {"title": "Regular Fit Long Sleeve Linen Look Shirt",
    "images": [
      "https://dfcdn.defacto.com.tr/7/V2522AZ_23SP_RD44_01_03.jpg"
    ]}},
  {0: {"title": "Oversize Fit Shirt Collar Gabardine Long Sleeve Shirt",
    "images": [
      "https://dfcdn.defacto.com.tr/7/Y7519AZ_23SP_BN326_03_03.jpg"
    ]}},
  {0: {"title": "Oversize Fit Shirt Collar Poplin Long Sleeve Shirt",
    "images": [
      "https://dfcdn.defacto.com.tr/7/V3984AZ_23SP_BE62_01_02.jpg"
    ]}},
  {0: {"title": "Regular Fit Shirt Collar Linen Blend Short Sleeve Shirt",
    "images": [
      "https://dfcdn.defacto.com.tr/7/A5548AX_23SM_BG701_02_01.jpg"
    ]}},
  {0: {"title": "Regular Fit Flap Collar Short Sleeve Shirt",
    "images": [
      "https://dfcdn.defacto.com.tr/7/A6859AX_23SM_ER99_01_03.jpg"
    ]}},
  {0: {"title": "Cool Regular Fit Pajama Collar Printed Short Sleeve Shirt",
    "images": [
      "https://dfcdn.defacto.com.tr/7/Z2919AZ_23SM_WT46_01_02.jpg"
    ]}},
  {0: {"title": "Regular Fit V-Neck Patterned Short Sleeve Crop Shirt",
    "images": [
      "https://dfcdn.defacto.com.tr/7/A6860AX_23SM_OG78_01_02.jpg"
    ]}},
  {0: {"title": "Women Long Sleeve Shirts",
    "images": [
      "https://dfcdn.defacto.com.tr/7/I8266AZ_23SP_BN348_01_03.jpg"
    ]}},
  {0: {"title": "Traditional Regular Fit Crew Neck Long Sleeve Shirt",
    "images": [
      "https://dfcdn.defacto.com.tr/7/U2962AZ_23SM_GN690_01_03.jpg"
    ]}},

  {0: {"title": "Jogger Pants",
    "images": [
      "https://dfcdn.defacto.com.tr/7/Z7916AZ_23SP_BK27_01_04.jpg"
    ]}},
  {0: {"title": "Regular Fit Linen Trousers",
    "images": [
      "https://dfcdn.defacto.com.tr/7/X4538AZ_23SM_GN797_02_02.jpg"
    ]}},
  {0: {"title": "Regular Cargo Jogger Pants",
    "images": [
      "https://dfcdn.defacto.com.tr/7/A4171AX_23SM_BG732_02_01.jpg"
    ]}},
  {0: {"title": "New Regular Fit Chino Pants",
    "images": [
      "https://dfcdn.defacto.com.tr/7/V0062AZ_23SP_AR168_02_03.jpg"
    ]}},
  {0: {"title": "Slim Fit Sweatpants",
    "images": [
      "https://dfcdn.defacto.com.tr/7/Z5536AZ_23SP_GR210_02_03.jpg"
    ]}},
  {0: {"title": "Jogger Standard Fit Trousers",
    "images": [
      "https://dfcdn.defacto.com.tr/7/W8266AZ_23SP_BK27_01_02.jpg"
    ]}},
  {0: {"title": "Regular Cargo Jogger Pants",
    "images": [
      "https://dfcdn.defacto.com.tr/7/Z7995AZ_23SP_BK81_01_02.jpg"
    ]}},
  {0: {"title": "Wide Leg Pants",
    "images": [
      "https://dfcdn.defacto.com.tr/7/A5029AX_23SP_KH433_01_01.jpg"
    ]}},
  {0: {"title": "Regular Fit Sweatpants",
    "images": [
      "https://dfcdn.defacto.com.tr/7/Z6000AZ_23SP_BN207_02_03.jpg"
    ]}},
  {0: {"title": "Extra Slim Fit Chino Pants",
    "images": [
      "https://dfcdn.defacto.com.tr/7/R0298AZ_23SP_BG220_01_03.jpg"
    ]}},

  {0: {"title": "Rebeca Slim Fit High Waist Gabardine Trousers",
    "images": [
      "https://dfcdn.defacto.com.tr/7/M0649AZ_23SM_BG732_01_02.jpg"
    ]}},
  {0: {"title": "90's Wide Leg Jeans",
    "images": [
      "https://dfcdn.defacto.com.tr/7/A3179AX_23SM_WT1_01_03.jpg"
    ]}},
  {0: {"title": "Palazzo Viscose Pants",
    "images": [
      "https://dfcdn.defacto.com.tr/7/Y9960AZ_23SM_BK27_01_01.jpg"
    ]}},
  {0: {"title": "Cool Parachute Gabardine Pants",
    "images": [
      "https://dfcdn.defacto.com.tr/7/A2281AX_23SP_KH445_01_01.jpg"
    ]}},
  {0: {"title": "Slim Fit High Waist Pocketed Textured Trousers",
    "images": [
      "https://dfcdn.defacto.com.tr/7/Y4197AZ_23SM_BK81_02_01.jpg"
    ]}},
  {0: {"title": "Straight Fit Flared Trousers",
    "images": [
      "https://dfcdn.defacto.com.tr/7/A4851AX_23SM_OG146_01_03.jpg"
    ]}},
  {0: {"title": "Mary Straight Fit Boyfriend Pile Jeans",
    "images": [
      "https://dfcdn.defacto.com.tr/7/A0727AX_23SP_NM36_02_02.jpg"
    ]}},
  {0: {"title": "Straight Fit Cargo Crepe Trousers",
    "images": [
      "https://dfcdn.defacto.com.tr/7/A1153AX_23SM_PN126_02_02.jpg"
    ]}},
  {0: {"title": "jogger Ankle Length With Pockets Pants",
    "images": [
      "https://dfcdn.defacto.com.tr/7/Z2582AZ_23SM_GN1186_01_02.jpg"
    ]}},
  {0: {"title": "Parachute Standard Trousers",
    "images": [
      "https://dfcdn.defacto.com.tr/7/A3161AX_23SM_ER140_01_02.jpg"
    ]}},

  {0: {"title": "Fit NBA Boston Celtics Licensed Oversize Fit Hoodie Undershirt",
    "images": [
      "https://dfcdn.defacto.com.tr/7/A1709AX_23SM_NV176_01_02.jpg"
    ]}},
  {0: {"title": "Oversize Fit Printed Crew Neck Sleeveless Undershirt",
    "images": [
      "https://dfcdn.defacto.com.tr/7/A2238AX_23SM_BK81_04_01.jpg"
    ]}},
  {0: {"title": "Loose Fit Printed Crew Neck Undershirt",
    "images": [
      "https://dfcdn.defacto.com.tr/7/Z7067AZ_23HS_BK81_01_01.jpg"
    ]}},
  {0: {"title": "Fit Regular Fit NFL Las Vegas Raiders Jogger Sweatpants",
    "images": [
      "https://dfcdn.defacto.com.tr/7/Y4152AZ_22AU_BK81_02_03.jpg"
    ]}},
  {0: {"title": "Slim Fit Flexible Leg Scuba Diving Fabric Sports Jogger",
    "images": [
      "https://dfcdn.defacto.com.tr/7/W7394AZ_23SP_ER105_01_02.jpg"
    ]}},

  {0: {"title": "Fit Athlete Tights",
    "images": [
      "https://dfcdn.defacto.com.tr/768/Z0815AZ_23SP_BK81_04_03.jpg"
    ]}},
  {0: {"title": "Fit Seamless Waist Tights",
    "images": [
      "https://dfcdn.defacto.com.tr/7/T8379AZ_21SP_BN250_01_02.jpg"
    ]}},
  {0: {"title": "High Waisted Mini Leggings",
    "images": [
      "https://dfcdn.defacto.com.tr/7/W8538AZ_22SM_OG311_01_03.jpg"
    ]}},
  {0: {"title": "High Waisted Ankle Leggings",
    "images": [
      "https://dfcdn.defacto.com.tr/7/X0175AZ_22SP_PR252_02_02.jpg"
    ]}}
];
