total=$(wc -l < input/mito_genes.txt)
count=0

while read -r gene; do
  count=$((count + 1))
  
  echo "Processing gene $count of $total: $gene"
  
  grep -n -w "$gene" renamed.fasta | cut -d: -f1 | while read -r line_num; do
    sed -n "${line_num},$((line_num+1))p" renamed.fasta >> "genes/${gene}.fasta"
  done
done < input/mito_genes.txt
