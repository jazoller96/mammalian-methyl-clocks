# mammalian-methyl-clocks
Coefficients and age transformations for many mammalian and other intrinsic epigenetic clocks, including directions for applying and citing them

## Summary of available clocks
| File with Clock Coefficients | Inverse Age Transformation | Parameter 1 | Parameter 2 | Source Paper |
| :--- | :---: | :---: | :---: | :--- |
| [Bats (Skin) Clocks](ClockCoefficients/Bats_ClockCoef.CombinedWithAnnotation.csv) | All use ``fun_sqrt.inv()`` | -- | -- | [Wilkinson, 2022, Nature Communications](https://doi.org/10.1038/s41467-022-33102-5) |
| [Bottlenose Dolphin (Blood,Skin) Clocks](ClockCoefficients/Bottlenose_Barratclough2021_ClockCoef.CombinedWithAnnotation.csv) | -- | -- | -- | [Barratclough, 2021, Journal of Zoological and Botanical Gardens](https://doi.org/10.3390/jzbg2030030) |
| [Bottlenose Dolphin (Blood,Skin) Clocks](ClockCoefficients/Bottlenose_Robeck2021_ClockCoef.CombinedWithAnnotation.csv) | All use ``fun_llin2.inv()`` | Age of Sexual Maturity ( TODO ) | Gestation Time ( TODO ) | [Robeck, 2021, Frontiers in Marine Science](https://doi.org/10.3389/fmars.2021.713373) |
| [Cat + Human-Cat (Blood) Clocks](ClockCoefficients/Cat-HumanCat_ClockCoef.CombinedWithAnnotation.csv) |  |  |  |  |
| [Cattle + Human-Cattle (Blood,Oocyte) Clocks](ClockCoefficients/Cattle-HumanCattle_ClockCoef.CombinedWithAnnotation.csv) |  |  |  |  |
| [Cetacean (Blood,Skin) Clocks](ClockCoefficients/UNPUB_Cetacean_ClockCoef.Combined.csv) | All use ``fun_llin3.inv()`` | Age of Sexual Maturity ( TODO ) | -- | UNPUBLISHED |
| [Cinereus Shrew + Human-Cinereus Shrew (Liver,Tail) Clocks](ClockCoefficients/CinereusShrew-HumanCinereusShrew_ClockCoef.Combined.csv) |  |  |  |  |
| [Dog + Human-Dog (Blood) Clocks](ClockCoefficients/Dog-HumanDog_ClockCoef.CombinedWithAnnotation.csv) |  |  |  |  |
| [Elephants + Human-Elephants (Blood) Clocks](ClockCoefficients/Elephant-HumanElephant_ClockCoef.CombinedWithAnnotation.csv) |  |  |  |  |
| [Equid (Blood) Clock](ClockCoefficients/Horse-Equid-HumanHorse_ClockCoef.CombinedWithAnnotation.csv) | All use ``fun_llin3.inv()`` | Age of Sexual Maturity ( TODO ) | -- | [Horvath, 2022, Nature Communications](https://doi.org/10.1038/s41467-021-27754-y) |
| [Gray Short-Tailed Opossum + Human-Opossum (Liver,Ear,Tail) Clocks](ClockCoefficients/Opossum-HumanOpossum-otherMarsupials_ClockCoef.Combined.csv) |  |  |  | [Horvath, 2022, GeroScience](https://doi.org/10.1007/s11357-022-00569-5) |
| [Horse + Human-Horse (Blood,Liver) Clocks](ClockCoefficients/Horse-Equid-HumanHorse_ClockCoef.CombinedWithAnnotation.csv) |  |  |  | [Horvath, 2022, Nature Communications](https://doi.org/10.1038/s41467-021-27754-y) |
| [Indo-Pacific Bottlenose Dolphin (Skin) Clock](ClockCoefficients/IndoPacificBottlenose_ClockCoef.csv) | -- | -- | -- | [Peters, 2022, Evolutionary Applications](http://doi.org/10.1111/eva.13516) |
| [Killer Whale + Bowhead Whale + Killer-Bowhead Whale (Skin) Clocks](ClockCoefficients/KillerBowhead_ClockCoef.CombinedWithAnnotation.csv) | All use ``fun_sqrt.inv()`` | -- | -- | [Parsons, 2023, Molecular Ecology Resources](http://doi.org/10.1111/1755-0998.13791) |
| [Macropus + Red Kangaroo (Blood) Clocks](ClockCoefficients/Opossum-HumanOpossum-otherMarsupials_ClockCoef.Combined.csv) | -- | -- | -- | [Horvath, 2022, GeroScience](https://doi.org/10.1007/s11357-022-00569-5) |
| [Marmoset + Human-Marmoset (Blood) Clocks](ClockCoefficients/Marmoset-HumanMarmoset_ClockCoef.CombinedWithAnnotation.csv) |  |  |  |  |
| [Marmot (Blood) Clock](ClockCoefficients/Marmot_ClockCoef.csv) | -- | -- | -- | [Pinho, 2022, Nature Ecology & Evolution](https://doi.org/10.1038/s41559-022-01679-1) |
| [Naked Mole Rat + Human-Naked Mole Rat (Pan-Tissue) Clocks](ClockCoefficients/NakedMoleRat-HumanNakedMoleRat_ClockCoef.CombinedWithAnnotation.csv) |  |  |  |  |
| [Odontocete (Blood,Skin) Clocks](ClockCoefficients/Odontocete_ClockCoef.Combined.csv) | All use ``fun_llin2.inv()`` | Age of Sexual Maturity ( TODO ) | Gestation Time ( TODO ) | [Robeck, 2021, Communications Biology](https://doi.org/10.1038/s42003-021-02179-x) |
| [Peromyscus (deer mice) + Human-Peromyscus (Brain,Liver,Tail) Clocks](ClockCoefficients/Peromyscus-HumanPeromyscus_ClockCoef.CombinedWithAnnotation.csv) |  |  |  |  |
| [Pig + Human-Pig (Pan-Tissue) Clocks](ClockCoefficients/Pig-HumanPig_ClockCoef.CombinedWithAnnotation.csv) |  |  |  |  |
| [Pinniped (Blood,Skin) Clocks](ClockCoefficients/Pinniped_ClockCoef.Combined.csv) | -- | -- | -- | [Robeck, 2023, Communications Biology](https://doi.org/10.1038/s42003-023-04734-0) |
| [Rat + Human-Rat (Pan-Tissue) Clocks](ClockCoefficients/PREPRINT_Rat-HumanRat_ClockCoef.CombinedWithAnnotation.csv) |  |  |  |  |
| [Rhesus Macaque + Human-Rhesus Macaque (Pan-Tissue) Clocks](ClockCoefficients/RhesusMacaque-HumanRhesusMacaque_ClockCoef.CombinedWithAnnotation.csv) |  |  |  |  |
| [Roe Deer (Blood) Clock](ClockCoefficients/Deer_ClockCoef.WithAnnotation.csv) | -- | -- | -- | [Lemaître, 2021, Molecular Ecology Resources](https://doi.org/10.1111/1755-0998.13533) |
| [Sheep + Human-Sheep (Blood,Ear) Clocks](ClockCoefficients/Sheep-HumanSheep_ClockCoef.CombinedWithAnnotation.csv) |  |  |  |  |
| [Tasmanian Devil (Skin) Clocks](ClockCoefficients/Opossum-HumanOpossum-otherMarsupials_ClockCoef.Combined.csv) | -- | -- | -- | [Horvath, 2022, GeroScience](https://doi.org/10.1007/s11357-022-00569-5) |
| [Vervet + Human-Vervet (Blood,Cortex,Liver) Clocks](ClockCoefficients/Vervet-HumanVervet_ClockCoef.CombinedWithAnnotation.csv) |  |  |  |  |
