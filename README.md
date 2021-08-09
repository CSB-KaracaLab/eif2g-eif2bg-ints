# Structural modeling of EIF2γ:EIF2Bγ interface (both truncated and full-length isoforms)

This work is an extension of "A C-term truncated EIF2Bγ protein encoded by an intronically polyadenylated isoform introduces unfavorable EIF2Bγ-EIF2γ interactions" study by Ayca Circir, Gozde Koksal Bicakci, Busra Savas, Didem Naz Doken, Onur Henden, Tolga Can, Ezgi Karaca, Ayse Elif Erson-Bensan.

<img src="logo-1.png" alt="logo" />
<img src="logo-2.png" alt="logo" />
## Motivation




## Our folders describe:

- **Models:** contains the PDB files of I-patch domain of both isoforms modelled with I-TASSER, iDrug, TrRosetta, Ab-initio Rosetta and QUARK servers. 
- **Initial_structures:** contains all the relevant input files for HADDOCK runs.
- **HADDOCK_runs:** contains the HADDOCK output files of truncated and full-length isoforms.
- **PQR_files:** contains the input (PDB) and output (PQR) files obtained by PDB2PQR server.
- **Conservation-results:** contains the output page of ConSurf in pdf format.
- **Graph:** contains the electrostatics energy per residue files obtained by HADDOCK, scripts to obtained the electrostatics energies of the best four complexes, excel file including desired values, graph, jupyter notebook script to obtain the graph along with data file. 


  
## To clone the repository

```
git clone https://github.com/CSB-KaracaLab/eif2g-eif2bg-ints.git
```
or if you would like to get the content directly via wget:
```
wget https://github.com/CSB-KaracaLab/eif2g-eif2bg-ints/archive/master.zip
```

## Acknowledgements
This research is supported by EMBO installation grant( (#4421). 

## Contact 
ezgi.karaca@ibg.edu.tr
