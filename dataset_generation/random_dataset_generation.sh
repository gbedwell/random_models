module load gcc/6.2.0
module load bedtools/2.27.1

for i in $(seq 10000 10000 100000)
do mkdir ${i}
  for j in {1..10}; do
    shuf -n ${i} mapped_random_sites.bed | awk -v var1="$i" -v var2="$j" '{OFS="\t"}{print $1,$2,$3,$4,var2,var1}' > ${i}/MRC_${j}.bed
  done
  for f in ${i}/MRC_*.bed; do
    bedtools intersect -a $f -b /home/gjb16/model_generation/gencode_v19_unique_curated_genes.bed -wb | awk '{OFS="\t"}{print $1,$2,$3,$4,$10,$8,$9,$12,$5,$6}' > ${f%%.*}_matched.bed
  done
done

i=15000
mkdir $i
for j in {1..10}; do
  shuf -n $i mapped_random_sites.bed | awk -v var1="$i" -v var2="$j" '{OFS="\t"}{print $1,$2,$3,$4,var2,var1}' > $i/MRC_${j}.bed
done
for f in $i/MRC_*.bed; do
  bedtools intersect -a $f -b /home/gjb16/model_generation/gencode_v19_unique_curated_genes.bed -wb | awk '{OFS="\t"}{print $1,$2,$3,$4,$10,$8,$9,$12,$5,$6}' > ${f%%.*}_matched.bed
done

i=150000
mkdir $i
for j in {1..10}; do
  shuf -n $i mapped_random_sites.bed | awk -v var1="$i" -v var2="$j" '{OFS="\t"}{print $1,$2,$3,$4,var2,var1}' > $i/MRC_${j}.bed
done
for f in $i/MRC_*.bed; do
  bedtools intersect -a $f -b /home/gjb16/model_generation/gencode_v19_unique_curated_genes.bed -wb | awk '{OFS="\t"}{print $1,$2,$3,$4,$10,$8,$9,$12,$5,$6}' > ${f%%.*}_matched.bed
done

for i in $(seq -f "%.0f" 200000 100000 1000000)
do mkdir ${i}
  for j in {1..10}; do
    shuf -n ${i} mapped_random_sites.bed | awk -v var1="$i" -v var2="$j" '{OFS="\t"}{print $1,$2,$3,$4,var2,var1}' > ${i}/MRC_${j}.bed
  done
  for f in ${i}/MRC_*.bed; do
    bedtools intersect -a $f -b /home/gjb16/model_generation/gencode_v19_unique_curated_genes.bed -wb | awk '{OFS="\t"}{print $1,$2,$3,$4,$10,$8,$9,$12,$5,$6}' > ${f%%.*}_matched.bed
  done
done
