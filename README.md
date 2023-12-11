# 🌳 Paper Carbon Footprint Calculator

[![License](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)

## 📖 Overview
The Smart Contract-Based Carbon Footprint Calculator is a decentralized tool designed to estimate the carbon footprint associated with paper consumption. This smart contract operates on a blockchain platform and provides a straightforward way to calculate and retrieve carbon emission data from the blockchain.

## ✨ Features
**Set Paper Weight/Size by Type (Operator-Only)**: This feature allows authorized operators to set the weight or size of paper for each paper type. It provides flexibility to update the data as needed.
```
addPaperWeight(paperType, weight)

A4(5g)
 - Scale by 10000
 - addPaperWeight(A4, 50000)
```
```
addPaperSize(paperType, width, height)

A4(210mm x 297mm)
 - Convert mm to m
 - Scale by 10000
 - addPaperSize(A4, 2100, 2970)
```

**Get Paper Weight/Size by Type (Public)**: Users can retrieve the weight or size of paper for a specific type using this public function. It offers transparency and access to paper data.
```
getPaperWeight(paperType)
```
```
getPaperSize(paperType)
```

**Calculate Carbon Footprint (Public)**: Users can calculate the carbon footprint by providing the paper type and the quantity they have consumed. This public function returns an estimate of the carbon footprint associated with the specified paper type and quantity.
```
calculateCO2ByPaperWeight(paperType, count)

A4(5g)
 - calculateCO2ByPaperWeight(A4, 1)
 - 565000000000000 (in UI it should be divided by 18 decimals 0.000565)
```
```
calculateCO2ByPaperSize(paperType, count)

A4(210mm x 297mm)
 - calculateCO2ByPaperSize(A4, 1)
 - 563824800000000 (in UI it should be divided by 18 decimals 0.0005638248)
```

## 🚀 Smart Contract Deployment Information

The Smart Contract-Based Carbon Footprint Calculator has been deployed on the Gesia Chain. Below are the deployment details:

### Operator Contract

- **Contract Address**: 0x2694127C083dDD8cCA4a48fbdA63886091F784Aa
- **Transaction Hash**: 0x60c355edd3a72c97f78b679ca9757a92b7cd81872f0bc98d6af38a590200eac8

### Calculator Contract

- **Contract Address**: 0x402a11Bca59645d021F22401AaaC88d0Ae4d3467
- **Transaction Hash**: 0x7d316cc6a8adcf895a422a8d50c2d559c04fe89c689d80d4ad4e48fbda6f041f

You can verify the deployment of the Calculator Contract by checking the contract address and transaction hash on [Gesia Explorer](https://explorer.gesia.io). Here are the links for your convenience:

- [Operator Contract on Gesia Chain](https://explorer.gesia.io/address/0x2694127C083dDD8cCA4a48fbdA63886091F784Aa)
- [Calculator Contract on Gesia Chain](https://explorer.gesia.io/address/0x402a11Bca59645d021F22401AaaC88d0Ae4d3467)

## 📝 How is it calculated?
It calculates the carbon emissions for each paper type by referencing the average carbon emissions per ton of paper from [How to read Paper Carbon Footprints](https://www.holmen.com/en/paper/sustainability/sustainability-stories/how-to-undrestand-carbon-footprints)

The following formula is the essential formula of Carbon Footprint Calculator.
``` plain
# If you know the weight of paper
0.113 x weight of paper(kg) x number of paper

If you don't know the weight of paper
0.113 x 80 x area of paper(m^2) x number of paper
 ```

## 📚 Sources
- [How to read Paper Carbon Footprints](https://www.holmen.com/en/paper/sustainability/sustainability-stories/how-to-undrestand-carbon-footprints)

## 📄 License
This project is licensed under the [MIT License](LICENSE).