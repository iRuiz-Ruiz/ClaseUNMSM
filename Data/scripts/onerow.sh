mkdir oneline_alignment
for file in aligned/*.aligned.fasta; do
  gene=$(basename "$file" .aligned.fasta)
  # Remove all newlines
  tr -d "\n" < "$file" > dummy
  # Add newline before each '>'
  sed -i -E 's/>/\n>/g' dummy
  # Remove first empty line
  awk 'NR>1' dummy > dummy2
  # Add newline after ID (assuming 9-character ID)
  sed -e "s/>.\{9\}/&\n/g" < dummy2 > "gblocks/${gene}.onerow.aligned.fasta"
  # Clean up
  rm dummy dummy2
done
