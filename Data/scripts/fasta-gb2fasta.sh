#!/bin/bash

mkdir -p gblocks/onerow
for i in gblocks/fasta-gb/*.fasta-gb; do
  gene=$(basename "$i" .onerow.aligned.fasta-gb) #save the prefix
  # Delete all newlines and carriage returns
  tr -d "\r\n" < "$i" > dummy
  tr -d " " < dummy > dummy2
  # Insert newline before every '>'
  sed -i -E "s/>/\n>/g" dummy2
  # Remove the first (empty) line
  awk 'NR>1' dummy2 > dummy
  # Add newline after 9-character header (adjust if your IDs are longer)
  sed -e "s/>.\{9\}/&\n/g" < dummy > "gblocks/onerow/${gene}.gb.fasta"
  # Clean up
  rm dummy dummy2
done
