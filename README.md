# 🌳 Paper Carbon Footprint Calculator

[![License](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)

## 📖 Overview
The Smart Contract-Based Carbon Footprint Calculator is a decentralized tool designed to estimate the carbon footprint associated with paper consumption. This smart contract operates on a blockchain platform and provides a straightforward way to calculate and retrieve carbon emission data from the blockchain.

## ✨ Features
### Set Paper Weight/Size by Type (Operator-Only)
> This feature allows authorized operators to set the weight or size of paper for each paper type. It provides flexibility to update the data as needed.

### addPaperWeight(paperType, weight)
```
Overview
 - This function sets the paper weight according to the "paperType" parameter.

Parameter:
 - paperType(Type): "paperType" is a "paper size name" parameter. Mainly in accordance with ISO 216 standards.
 - weight(kg): "weight" is the weight value of the paper in the "paperType" parameter.

Example:
 - paperType: "A4", weight: 0.005(kg, = 5g)
    1. Scale by 10000
    2. addPaperWeight(A4, 50000)
```

### addPaperSize(paperType, width, height)
```
Overview
 - This function sets the paper size according to the "paperType" parameter.

Parameter:
 - paperType(Type): "paperType" is a "paper size name" parameter. Mainly in accordance with ISO 216 standards.
 - width(m): "width" is the width value of the paper in the "paperType" parameter.
 - height(m): "height" is the height value of the paper in the "paperType" parameter.

Example:
 - A4(210mm x 297mm = 0.210m x 0.297m):
    1. Convert mm to m
    2. Scale by 10000
    3. addPaperSize(A4, 2100, 2970)
```

### Get Paper Weight/Size by Type (Public)
> Users can retrieve the weight or size of paper for a specific type using this public function. It offers transparency and access to paper data.

### getPaperWeight(paperType)
```
Overview
 - This function gets the paper weight according to the "paperType" parameter.

Parameter:
 - paperType(Type): "paperType" is a "paper size name" parameter. Mainly in accordance with ISO 216 standards.
```

### getPaperSize(paperType)
```
Overview
 - This function gets the paper size according to the "paperType" parameter.

Parameter:
 - paperType(Type): "paperType" is a "paper size name" parameter. Mainly in accordance with ISO 216 standards.
```

### Calculate Carbon Footprint (Public)
> Users can calculate the carbon footprint by providing the paper type and the quantity they have consumed. This public function returns an estimate of the carbon footprint associated with the specified paper type and quantity.

### calculateCO2ByPaperWeight(paperType, count)
```
Overview
 - This function calculates the carbon footprint according to the paper weight of the "paperType" parameter.
 
Parameter:
 - paperType(Type): "paperType" is a "paper size name" parameter. Mainly in accordance with ISO 216 standards.
 - count(Number): "count" is the count value of the paper in the "paperType" parameter.

Example:
 - paperType: "A4", count: 1
    1. calculateCO2ByPaperWeight(A4, 1)
    2. 565000000000000 (in UI it should be divided by 18 decimals 0.000565)
```

### calculateCO2ByPaperSize(paperType, count)
```
Overview
 - This function calculates the carbon footprint according to the paper size of the "paperType" parameter.

Parameter:
 - paperType(Type): "paperType" is a "paper size name" parameter. Mainly in accordance with ISO 216 standards.
 - count(Number): "count" is the count value of the paper in the "paperType" parameter.

Example:
 - A4(210mm x 297mm = 0.210m x 0.297m), count(1)
    1. calculateCO2ByPaperSize(A4, 1)
    2. 563824800000000 (in UI it should be divided by 18 decimals 0.0005638248)
```

## 🚀 Smart Contract Deployment Information
The Smart Contract-Based Carbon Footprint Calculator has been deployed on the Gesia Chain. Below are the deployment details:

### Operator Contract
```
Contract Address: 0x2694127C083dDD8cCA4a48fbdA63886091F784Aa
Transaction Hash: 0x60c355edd3a72c97f78b679ca9757a92b7cd81872f0bc98d6af38a590200eac8
```

### Calculator Contract
```
Contract Address: 0x402a11Bca59645d021F22401AaaC88d0Ae4d3467
Transaction Hash: 0x7d316cc6a8adcf895a422a8d50c2d559c04fe89c689d80d4ad4e48fbda6f041f
```

You can verify the deployment of the Calculator Contract by checking the contract address and transaction hash on [Gesia Explorer](https://explorer.gesia.io). Here are the links for your convenience:

- [Operator Contract on Gesia Chain](https://explorer.gesia.io/address/0x2694127C083dDD8cCA4a48fbdA63886091F784Aa)
- [Calculator Contract on Gesia Chain](https://explorer.gesia.io/address/0x402a11Bca59645d021F22401AaaC88d0Ae4d3467)

## 📝 How is it calculated?
It calculates the carbon emissions for each paper type by referencing the average carbon emissions per ton of paper from [How to read Paper Carbon Footprints](https://www.holmen.com/en/paper/sustainability/sustainability-stories/how-to-undrestand-carbon-footprints)

The following formula is the essential formula of Carbon Footprint Calculator.
``` plain
# emission factor of paper: 0.113

# If you know the weight of paper
emission factor of paper(kgCO2/kg) x weight of paper(kg) x number of paper

# If you don't know the weight of paper
emission factor of paper(kgCO2/kg) x 80 x area of paper(m²) x number of paper
```

Please refer to the [Link](https://docs.google.com/spreadsheets/d/1Ux_1j0GeKGeHm8ODT-M-Hr23sCayQYw70shNw2le0Bs/edit#gid=0) for more detailed info. 

## 📚 Sources
- [How to read Paper Carbon Footprints](https://www.holmen.com/en/paper/sustainability/sustainability-stories/how-to-undrestand-carbon-footprints)

## 📄 License
This project is licensed under the [MIT License](LICENSE).