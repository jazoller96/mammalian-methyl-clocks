# mammalian-methyl-clocks
Coefficients and age transformations for many mammalian and other intrinsic epigenetic clocks, including references for citing the original publications

## Installing the R package
To install the ``MammalMethylClock`` R package, follow these simple steps:
1.  Download the R package's binary file from the github here (select the arrow symbol): [MammalMethylClock_1.0.0.tgz](MammalMethylClock-Package/MammalMethylClock_1.0.0.tgz)
2.  Open RStudio or R
3.  Enter ``install.packages("~/Downloads/MammalMethylClock_1.0.0.tgz", repos = NULL, type = "win.binary")`` into the R terminal

To begin using the R package, remember to load it with ``library(MammalMethylClock)``

## Tutorial/Example Data: Universal Clock Training Set
The data published by the [Mammalian Methylation Consortium](https://mydata.clockfoundation.org/app/mammalian-consortium-data-browser), which includes the data used for creating the Universal mammalian clocks ([Lu, 2023, Nature Aging](https://doi.org/10.1038/s43587-023-00462-6)), is available through their online browser.

A small subset of this data is available in the [TutorialData](TutorialData) folder for users to use for testing, under the names ``methdatConsortium_subset`` (beta values) and ``infoConsortium`` (sample metadata).  This data is also used in the tutorial vignettes, which demonstrate the recommended pipeline of basic functions provided by this R package.  Simply type `vignette("start", package="MammalMethylClock")`, `vignette("apply", package="MammalMethylClock")`, or `vignette("build", package="MammalMethylClock")`.

## Important remark regarding applying clocks
The table below provides a convenient summary of all of the epigenetic clocks shared within this repository.  In order to correctly apply a specific epigenetic clock, you will want to extract the correct column from the corresponding coefficient (.csv) file.  After taking the weighted sum of methylation values in each of your samples (and including the Intercept term), you must apply the appropriate inverse age transformation to the weighted sum, in order to correctly calculate the DNAm age prediction.  If the age transformation is parameterized by species information, then these parameters will be provided in the columns "Parameter 1" and "Parameter 2".  If the inverse age transformation is NOT specified, then nothing needs to be done.

## Table: Summary of available clocks
| File with Clock Coefficients (and list of tissues for which at least one clock is applicable) | Inverse Age Transformation | Parameter 1 | Parameter 2 | Source Paper |
| :--- | :---: | :---: | :---: | :--- |
| [Bats (Skin) Clocks](ClockCoefficients/Bats_Coef.CombAnn.csv) | All use ``fun_sqrt.inv()`` | -- | -- | [Wilkinson, 2022, Nature Communications](https://doi.org/10.1038/s41467-022-33102-5) |
| [Bottlenose Dolphin (Blood,Skin) Clocks](ClockCoefficients/Bottlenose_Barratclough2021_Coef.CombAnn.csv) | -- | -- | -- | [Barratclough, 2021, Journal of Zoological and Botanical Gardens](https://doi.org/10.3390/jzbg2030030) |
| [Bottlenose Dolphin (Blood,Skin) Clocks](ClockCoefficients/Bottlenose_Robeck2021_Coef.CombAnn.csv) | All use ``fun_llin2.inv()`` | (Age of Sexual Maturity) <br /> 8.93 | (Gestation Time) <br /> 1.03 | [Robeck, 2021, Frontiers in Marine Science](https://doi.org/10.3389/fmars.2021.713373) |
| [Cat + Human-Cat (Blood) Clocks](ClockCoefficients/Cat+HumanCat_Coef.CombAnn.csv) | Human-Animal uses ``fun_llin3.inv()`` | (Age of Sexual Maturity) <br /> Cat: 0.7918 <br /> Human: 13.5 | -- | [Raj, 2021, GeroScience](https://doi.org/10.1007/s11357-021-00445-8) |
| [Cattle + Human-Cattle (Blood,Oocyte) Clocks](ClockCoefficients/Cattle+HumanCattle_Coef.CombAnn.csv) | Human-Animal uses ``fun_llin3.inv()`` | (Age of Sexual Maturity) <br /> Cattle: 1.501 <br /> Human: 13.5 | -- | [Kordowitzki, 2021, Aging Cell](https://doi.org/10.1111/acel.13349) |
| [Cetacean (Blood,Skin) Clocks](ClockCoefficients/UNPUB_Cetacean_Coef.Comb.csv) | All use ``fun_llin2.inv()`` | (Age of Sexual Maturity) <br /> <See [AnAge database](https://genomics.senescence.info/species/index.html) > | (Gestation Time) <br /> <See [AnAge database](https://genomics.senescence.info/species/index.html) > | UNPUBLISHED |
| [Cinereus Shrew + Human-Cinereus Shrew (Liver,Tail) Clocks](ClockCoefficients/CinereusShrew+HumanCinereusShrew_Coef.Comb.csv) | Human-Animal uses ``fun_llin3.inv()`` | (Age of Sexual Maturity) <br /> Cinereus: 0.4219 <br /> Human: 13.5 | -- | [Cossette, 2022, Molecular Ecology](https://doi.org/10.1111/mec.16735) |
| [Common Marmoset + Human-Marmoset (Blood) Clocks](ClockCoefficients/Marmoset+HumanMarmoset_Coef.CombAnn.csv) | Human-Animal uses ``fun_llin3.inv()`` | (Age of Sexual Maturity) <br /> Marmoset: 1.177 <br /> Human: 13.5 | -- | [Horvath, 2021, GeroScience](https://doi.org/10.1007/s11357-021-00438-7) |
| [Dog + Human-Dog (Blood) Clocks](ClockCoefficients/Dog+HumanDog_Coef.CombAnn.csv) | Human-Animal uses ``fun_llin3.inv()`` | (Age of Sexual Maturity) <br /> Dog: 1.833 <br /> Human: 13.5 | -- | [Horvath, 2022, PNAS](https://doi.org/10.1073/pnas.2120887119) |
| [Elephants + Human-Elephants (Blood) Clocks](ClockCoefficients/Elephant+HumanElephant_Coef.CombAnn.csv) | Human-Animal uses ``fun_llin3.inv()`` | (Age of Sexual Maturity) <br /> African: 10.5 <br /> Asian: 9.005 <br /> Human: 13.5 | -- | [Prado, 2021, Aging Cell](https://doi.org/10.1111/acel.13414) |
| [Equid (Blood) Clock](ClockCoefficients/Horse+Equid+HumanHorse_Coef.CombAnn.csv) | All use ``fun_llin3.inv()`` | (Age of Sexual Maturity) <br /> <See Suppl. Information\> | -- | [Horvath, 2022, Nature Communications](https://doi.org/10.1038/s41467-021-27754-y) |
| [Gray Short-Tailed Opossum + Human-Opossum (Liver,Ear,Tail) Clocks](ClockCoefficients/Opossum+HumanOpossum+otherMarsupials_Coef.Comb.csv) | Human-Animal uses ``fun_llin3.inv()`` | (Age of Sexual Maturity) <br /> Opossum: 0.3342 <br /> Human: 13.5 | -- | [Horvath, 2022, GeroScience](https://doi.org/10.1007/s11357-022-00569-5) |
| [Horse + Human-Horse (Blood,Liver) Clocks](ClockCoefficients/Horse+Equid+HumanHorse_Coef.CombAnn.csv) | Human-Animal uses ``fun_llin3.inv()`` | (Age of Sexual Maturity) <br /> Horse: 2.585 <br /> Human: 13.5 | -- | [Horvath, 2022, Nature Communications](https://doi.org/10.1038/s41467-021-27754-y) |
| [Indo-Pacific Bottlenose Dolphin (Skin) Clock](ClockCoefficients/IndoPacificBottlenose_Coef.csv) | -- | -- | -- | [Peters, 2022, Evolutionary Applications](http://doi.org/10.1111/eva.13516) |
| [Killer Whale + Bowhead Whale + Killer-Bowhead Whale (Skin) Clocks](ClockCoefficients/KillerBowhead_Coef.CombAnn.csv) | All use ``fun_sqrt.inv()`` | -- | -- | [Parsons, 2023, Molecular Ecology Resources](http://doi.org/10.1111/1755-0998.13791) |
| [Lemurs (Blood,Skin) Clocks](ClockCoefficients/PREPRINT_Bab+Lemur+HumanBab+Primate_Coef.CombAnn.csv) | -- | -- | -- | [Horvath, 2021, bioRxiv](https://www.biorxiv.org/content/10.1101/2020.11.29.402891v2) |
| [Macropus + Red Kangaroo (Blood) Clocks](ClockCoefficients/Opossum+HumanOpossum+otherMarsupials_Coef.Comb.csv) | -- | -- | -- | [Horvath, 2022, GeroScience](https://doi.org/10.1007/s11357-022-00569-5) |
| [Marmot (Blood) Clock](ClockCoefficients/Marmot_Coef.csv) | -- | -- | -- | [Pinho, 2022, Nature Ecology & Evolution](https://doi.org/10.1038/s41559-022-01679-1) |
| [Mouse (All) Clocks](ClockCoefficients/Mouse_Coef.CombAnn.csv) | All use ``fun_llinmouse.inv()`` | -- | -- | [Mozhui, 2022, eLife](https://doi.org/10.7554/eLife.75244) |
| [Naked Mole Rat + Human-Naked Mole Rat (All) Clocks](ClockCoefficients/NakedMoleRat+HumanNakedMoleRat_Coef.CombAnn.csv) | Human-Animal uses ``fun_llin3.inv()`` | (Age of Sexual Maturity) <br /> NMR: 5.0 <br /> Human: 13.5 | -- | [Horvath, 2022, Nature Aging](https://doi.org/10.1038/s43587-021-00152-1) |
| [Odontocete (Blood,Skin) Clocks](ClockCoefficients/Odontocete_Coef.Comb.csv) | All use ``fun_llin2.inv()`` | (Age of Sexual Maturity) <br /> <See Suppl. Tab. 1> | (Gestation Time) <br /> <See Suppl. Tab. 1> | [Robeck, 2021, Communications Biology](https://doi.org/10.1038/s42003-021-02179-x) |
| [Olive Baboon + Human-Baboon (All) Clocks](ClockCoefficients/PREPRINT_Bab+Lemur+HumanBab+Primate_Coef.CombAnn.csv) | Human-Animal uses ``fun_llin3.inv()`` | (Age of Sexual Maturity) <br /> Baboon: 4.488 <br /> Human: 13.5 | -- | [Horvath, 2021, bioRxiv](https://www.biorxiv.org/content/10.1101/2020.11.29.402891v2) |
| [Peromyscus (deer mice) + Human-Peromyscus (Brain,Liver,Tail) Clocks](ClockCoefficients/Peromyscus+HumanPeromyscus_Coef.CombAnn.csv) | Human-Animal uses ``fun_llin3.inv()`` | (Age of Sexual Maturity) <br /> <See Suppl. Information\> | -- | [Horvath, 2022, GeroScience](https://doi.org/10.1007/s11357-021-00472-5) |
| [Pig + Human-Pig (All) Clocks](ClockCoefficients/Pig+HumanPig_Coef.CombAnn.csv) | Human-Animal uses ``fun_llin3.inv()`` | (Age of Sexual Maturity) <br /> Pig: 0.4583 <br /> Human: 13.5 | -- | [Schachtschneider, 2021, GeroScience](https://doi.org/10.1007/s11357-021-00439-6) |
| [Pinniped (Blood,Skin) Clocks](ClockCoefficients/Pinniped_Coef.Comb.csv) | -- | -- | -- | [Robeck, 2023, Communications Biology](https://doi.org/10.1038/s42003-023-04734-0) |
| [Plains Zebra (Blood,Skin) Clocks](ClockCoefficients/Zebra_Coef.Comb.csv) | All use ``fun_sqrt.inv()`` | -- | -- | [Larison, 2021, Communications Biology](https://doi.org/10.1038/s42003-021-02935-z) |
| [Primate (All) Clocks](ClockCoefficients/PREPRINT_Bab+Lemur+HumanBab+Primate_Coef.CombAnn.csv) | Uses ``fun_sqrt.inv()`` | -- | -- | [Horvath, 2021, bioRxiv](https://www.biorxiv.org/content/10.1101/2020.11.29.402891v2) |
| [Rat + Human-Rat (All) Clocks](ClockCoefficients/PREPRINT_Rat+HumanRat_Coef.CombAnn.csv) | Human-Animal uses ``fun_llin3.inv()`` | (Age of Sexual Maturity) <br /> Rat: 0.2192 <br /> Human: 13.5 | -- | [Horvath, 2020, bioRxiv](https://www.biorxiv.org/content/10.1101/2020.05.07.082917v1) |
| [Rhesus Macaque + Human-Rhesus Macaque (All) Clocks](ClockCoefficients/RhesusMacaque+HumanRhesusMacaque_Coef.CombAnn.csv) | Human-Animal uses ``fun_llin3.inv()`` | (Age of Sexual Maturity) <br /> Macaque: 4.436 <br /> Human: 13.5 | -- | [Horvath, 2021, GeroScience](https://doi.org/10.1007/s11357-021-00429-8) |
| [Roe Deer (Blood) Clock](ClockCoefficients/Deer_Coef.WithAnnotation.csv) | -- | -- | -- | [Lemaître, 2021, Molecular Ecology Resources](https://doi.org/10.1111/1755-0998.13533) |
| [Sheep + Human-Sheep (Blood,Ear) Clocks](ClockCoefficients/Sheep+HumanSheep_Coef.CombAnn.csv) | Human-Animal uses ``fun_llin3.inv()`` | (Age of Sexual Maturity) <br /> Sheep: 2.003 <br /> Human: 13.5 | -- | [Sugrue, 2021, eLife](https://doi.org/10.7554/elife.64932) |
| [Tasmanian Devil (Ear) Clocks](ClockCoefficients/Opossum+HumanOpossum+otherMarsupials_Coef.Comb.csv) | -- | -- | -- | [Horvath, 2022, GeroScience](https://doi.org/10.1007/s11357-022-00569-5) |
| [Universal (All) Clocks](ClockCoefficients/Universal_Coef.CombAnn.csv) | Chronologic Age ("clock 3") use ``fun_llinreladult.inv()`` | (Age of Sexual Maturity) <br /> <See Suppl. Dat. 1.13> | (Gestation Time) <br /> <See Suppl. Dat. 1.13> | [Lu, 2023, Nature Aging](https://doi.org/10.1038/s43587-023-00462-6) |
| [Vervet + Human-Vervet (Blood,Cortex,Liver) Clocks](ClockCoefficients/Vervet+HumanVervet_Coef.CombAnn.csv) | Human-Animal uses ``fun_llin3.inv()`` | (Age of Sexual Maturity) <br /> Vervet: 3.916 <br /> Human: 13.5 | -- | [Jasinska, 2022, GeroScience](https://doi.org/10.1007/s11357-021-00466-3) |
| [Xenopus (clawed frogs) + Human-Xenopus (All) Clocks](ClockCoefficients/Xeno+HumanXeno_Coef.CombAnn.csv) | Dual-Xenopus and Human-Animal use ``fun_llin3.inv()`` | (Age of Sexual Maturity) <br /> X.laevis: 1.0 <br /> X.tropicalis: 0.375 <br /> Human: 13.5 | -- | [Zoller, 2023, GeroScience](https://doi.org/10.1007/s11357-023-00840-3) |
