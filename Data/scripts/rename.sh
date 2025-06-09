#rename the mitogenomic names
#delete repetitive information
sed -E 's/^>lcl\|/>/; s/ \[locus_tag=.*//; s/[\[\]]//g' onerow_mito.fasta > temp.fasta
#delete unncesary information and format it to >Accesion_Code_ND1
sed -E 's/^>([^.]+)\.[0-9]+_cds_[^ ]+ \[gene=([^]]+)\]/>\1.\2/' temp.fasta > temp1.fasta
#delete other patterns
sed '/^>/ s/ .*$//' temp1.fasta > renamed.fasta
rm temp.fasta temp1.fasta