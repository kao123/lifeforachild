# Z-Score Calculations #

## Calculating Z-Score for Height, Weight, BMI ##

Please refer to [DesignSpecifications](http://code.google.com/p/lifeforachild/wiki/DesignSpecifications) for information on calculating Z-Scores for Height, Weight and BMI.

## Calculating Z-Score for Systolic and Diastolic Blood Pressure (SBP and DBP) ##
**Data needed:**  sex, calculated Height Z-Score (HZS) and age (in years, decimal) – as blood pressure depends on age, sex and height

**1st step** – Calculate expected BP according to the formulae below (different for boys and girls)

**2nd step** – Calculate BP Z-score by the formula Z-score = (actual BP – expected BP)/standard deviation. The standard deviation varies according to whether SBP or DBP sex.

**Systolic BP for boys**

Calculate expected SBP =
```
= 102.19768 + 1.82416*(age-10) + 0.12776*(age-10)^2 + 0.00249*(age-10)^3 - 0.00135*(age-10)^4 + 2.73157*(HZS) - 0.19618*(HZS)^2 - 0.04659*(HZS)^3 + 0.00947*(HZS)^4
```

Then Z-score = (actual BP – expected BP) / 10.7128

**Systolic BP for girls**

Calculate expected SBP =
```
= 102.01027 + 1.94397*(age-10) + 0.00598*(age-10)^2 - 0.00789*(age-10)^3 - 0.00059*(age-10)^4 + 2.03526*(HZS) - 0.02534*(HZS)^2 - 0.01884*(HZS)^3 + 0.00121*(HZS)^4
```

Then Z-score = (actual BP – expected BP) / 10.4855

**Diastolic BP for boys**

Calculate expected SBP =
```
= 61.01207 + 0.68314*(age-10) - 0.09835*(age-10)^2 + 0.01711*(age-10)^3 + 0.00045*(age-10)^4 + 1.46993*(HZS) - 0.07849*(HZS)^2 - 0.03114*(HZS)^3 - 0.00967*(HZS)^4
```

Then Z-score = (actual BP – expected BP) / 11.6032

**Diastolic BP for girls**

Calculate expected SBP =
```
= 60.5051 + 1.01301*(age-10) + 0.01157*(age-10)^2 + 0.00424*(age-10)^3 - 0.00137*(age-10)^4 + 1.16641*(HZS) + 0.12795*(HZS)^2-0.03869*(HZS)^3 - 0.00079*(HZS)^4
```

Then Z-score = (actual BP – expected BP) / 10.9573

Ref: Fourth Report on Diagnosis, Evaluation and Treatment of High Blood Pressure in Children and Adolescents, Pediatrics 2004;111:555-576