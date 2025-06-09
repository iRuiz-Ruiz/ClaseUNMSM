#------------ format into a single line fasta for NCBI mitogenome files
#delete enter in all the file
tr -d "\n" < ../Data/genbank_file.fasta > dummy
#includes an "enter" per specie
sed -i -E "s/>/\n>/g" dummy
#delete first empty row
awk 'NR>1' dummy > dummy2
#add enter to ID, only considers the first eight characters, but you could consider a longer name changing the "8" (e.g. 10) 
sed -e 's/CDS]/CDS]\n/g' < dummy2 > ../Data/onerow_mito.fasta
rm dummy dummy2