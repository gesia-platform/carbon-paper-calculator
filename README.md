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
 - addPaperSize(A4, 50000)
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
getPaperWeight(paperType)
```

**Calculate Carbon Footprint (Public)**: Users can calculate the carbon footprint by providing the paper type and the quantity they have consumed. This public function returns an estimate of the carbon footprint associated with the specified paper type and quantity.
```
calculateCO2ByPaperWeight(paperType, count)

A4(5g)
 - calculateCO2ByPaperWeight(A4, 1)
 - 565000000000000 (in UI it should be divied by 18 decimals 0.000565)
```
```
calculateCO2ByPaperSize(paperType, count)

A4(210mm x 297mm)
 - calculateCO2ByPaperSize(A4, 1)
 - 563824800000000 (in UI it should be divied by 18 decimals 0.0005638248)
```

## 📝 How is it calculated?
It calculates the carbon emissions for each paper type by referencing the average carbon emissions per ton of paper from [How to read Paper Carbon Footprints](https://www.holmen.com/en/paper/sustainability/sustainability-stories/how-to-undrestand-carbon-footprints)

## 📚 Sources
- [How to read Paper Carbon Footprints](https://www.holmen.com/en/paper/sustainability/sustainability-stories/how-to-undrestand-carbon-footprints)

## 📄 License
This project is licensed under the [MIT License](LICENSE).